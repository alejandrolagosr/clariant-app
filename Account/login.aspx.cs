using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace ClariantApp.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Roles.IsUserInRole("Administrador"))
                Response.Redirect("~/admin/info.aspx");
        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                if (Roles.IsUserInRole(Login1.UserName, "Administrador"))
                    Response.Redirect("~/admin/info.aspx");
            }
        }
    }
}
