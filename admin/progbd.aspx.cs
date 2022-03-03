using System;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClariantApp.AdminPages
{
    public partial class importar : System.Web.UI.Page
    {
        public static string connection =
            System.Configuration.ConfigurationManager.ConnectionStrings["clariantDBConnectionString"].ConnectionString;

        CultureInfo cultureInfo = new CultureInfo("pt-BR");

        protected void Page_Load(object sender, EventArgs e) 
        {
            ddlSheets.DataBind();
        }

        protected OleDbCommand ExcelConnection(string PathExcel, string NombreSheet)
        {
            string excelConnection = 
                @"provider=Microsoft.ACE.OLEDB.12.0;data source=" + PathExcel + ";Extended Properties='Excel 12.0 Xml;HDR=YES;'";

            OleDbConnection oleDbConnection = new OleDbConnection(excelConnection);

            oleDbConnection.Open();
            OleDbCommand oleDbCommand = new OleDbCommand
                ("SELECT [Create],[Lote],[data e Hora - início],[Qtd],[F11],[Término Real],[Número da Ordem] From [" + NombreSheet + "$]", oleDbConnection);

            return oleDbCommand;
        } 

        protected void ibtnAgregarSheet_Click(object sender, ImageClickEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNombre.Text))
            {
                if (!string.IsNullOrWhiteSpace(txtNombre.Text))
                {
                    SqlDataSourceSheets.Insert();

                    lblStatus.Text = "<b>Se agregó nuevo Sheet:</b> " + txtNombre.Text;
                    txtNombre.Text = null;
                }
            }
        }

        protected void ibtnEliminarSheet_Click(object sender, ImageClickEventArgs e)
        {
            SqlDataSourceSheets.Delete();

            lblStatus.Text = "<b>Se eliminó Sheet exitosamente</b> ";
            txtNombre.Text = null;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                string archivoExcel = Path.GetFileName(fileUpload.FileName);

                if (Regex.IsMatch(archivoExcel, @"(\w[\w].*)(.xlsx|.XLSX)$") == true)
                {
                    string path = Server.MapPath("~/uploads/" + archivoExcel);
                    fileUpload.SaveAs(path);

                    lblUploadStatus.Text = "<b>Transmisión Exitosa </b>[" + fileUpload.PostedFile.FileName +", " 
                                                                          + fileUpload.PostedFile.ContentLength  + " Kb.]<br />";
                    lblPathExcel.Text = path;

                    btnImportarTodo.Enabled = true;
                    fileUpload.Enabled = false;
                    btnUpload.Enabled = false;
                }
                else
                    lblUploadStatus.Text = "La extensión del archivo es <b>incorrecta</b>.<br />" +
                                           "solo es posible importar Prog-BD en formato 'XLSX'";
            }
        }

        protected void ImportarSheet(string pathExcel, string sheet)
        {
            try
            {
                OleDbCommand oleDbCommand = new OleDbCommand();
                oleDbCommand = ExcelConnection(pathExcel, sheet);

                OleDbDataReader dataReader = oleDbCommand.ExecuteReader();

                string codigo = "";
                string lote = "";
                string cantidad = "";
                string inicio = "";
                string finPlaneado = "";
                string finReal = "";
                string orden = "";

                while (dataReader.Read())
                {
                    codigo = Casting(dataReader, 0);
                    lote = Casting(dataReader, 1);
                    inicio = Casting(dataReader, 2);
                    cantidad = Casting(dataReader, 3);
                    finPlaneado = Casting(dataReader, 4);
                    finReal = Casting(dataReader, 5);
                    orden = Casting(dataReader, 6);

                    SqlConnection sqlConnection = new SqlConnection(connection);
                    SqlCommand sqlCommand = new SqlCommand("sp_ImportarProg", sqlConnection);
                    sqlCommand.Connection = sqlConnection;

                    bool validFinPlan = false;
                    bool validFinReal = false;
                    DateTime dtFinPlan = new DateTime();
                    DateTime dtFinReal = new DateTime();
                    DateTime dtInicio = new DateTime();

                    if (codigo != "0")
                    {
                        if (orden != "")
                        {
                            if (inicio != "")
                            {
                                dtInicio = DateTime.Parse(inicio, cultureInfo);

                                if (dtInicio.Year >= DateTime.Now.Year || (dtInicio.Month == 12 && dtInicio.Day == 31))
                                {

                                    sqlCommand.Parameters.Add("@dtInicio", SqlDbType.DateTime).Value = dtInicio;

                                    if (finPlaneado == "")
                                    {
                                        sqlCommand.Parameters.AddWithValue("@dtFinPlaneado", DBNull.Value);
                                    }
                                    else
                                    {
                                        dtFinPlan = DateTime.Parse(finPlaneado, cultureInfo);

                                        if (dtFinPlan.Year >= DateTime.Now.Year)
                                        {
                                            sqlCommand.Parameters.Add("@dtFinPlaneado", SqlDbType.DateTime).Value = dtFinPlan;
                                            validFinPlan = true;
                                        }
                                    }

                                    if (finReal == "")
                                    {
                                        sqlCommand.Parameters.AddWithValue("@dtFinReal", DBNull.Value);
                                    }
                                    else
                                    {
                                        dtFinReal = DateTime.Parse(finReal, cultureInfo);

                                        if (dtFinReal.Year >= DateTime.Now.Year)
                                        {
                                            sqlCommand.Parameters.Add("@dtFinReal", SqlDbType.DateTime).Value = dtFinReal;
                                            validFinReal = true;
                                        }
                                        else //Maneja el caso: Inicio y Planeado validos, pero Real invalido.
                                        {
                                            validFinPlan = false;
                                            validFinReal = false;
                                        }
                                    }
                                }
                            }
                        }

                        if (validFinPlan == true || validFinReal == true)
                        {
                            sqlCommand.Parameters.Add("@codigo", SqlDbType.BigInt).Value = codigo;
                            sqlCommand.Parameters.Add("@lote", SqlDbType.VarChar).Value = lote;
                            sqlCommand.Parameters.Add("@qtd", SqlDbType.BigInt).Value = cantidad;
                            sqlCommand.Parameters.Add("@orden", SqlDbType.VarChar).Value = orden;
                            sqlCommand.Parameters.Add("@sheet", SqlDbType.VarChar).Value = sheet;

                            sqlCommand.CommandType = CommandType.StoredProcedure;

                            sqlConnection.Open();
                            sqlCommand.ExecuteNonQuery();
                            sqlConnection.Close();
                        }
                    }
                }
                dataReader.Close();
            }    
            catch (DataException dataException)
            {
                lblUploadStatus.Text = "<b>Error:</b><br />" + dataException.Message;
            }
        }

        protected string Casting(OleDbDataReader reader, int stval)
        {
            object val = reader[stval];
            if (val != DBNull.Value)
                return val.ToString();
            else
                return Convert.ToString("");
        }

        protected void ddlSheets_OnSelectedIndex(object sender, EventArgs e){ }



        protected void btnImportarTodo_Click(object sender, EventArgs e)
        {
            foreach (ListItem sheet in ddlSheets.Items)
            {
                ImportarSheet(lblPathExcel.Text, sheet.Value);
            }

            imgOk.Visible = true;
            btnImportarTodo.Enabled = false;
        }

        protected void lbtnAdminSheets_Click(object sender, EventArgs e)
        {
            PanelSheet.Visible = true;
        }

        protected void lbtnCancelarUploadSheet_Click(object sender, EventArgs e)
        {
            PanelSheet.Visible = false;
            txtNombre.Text = null;
        }

        protected void ibtnRegresar_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/admin/info.aspx");
           // ELIMINAR ARCHIVOS USADOS
        }

        protected void ibtnBorrar_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(connection);
            SqlCommand sqlCommand = new SqlCommand("DELETE FROM Prog", sqlConnection);

            sqlConnection.Open();
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();

            ibtnBorrar.Enabled = false;
        }
    }
}