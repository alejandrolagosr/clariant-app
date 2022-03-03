using System;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;

namespace ClariantApp.admin
{
    public partial class ybf2 : System.Web.UI.Page
    {
        public static string connectionString = 
            System.Configuration.ConfigurationManager.ConnectionStrings["clariantDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e) { }

        protected OleDbCommand ExcelConnection(string ExcelPath)
        {
            string excelConnection =
                @"provider=Microsoft.ACE.OLEDB.12.0;data source=" + ExcelPath + ";Extended Properties='Excel 12.0 Xml;HDR=YES;'";

            OleDbConnection oleDbConnection = new OleDbConnection(excelConnection);

            oleDbConnection.Open();
            OleDbCommand oleDbCommand = new OleDbCommand("SELECT [Material],[TxtBreveMaterial] FROM [Hoja1$]", oleDbConnection);

            return oleDbCommand;
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

                    lblUploadStatus.Text = "<b>Transmisión Exitosa </b>[" + fileUpload.PostedFile.FileName + ", "
                                                                          + fileUpload.PostedFile.ContentLength + " KB] ";
                    lblPathExcel.Text = path;

                    btnImportar.Enabled = true;
                    fileUpload.Enabled = false;
                    btnUpload.Enabled = false;
                }
                else
                    lblUploadStatus.Text = "La extensión del archivo es <b>incorrecta</b>.<br />" +
                                           "solo es posible importar YBF2 en formato 'XLSX'";
            }
        }

        protected void btnImportar_Click(object sender, EventArgs e)
        {
            try
            {
                OleDbCommand oleDbCommand = new OleDbCommand();
                oleDbCommand = ExcelConnection(lblPathExcel.Text);

                OleDbDataReader dataReader = oleDbCommand.ExecuteReader();

                string codigo = "";
                string producto = "";

                while (dataReader.Read())
                {
                    codigo = Casting(dataReader, 0);
                    producto = Casting(dataReader, 1);

                    SqlConnection sqlConnection = new SqlConnection(connectionString);
                    SqlCommand sqlCommand = new SqlCommand("sp_ImportarYbf2", sqlConnection);

                    if (codigo != "" && producto != "")
                    {
                        sqlCommand.Parameters.Add("@codigo", SqlDbType.VarChar).Value = codigo;
                        sqlCommand.Parameters.Add("@producto", SqlDbType.VarChar).Value = producto;

                        sqlCommand.CommandType = CommandType.StoredProcedure;

                        sqlConnection.Open();
                        sqlCommand.ExecuteNonQuery();
                        sqlConnection.Close();
                    }
                }
            }
            catch
            {

            }

            imgOk.Visible = true;
            btnImportar.Enabled = false;
        }

        protected string Casting(OleDbDataReader reader, int stval)
        {
            object val = reader[stval];
            if (val != DBNull.Value)

                return val.ToString();
            else
                return Convert.ToString("");
        }
    }
}