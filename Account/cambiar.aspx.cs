using System;
using System.Web.Security;

namespace ClariantApp.Account
{
    public partial class cambiar_contrasena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void ChangePassword_ContinueButtonClick(object sender, EventArgs e)
        {
            if (Roles.IsUserInRole("Administrador"))
                Response.Redirect("~/admin/info.aspx");
        }
    }
}