using BusinessDataLayer;
using DotNetNuke.Entities.Users;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserLoginDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btngetDetail_Click(object sender, EventArgs e)
    {
        BusinessLogic objBusinessLogic = new BusinessLogic();
        DataTable dt = new DataTable();
        dt = objBusinessLogic.OTPVerification(txtMobileNumber.Text.Trim(), string.Empty, 1);
        int liUserId = 0;
        bool lbIsVerified = false;
        bool lbIsOtpExpired = false;
        liUserId = Convert.ToInt32(dt.Rows[0]["UserId"]);
        lbIsVerified = Convert.ToBoolean(dt.Rows[0]["IsVerified"]);
        lbIsOtpExpired = Convert.ToBoolean(dt.Rows[0]["IsOTPExpired"]);

        if (liUserId > 0)
        {
            pnloginDetail.Visible = true;
            lblError.Visible = false;
            UserInfo oUser = new UserInfo();
            oUser = UserController.GetUserById(0, liUserId);
            MembershipUser objUser = Membership.GetUser(oUser.Username);
            string LsPassword = objUser.GetPassword();
            string lsOTPCode = string.Empty;
            string lsUserNAme = string.Empty;
            string lsPassword = string.Empty;
            lsOTPCode = oUser.Profile.GetPropertyValue("OTP");
            lsUserNAme = oUser.Username;
            lsPassword = objUser.GetPassword();

            lblOTPCode.Text = lsOTPCode;
            lblUsername.Text = lsUserNAme;
            lblPAssword.Text = lsPassword;
        }
        else
        {
            pnloginDetail.Visible = false;
            lblError.Visible = true;
            lblError.Text = "Mobile number not registered";
        }
    }
}