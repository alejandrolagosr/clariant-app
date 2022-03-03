using System;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace ClariantApp.AdminPages
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void AssignUserToRole_Activate(object sender, EventArgs e)
        {
            ddlRoles.DataSource = Roles.GetAllRoles();
            ddlRoles.DataBind();
        }

        public void AssignUserToRole_Deactivate(object sender, EventArgs e)
        {
            Roles.AddUserToRole(CreateUserWizard.UserName, ddlRoles.SelectedValue);
        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/admin/info.aspx", true);
        }
    }
}