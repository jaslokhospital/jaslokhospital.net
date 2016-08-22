using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Users;
using DotNetNuke.Security;
using DotNetNuke.Security.Membership;
using DotNetNuke.Security.Roles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_Home_AdminHeader : System.Web.UI.UserControl
{
    PortalSecurity secure = new PortalSecurity();
    RoleController dnnrole = new RoleController();
    Boolean role = false;
    protected void Page_Load(object sender, EventArgs e)
    
    {
        UserInfo user = UserController.GetCurrentUserInfo();
        if (user.UserID == -1)
        {
            anchlogin.Visible = true;
            anchlogout.Visible = false;
            //Response.Write(user.UserID);
        }
        else
        {
            anchlogout.Visible = true;
            anchlogin.Visible = false;

            //Response.Redirect("/JaslokAdmin/home");
        }
    }

    protected void SignIn(object sender, EventArgs e)
    {
        UserInfo user = UserController.GetCurrentUserInfo();
        if (user.UserID != -1)
        {
            secure.SignOut();
            Response.Redirect("/", false);
        }
    }

    //protected void lbtnlogin_Click(object sender, EventArgs e)
    //{
    //    if (txtLUserName.Text.Trim() != null && txtLUserName.Text.Trim() != null)
    //    {
    //        UserInfo objUser = new UserInfo();
    //        objUser.Username = txtLUserName.Text;
    //        UserMembership objMembership = new UserMembership(objUser);
    //        objMembership.Username = txtLUserName.Text;
    //        objMembership.Password = txtLUserPassword.Text;
    //        objUser.Membership = objMembership;
    //        PortalSettings po = new PortalSettings();
    //        UserLoginStatus loginStatus = UserLoginStatus.LOGIN_FAILURE;
    //        UserInfo objUserInfo = UserController.ValidateUser(0, txtLUserName.Text, txtLUserPassword.Text, "DNN", "", po.PortalName, this.Request.UserHostAddress, ref loginStatus);
    //        if (loginStatus == UserLoginStatus.LOGIN_SUCCESS || loginStatus == UserLoginStatus.LOGIN_SUPERUSER)
    //        {
    //            UserController.UserLogin(0, objUser, Request.ServerVariables["SERVER_NAME"], this.Request.UserHostAddress, true);
    //            Response.Redirect("/");
    //        }
    //        else
    //        {
    //            Response.Write("Fail");
    //        }
    //    }
    //    txtLUserName.Text = "";
    //    txtLUserPassword.Text = "";

    //}
}