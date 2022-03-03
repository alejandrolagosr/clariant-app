using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClariantApp.AdminPages
{
    public partial class admin : System.Web.UI.Page
    {
        public static string connection =
           System.Configuration.ConfigurationManager.ConnectionStrings["clariantDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtInicio.Text = ObtenerPrimerDia(DateTime.Now).ToString("dd/MM/yy");
                txtFinal.Text = ObtenerUltimoDia(DateTime.Now).ToString("dd/MM/yy");

                ddcbSheet.DataBind();
                foreach (ListItem item in ddcbSheet.Items)
                    item.Selected = true;
            }
        }

        public DateTime ObtenerPrimerDia(DateTime dateTime)
        {
            return new DateTime(dateTime.Year, dateTime.Month, 1);
        }

        public DateTime ObtenerUltimoDia(DateTime dateTime)
        {
            DateTime primerDia = new DateTime(dateTime.Year, dateTime.Month, 1);
            return primerDia.AddMonths(1);
        }

        protected void btnExportarExcel_Click(object sender, EventArgs e) { }

        protected void txtSearch_TextChanged1(object sender, EventArgs e) { }

        double totalQty = 0;

        protected void gridPrincipal_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                totalQty += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Cantidad"));
                lblCantidad.Text = (totalQty / 1000).ToString();

                ViewState["Data"] = e.Row.Cells[1].Text;
                if (e.Row.Cells[1].Text.Length >= 25)
                {
                    e.Row.Cells[1].Text = e.Row.Cells[1].Text.Substring(0, 25) + "...";
                    e.Row.Cells[1].ToolTip = ViewState["Data"].ToString();
                }
            }
        }

        protected void dsGridView_Filtering(object sender, SqlDataSourceFilteringEventArgs e)
        {
            if (ddcbSheet.SelectedIndex == -1)
            {
                lblCantidad.Text = "0";
            }
        }
    }
}