using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Users;
using DotNetNuke.Entities.Profile;
using DotNetNuke.Security;
using DotNetNuke.Security.Membership;
using DotNetNuke.Services.Authentication;
using DotNetNuke.Security.Roles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BusinessDataLayer;
using System.Data;
using System.IO;
using net.jaslokhospital.jaslokwebserver;
using System.Data.SqlClient;
using System.Configuration;
using DotNetNuke.Entities.Host;
using System.Xml;
using System.Xml.Linq;
using System.Text;

public partial class JSControls_Home_Header : System.Web.UI.UserControl
{
    PortalSecurity secure = new PortalSecurity();
    RoleController dnnrole = new RoleController();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    Boolean role = false;

    BusinessLogic objBusinessLogic = new BusinessLogic();
    DataTable ds = new DataTable();

    UserLoginStatus loginStatus = new UserLoginStatus();
    DataTable AllMenus = new DataTable();
    /*net.jaslokhospital.jaslokwebserver.PatIndex objPatIndex = new net.jaslokhospital.jaslokwebserver.PatIndex();
    localhost.PatIndex objlocalPatIndex = new localhost.PatIndex();
    string host = HttpContext.Current.Request.Url.GetComponents(UriComponents.HostAndPort, UriFormat.Unescaped);
	*/
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Session["IsVisitor"] != null)
                {
                    UserInfo objuser = UserController.Instance.GetCurrentUserInfo();
                    if (!string.IsNullOrEmpty(objuser.Username))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){PermanentRegReminderBox();});", true);
                        Session["IsVisitor"] = null;
                    }
                }
                LoadMenus();
            }

            this.Page.Form.DefaultButton = LoginBtn.UniqueID;
            UserInfo user = UserController.Instance.GetCurrentUserInfo();
            hdnUserId.Value = user.UserID.ToString();

            if (user.Username == "host")
            {
                lblmBox.Text = "Reset MailBox";
                amBox.HRef = "/reset-mailbox";
                limBox.Visible = true;
            }

            if (user.UserID == -1)
            {
                //anchlogin.Visible = true;
                liLogin.Visible = false;
                liLogout.Visible = false;
                //Response.Write(user.UserID);
                liAhome.Visible = false;
            }
            else
            {
                liLogin.Visible = false;
                liLogout.Visible = true;
                //anchlogin.Visible = false;z

                UserInfo userinfo = UserController.GetUserById(0, user.UserID);
                if (userinfo.IsInRole("Administrators"))
                {
                    lblAhome.Visible = true;
                    lblAhome.Text = "Jaslok Admin";
                    anchorAhome.HRef = "/JaslokAdmin/home";
                }
            }
            //if (Request.RawUrl.Length < 1)
            //{
            //}
            IsMNumberExist();
        }
        catch (Exception ex)
        {
            // Response.Write(ex.ToString());
        }
    }

    protected void SignIn(object sender, EventArgs e)
    {
        UserInfo user = UserController.Instance.GetCurrentUserInfo();
        if (user.UserID != -1)
        {
            secure.SignOut();
            Response.Redirect("/", false);
            Session["IsVisitor"] = null;
        }
    }

    protected void lnkForgotPassword_Click(object sender, EventArgs e)
    {
        divSignUp.Attributes.Add("style", "display:none;");
        divLoginForm.Attributes.Add("style", "display:none;");
        divOTPVerification.Attributes.Add("style", "display:none;");
        divForgotPassword.Attributes.Add("style", "display:block;");
        litPopUpTitle.Text = "Forgot Password";

        txtForgotPasswordUserName.Text = string.Empty;
        pForgotPassWord.Attributes.Add("style", "display:none;");
        pVerifyUser.Attributes.Add("style", "display:block;");
        pSignUp.Attributes.Add("style", "display:block;");
        pSignIn.Attributes.Add("style", "display:block;");
        lblForgotPassError.Text = string.Empty;
        this.Page.Form.DefaultButton = btnForgotPasword.UniqueID;
    }

    protected void lnkBtnSignIn_Click(object sender, EventArgs e)
    {
        setLoginFields();
        this.Page.Form.DefaultButton = LoginBtn.UniqueID;
    }
    protected void lnkSignUp_Click(object sender, EventArgs e)
    {
        lblSignUp.CssClass = "";
        divSignUp.Attributes.Add("style", "display:block;");
        divLoginForm.Attributes.Add("style", "display:none;");
        divOTPVerification.Attributes.Add("style", "display:none;");
        divForgotPassword.Attributes.Add("style", "display:none;");
        litPopUpTitle.Text = "Registration";

        pForgotPassWord.Attributes.Add("style", "display:block;");
        pVerifyUser.Attributes.Add("style", "display:block;");
        pSignUp.Attributes.Add("style", "display:none;");
        pSignIn.Attributes.Add("style", "display:block;");
        lblSignUp.Text = string.Empty;
        this.Page.Form.DefaultButton = btnSignUp.UniqueID;
    }
    protected void lnkVerifyUser_Click(object sender, EventArgs e)
    {
        setOtPFields();
        this.Page.Form.DefaultButton = btnOTPVerification.UniqueID;
    }

    public void setOtPFields()
    {
        divSignUp.Attributes.Add("style", "display:none;");
        divLoginForm.Attributes.Add("style", "display:none;");
        divOTPVerification.Attributes.Add("style", "display:block;");
        divForgotPassword.Attributes.Add("style", "display:none;");
        litPopUpTitle.Text = "OTP Verification";

        pForgotPassWord.Attributes.Add("style", "display:block;");
        pVerifyUser.Attributes.Add("style", "display:none;");
        pSignUp.Attributes.Add("style", "display:block;");
        pSignIn.Attributes.Add("style", "display:block;");
        lblOTPError.Text = string.Empty;
        ddlOTPCountryCode.Enabled = true;
        txtOTPPhoneNumber.Enabled = true;
        ddlOTPCountryCode.CssClass = "form-control";
        txtOTPPhoneNumber.CssClass = "form-control";
    }

    public void setLoginFields()
    {
        divSignUp.Attributes.Add("style", "display:none;");
        divLoginForm.Attributes.Add("style", "display:block;");
        divOTPVerification.Attributes.Add("style", "display:none;");
        divForgotPassword.Attributes.Add("style", "display:none;");
        litPopUpTitle.Text = "Login";

        pForgotPassWord.Attributes.Add("style", "display:block;");
        pVerifyUser.Attributes.Add("style", "display:block;");
        pSignUp.Attributes.Add("style", "display:block;");
        pSignIn.Attributes.Add("style", "display:none;");
        lblLoginError.Text = string.Empty;
        txtLoginUsername.Text = string.Empty;
        txtLoginPassword.Text = string.Empty;
    }

    protected void lnkResendOTP_Click(object sender, EventArgs e)
    {
        int liUserId = 0;

        bool _IsExpired = OTPVerification(OTPCheck.Resend, out liUserId);

        if (liUserId > 0)
        {
            string lsOtp = Guid.NewGuid().ToString().ToUpper().Split('-')[0];
            UserInfo oUser = new UserInfo();

            oUser = UserController.GetUserById(0, liUserId);
            if (oUser.Membership.Approved)
            {
                lblOTPError.CssClass = "errorText";
                lblOTPError.Text = "Mobile number is already verified.";
                divLoginForm.Attributes.Add("style", "display:none;");
                divOTPVerification.Attributes.Add("style", "display:block;");
            }
            else if (!_IsExpired)
            {
                lblOTPError.CssClass = "errorText";
                lblOTPError.Text = "Your last verification code is not yet expire.";
                divLoginForm.Attributes.Add("style", "display:none;");
                divOTPVerification.Attributes.Add("style", "display:block;");
            }
            else
            {
                oUser.Profile.SetProfileProperty("OTP", lsOtp);
                UserController.UpdateUser(0, oUser);
                CommonFn.SendSMS(oUser.Profile.GetPropertyValue("PhoneNumber").Replace("-", string.Empty), "Your one time verification code is: " + lsOtp + ".This code is valid for next 10mins only.");
                lblOTPError.CssClass = "successText";
                lblOTPError.Text = "OTP code successfully sent to mobile. Please enter OTP code and click on submit.";
                divLoginForm.Attributes.Add("style", "display:none;");
                divOTPVerification.Attributes.Add("style", "display:block;");
            }
        }
        else
        {
            lblOTPError.CssClass = "errorText";
            lblOTPError.Text = "No user is registered with above mobile number";
            divLoginForm.Attributes.Add("style", "display:none;");
            divOTPVerification.Attributes.Add("style", "display:block;");
        }
    }
    protected string Messege = string.Empty;

    public static bool IsNumber(String str)
    {
        try
        {
            Double.Parse(str);
            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }
    protected void sessionclear_Click()
    {
        Session["AppointmentDetail"] = null;
        Session["ConsultationAppointment"] = null;
    }

    protected void LoginBtn_Click(object sender, EventArgs e)
    {

        //#region CSV Updation For User
        //DataSet dsUser = new DataSet();
        //DataAccessEntities oEntities = new DataAccessEntities();
        //oEntities.Email = "";
        //oEntities.MRNumber = txtLoginUsername.Text;
        //oEntities.UserName = "";
        //dsUser = objBusinessLogic.GetUserNameByMRNumber(oEntities);
        //string visitorId = string.Empty;
        //string AvailableMR = string.Empty;
        //if (dsUser != null && dsUser.Tables[0].Rows.Count > 0)
        //{
        //    visitorId = dsUser.Tables[0].Rows[0]["UserName"].ToString();
        //    Messege = dsUser.Tables[0].Rows[0]["Messege"].ToString();
        //    AvailableMR = dsUser.Tables[0].Rows[0]["AvailableMR"].ToString();
        //    Session["IsMR"] = Convert.ToString(AvailableMR);
        //}
        //#endregion


        if (Session["AppointmentDetail"] != null)
        {
            bool IsNum = IsNumber(txtLoginUsername.Text.Trim().ToString());
            if (IsNum == true)
            {
                UserInfo objUser = new UserInfo();
                objUser.Username = txtLoginUsername.Text.Trim();
                UserMembership objMembership = new UserMembership(objUser);
                objMembership.Username = txtLoginUsername.Text.Trim();
                objMembership.Password = txtLoginPassword.Text;
                objUser.Membership = objMembership;

                PortalSettings po = new PortalSettings();
                UserLoginStatus loginStatus = UserLoginStatus.LOGIN_FAILURE;
                UserInfo objUserInfo = UserController.ValidateUser(0, objMembership.Username, txtLoginPassword.Text, "DNN", "", po.PortalName, this.Request.UserHostAddress, ref loginStatus);
                if (objUserInfo != null)
                {
                    UserController.UserLogin(0, objUser, Request.ServerVariables["SERVER_NAME"], this.Request.UserHostAddress, true);
                    Response.Redirect("/Payment.aspx");
                }
                else
                {
                    if (loginStatus == UserLoginStatus.LOGIN_USERNOTAPPROVED)
                    {

                        lblLoginError.CssClass = "errorText";
                        lblLoginError.Visible = true;
                        lblLoginError.Text = "You are not authorized to access Jaslok Portal. Authenticate your mobile number by clicking \"Please verify\" link below";

                        return;

                    }

                    lblLoginError.CssClass = "errorText";
                    lblLoginError.Visible = true;
                    lblLoginError.Text = "Please enter correct password!";
                    return;


                }

            }
            else
            {
                Session["AppointmentDetail"] = null;
                lblLoginError.CssClass = "errorText";
                lblLoginError.Visible = true;
                lblLoginError.Text = "Please Enter MR Number To Login!";
                return;
            }
        }
        else if (Session["ConsultationAppointment"] != null)
        {
            bool IsNum = IsNumber(txtLoginUsername.Text.Trim().ToString());
            if (IsNum == true)
            {
                UserInfo objUser = new UserInfo();
                objUser.Username = txtLoginUsername.Text.Trim();
                UserMembership objMembership = new UserMembership(objUser);
                objMembership.Username = txtLoginUsername.Text.Trim();
                objMembership.Password = txtLoginPassword.Text;
                objUser.Membership = objMembership;

                PortalSettings po = new PortalSettings();
                UserLoginStatus loginStatus = UserLoginStatus.LOGIN_FAILURE;
                UserInfo objUserInfo = UserController.ValidateUser(0, objMembership.Username, txtLoginPassword.Text, "DNN", "", po.PortalName, this.Request.UserHostAddress, ref loginStatus);
                if (objUserInfo != null)
                {
                    UserController.UserLogin(0, objUser, Request.ServerVariables["SERVER_NAME"], this.Request.UserHostAddress, true);
                    Response.Redirect("/Payment.aspx");
                }
                else
                {
                    if (loginStatus == UserLoginStatus.LOGIN_USERNOTAPPROVED)
                    {

                        lblLoginError.CssClass = "errorText";
                        lblLoginError.Visible = true;
                        lblLoginError.Text = "You are not authorized to access Jaslok Portal. Authenticate your mobile number by clicking \"Please verify\" link below";

                        return;

                    }

                    lblLoginError.CssClass = "errorText";
                    lblLoginError.Visible = true;
                    lblLoginError.Text = "Please enter correct password!";
                    return;


                }
            }
            else
            {
                Session["ConsultationAppointment"] = null;
                lblLoginError.CssClass = "errorText";
                lblLoginError.Visible = true;
                lblLoginError.Text = "Please Enter MR Number To Login!";
                return;
            }
        }
        else
        {
            JaslokMailer objMailer = new JaslokMailer();
            List<Parameters> lstParameters = new List<Parameters>();
            string lsEmailStatus = string.Empty;
            PatIndex objPatIndex = new PatIndex();
            bool IsNum = IsNumber(txtLoginUsername.Text.Trim().ToString());

            if (IsNum == false)
            {

                // check for visitor id and MRNO
                string MRNumber;
                string Username;
                DataSet ds = objBusinessLogic.GetMRNumberByUserName(txtLoginUsername.Text.Trim());

                if (ds.Tables[0].Rows.Count > 0)
                {
                    MRNumber = ds.Tables[0].Rows[0]["MRNumber"].ToString();
                    Username = ds.Tables[0].Rows[0]["Username"].ToString();
                }
                else
                {
                    lblLoginError.CssClass = "errorText";
                    lblLoginError.Visible = true;
                    lblLoginError.Text = "Please enter correct Id and Password!";
                    return;

                }
                if (string.IsNullOrEmpty(MRNumber) && !string.IsNullOrEmpty(Username))
                {
                    //loginStatus = UserLoginStatus.LOGIN_SUCCESS;


                    UserInfo objUser = new UserInfo();
                    objUser.Username = txtLoginUsername.Text.Trim();
                    UserMembership objMembership = new UserMembership(objUser);
                    objMembership.Username = txtLoginUsername.Text.Trim();
                    objMembership.Password = txtLoginPassword.Text;
                    objUser.Membership = objMembership;

                    PortalSettings po = new PortalSettings();
                    UserLoginStatus loginStatus = UserLoginStatus.LOGIN_FAILURE;
                    UserInfo objUserInfo = UserController.ValidateUser(0, objMembership.Username, txtLoginPassword.Text, "DNN", "", po.PortalName, this.Request.UserHostAddress, ref loginStatus);
                    if (objUserInfo != null)
                    {
                        UserController.UserLogin(0, objUser, Request.ServerVariables["SERVER_NAME"], this.Request.UserHostAddress, true);

                        Session["IsVisitor"] = true;

                        Response.Redirect("/redirect");

                        //Response.Redirect("/redirect");

                    }
                    else
                    {
                        if (loginStatus == UserLoginStatus.LOGIN_USERNOTAPPROVED)
                        {

                            lblLoginError.CssClass = "errorText";
                            lblLoginError.Visible = true;
                            lblLoginError.Text = "You are not authorized to access Jaslok Portal. Authenticate your mobile number by clicking \"Please verify\" link below";

                            return;

                        }

                        else if (loginStatus == UserLoginStatus.LOGIN_USERLOCKEDOUT)
                        {
                            if (Host.AutoAccountUnlockDuration > 0)
                            {
                                lblLoginError.CssClass = "errorText";
                                lblLoginError.Visible = true;
                                lblLoginError.Text = "This account has been locked out after too many unsuccessful login attempts. Please wait 10 minutes before trying to login again. If you have forgotten your password, please try the Password Reminder option before contacting an Administrator.";
                            }
                            else
                            {
                                lblLoginError.CssClass = "errorText";
                                lblLoginError.Text = "This account has been locked out after too many unsuccessful login attempts. Please contact your administrator.";
                            }
                        }
                        else
                        {
                            lblLoginError.CssClass = "errorText";
                            lblLoginError.Visible = true;
                            lblLoginError.Text = "Please enter correct password!";
                            return;
                        }


                    }

                }

                if (!string.IsNullOrEmpty(MRNumber))
                {
                    lblLoginError.CssClass = "errorText";
                    lblLoginError.Visible = true;
                    lblLoginError.Text = "Please Enter MR Number To Login!";
                    return;
                }

            }
            if (IsNum == true)
            {
                // check for Mr Number in db
                bool check = objBusinessLogic.IsExistMrNo(txtLoginUsername.Text.Trim());

                if (check == true)
                {
                    UserInfo objUser = new UserInfo();
                    objUser.Username = txtLoginUsername.Text.Trim();
                    UserMembership objMembership = new UserMembership(objUser);
                    objMembership.Username = objUser.Username.Trim();
                    objMembership.Password = txtLoginPassword.Text;
                    objUser.Membership = objMembership;


                    PortalSettings po = new PortalSettings();
                    UserLoginStatus loginStatus = UserLoginStatus.LOGIN_FAILURE;
                    UserInfo objUserInfo = UserController.ValidateUser(0, objMembership.Username, txtLoginPassword.Text, "DNN", "", po.PortalName, this.Request.UserHostAddress, ref loginStatus);
                    if (objUserInfo != null)
                    {

                        UserController.UserLogin(0, objUser, Request.ServerVariables["SERVER_NAME"], this.Request.UserHostAddress, true);



                        if (!string.IsNullOrEmpty(hdnRedirectUrl.Value))
                        {
                            if (hdnRedirectUrl.Value.ToLower() == "patientregistration")
                            {
                                Response.Redirect("/");
                            }
                            else
                                Response.Redirect("/" + hdnRedirectUrl.Value);
                        }
                        else
                            Response.Redirect("/redirect");

                    }
                    else if (loginStatus == UserLoginStatus.LOGIN_USERLOCKEDOUT)
                    {

                        if (Host.AutoAccountUnlockDuration > 0)
                        {
                            lblLoginError.CssClass = "errorText";
                            lblLoginError.Visible = true;
                            lblLoginError.Text = "This account has been locked out after too many unsuccessful login attempts. Please wait 10 minutes before trying to login again. If you have forgotten your password, please try the Password Reminder option before contacting an Administrator.";
                        }
                    }
                    else
                    {
                        lblLoginError.CssClass = "errorText";
                        lblLoginError.Visible = true;
                        lblLoginError.Text = "Please enter correct password!";
                        return;

                    }

                    //UserController.UserLogin(0, objUser, Request.ServerVariables["SERVER_NAME"], this.Request.UserHostAddress, true);
                    //Response.Redirect("/redirect");



                }
                // If User enters MRNo. which we do not have
                else
                {
                    var PatientDetails = objPatIndex.GetPatientDetails("JEEVAPG", "JEEVAPG@16", txtLoginUsername.Text.Trim());


                    if (PatientDetails.MRNO != null && PatientDetails.WEBPWD != null)
                    {



                        DataSet dsVal = InsertUpdateUserDetails(PatientDetails.MRNO, PatientDetails.PatFName, PatientDetails.PatLName, PatientDetails.PatEmail, PatientDetails.WEBPWD, PatientDetails.PatMobile, PatientDetails.PatSex, PatientDetails.PatAddr1, PatientDetails.PatAge);


                        if (dsVal.Tables[0].Rows.Count == 1)
                        {
                            // loginStatus = UserLoginStatus.LOGIN_SUCCESS;

                            Session["IsVisitor"] = null;
                            UserInfo objUser = new UserInfo();
                            objUser.Username = txtLoginUsername.Text.Trim();
                            UserMembership objMembership = new UserMembership(objUser);
                            objMembership.Username = txtLoginUsername.Text.Trim();
                            objMembership.Password = txtLoginPassword.Text;
                            objUser.Membership = objMembership;

                            PortalSettings po = new PortalSettings();
                            UserLoginStatus loginStatus = UserLoginStatus.LOGIN_FAILURE;
                            UserInfo objUserInfo = UserController.ValidateUser(0, objMembership.Username, txtLoginPassword.Text, "DNN", "", po.PortalName, this.Request.UserHostAddress, ref loginStatus);
                            if (objUserInfo != null)
                            {

                                UserController.UserLogin(0, objUser, Request.ServerVariables["SERVER_NAME"], this.Request.UserHostAddress, true);


                                //if (!string.IsNullOrEmpty(hdnRedirectUrl.Value))
                                //{
                                //    Response.Redirect("/" + hdnRedirectUrl.Value);
                                //}
                                //else
                                Response.Redirect("/redirect");

                            }
                            else
                            {
                                lblLoginError.CssClass = "errorText";
                                lblLoginError.Visible = true;
                                lblLoginError.Text = "Please enter correct password!";
                                return;
                            }
                        }
                    }
                    else
                    {
                        lblLoginError.CssClass = "errorText";
                        lblLoginError.Visible = true;
                        lblLoginError.Text = "Login Failed! You are not authorized to access Jaslok Portal!";
                    }
                }
            }
        }
    }


    public DataSet InsertUpdateUserDetails(string MRNO, string FName, string LName, string Email, string Password, string Telephone, string Gender, string Address, string Age)
    {

        string lsUserName = string.Empty;

        lsUserName = MRNO;

        string lsOtp = Guid.NewGuid().ToString().ToUpper().Split('-')[0];

        Membership.CreateUser(lsUserName, Password);

        DataSet ds = objBusinessLogic.SaveUserDetails(MRNO, lsUserName, FName, LName, Email, FName, Password, Telephone, Gender, Address, Age, lsOtp);

        return ds;


    }

    protected void btnForgotPasword_Click(object sender, EventArgs e)
    {
        JaslokMailer objMailer = new JaslokMailer();
        List<Parameters> lstParameters = new List<Parameters>();
        string lsEmailStatus = string.Empty;
        if (!IsNumber(txtForgotPasswordUserName.Text))
        {
            MembershipUser objUser = Membership.GetUser(txtForgotPasswordUserName.Text.Trim());
            if (objUser != null)
            {
                UserInfo objInfo = new UserInfo();
                objInfo = UserController.GetUserByName(objUser.UserName);
                string lsmobileNumber = objInfo.Profile.GetPropertyValue("PhoneNumber");
                string lsPassword;
                lsPassword = objUser.GetPassword();
                //sendmail(objUser.Email, lsPassword);
                if (!string.IsNullOrEmpty(lsmobileNumber))
                    CommonFn.SendSMS(lsmobileNumber.Replace("-", ""), "Your password is: " + lsPassword);
                lstParameters.Add(new Parameters { ShortCodeName = "Username", ShortCodeValue = txtForgotPasswordUserName.Text });
                lstParameters.Add(new Parameters { ShortCodeName = "Password", ShortCodeValue = lsPassword });
                lsEmailStatus = objMailer.SendEmail("forgotpassword", lstParameters, objInfo.Email, null);
                if (string.IsNullOrEmpty(lsEmailStatus))
                {
                    lblForgotPassError.Text = "Password has been sent to your email address.";
                    lblForgotPassError.CssClass = "successText";
                    divLoginForm.Attributes.Add("style", "display:none;");
                    divForgotPassword.Attributes.Add("style", "display:block;");
                }
                else
                {
                    lblForgotPassError.Text = "Problem in sending email";
                    lblForgotPassError.CssClass = "errorText";
                    divLoginForm.Attributes.Add("style", "display:none;");
                    divForgotPassword.Attributes.Add("style", "display:block;");
                }
                txtForgotPasswordUserName.Text = "";
                //lblGeneratedPassword.Text = lsPassword;
            }
            else
            {
                lblForgotPassError.CssClass = "errorText";
                lblForgotPassError.Text = "Username does not exist.";
                txtForgotPasswordUserName.Text = "";
                divLoginForm.Attributes.Add("style", "display:none;");
                divForgotPassword.Attributes.Add("style", "display:block;");
            }
        }
        else
        {
            PatIndex objPatIndex = new PatIndex();
            var PatientDetails = objPatIndex.GetPatientDetails("JEEVAPG", "JEEVAPG@16", txtForgotPasswordUserName.Text.Trim());

            if (PatientDetails.WEBPWD != null)
            {
                if (!string.IsNullOrEmpty(PatientDetails.WEBPWD))
                    CommonFn.SendSMS(PatientDetails.PatMobile.Replace("-", ""), "Your password is: " + PatientDetails.WEBPWD);
                lstParameters.Add(new Parameters { ShortCodeName = "Username", ShortCodeValue = txtForgotPasswordUserName.Text });
                lstParameters.Add(new Parameters { ShortCodeName = "Password", ShortCodeValue = PatientDetails.WEBPWD });
                lsEmailStatus = objMailer.SendEmail("forgotpassword", lstParameters, PatientDetails.PatEmail, null);
                if (string.IsNullOrEmpty(lsEmailStatus))
                {
                    lblForgotPassError.Text = "Password has been sent to your email address.";
                    lblForgotPassError.CssClass = "successText";
                    divLoginForm.Attributes.Add("style", "display:none;");
                    divForgotPassword.Attributes.Add("style", "display:block;");
                }
                else
                {
                    lblForgotPassError.Text = "Problem in sending email";
                    lblForgotPassError.CssClass = "errorText";
                    divLoginForm.Attributes.Add("style", "display:none;");
                    divForgotPassword.Attributes.Add("style", "display:block;");
                }
                txtForgotPasswordUserName.Text = "";
            }
            else
            {
                lblForgotPassError.Text = "MRNumber not found, Please enter valid MRNumber.";
                lblForgotPassError.CssClass = "errorText";
                divLoginForm.Attributes.Add("style", "display:none;");
                divForgotPassword.Attributes.Add("style", "display:block;");
            }
        }
    }
    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        lblSignUp.CssClass = "";
        bool userExist = Convert.ToBoolean(objBusinessLogic.CheckUerExistence(ddlCountryCode.SelectedValue + "-" + txtMobileNumber.Text.Trim()).Rows[0]["MobileNumberExists"]);

        if (!userExist)
        {
            string lsUserName = string.Empty;
            string lsPassword = string.Empty;
            string lsOtp = Guid.NewGuid().ToString().ToUpper().Split('-')[0];
            lsUserName = txtFirstName.Text.Substring(0, 1).ToLower() + txtLastName.Text.ToLower() + txtMobileNumber.Text.Substring(txtMobileNumber.Text.Length - 3, 3);
            lsPassword = RandomString(8);
            UserInfo oUser = new UserInfo();

            oUser.PortalID = 0;
            oUser.IsSuperUser = false;
            oUser.FirstName = txtFirstName.Text;
            oUser.LastName = txtLastName.Text;
            oUser.Email = txtEmail.Text;
            oUser.Username = lsUserName;
            oUser.DisplayName = txtFirstName.Text;
            //oUser.Profile.ProfileProperties.Add
            oUser.Profile.PreferredLocale = PortalSettings.Current.DefaultLanguage;
            //oUser.Profile.PreferredTimeZone = PortalSettings.Current.TimeZone;
            oUser.Profile.FirstName = oUser.FirstName;
            oUser.Profile.LastName = oUser.LastName;
            oUser.Membership.Approved = false;
            //oUser.Membership.CreatedDate = System.DateTime.Now;
            oUser.Membership.Password = lsPassword;
            if (UserCreateStatus.Success == UserController.CreateUser(ref oUser))
            {
                oUser = UserController.GetUserById(0, oUser.UserID);

                oUser.Profile.SetProfileProperty("Gender", ddlGender.SelectedValue);
                oUser.Profile.SetProfileProperty("Address", txtAddress.Text);
                oUser.Profile.SetProfileProperty("Age", txtAge.Text);
                oUser.Profile.SetProfileProperty("PhoneNumber", ddlCountryCode.SelectedValue + "-" + txtMobileNumber.Text.Trim());
                oUser.Profile.SetProfileProperty("Email", txtEmail.Text);
                oUser.Profile.SetProfileProperty("OTP", lsOtp);
                oUser.Profile.SetProfileProperty("OTPCreatedDate", DateTime.Now.ToString());

                UserController.UpdateUser(0, oUser);
                setOtPFields();
                CommonFn.SendSMS(ddlCountryCode.SelectedValue + txtMobileNumber.Text.Trim(), "Your one time verification code is: " + lsOtp + ". This code will be valid for next 10 mins only.");
                lblOTPError.CssClass = "successText";
                lblOTPError.Text = "OTP has been sent to your registered mobile number. On successfull verification of your mobile number you will receive your account details";
                txtOTPPhoneNumber.Text = txtMobileNumber.Text.Trim();
                ddlOTPCountryCode.SelectedValue = ddlCountryCode.SelectedValue;
                ddlOTPCountryCode.Enabled = false;
                txtEmail.Text = string.Empty;
                txtFirstName.Text = string.Empty;
                txtLastName.Text = string.Empty;
                txtAge.Text = string.Empty;
                txtMobileNumber.Text = string.Empty;
                txtOTPPhoneNumber.Enabled = false;
                ddlOTPCountryCode.CssClass = "form-control";
                txtOTPPhoneNumber.CssClass = "form-control";
                ddlGender.SelectedValue = "Male";
                ddlCountryCode.SelectedIndex = 0;
                try
                {
                    //#region CSV Generation Code

                    //DataTable dtUser = new DataTable();
                    //dtUser.Columns.Add("UserName", typeof(string));
                    //dtUser.Columns.Add("Email", typeof(string));
                    //dtUser.Columns.Add("Password", typeof(string));
                    //dtUser.Rows.Add(lsUserName, oUser.Email, lsPassword);
                    //string PortalName = PortalSettings.Current.HomeDirectory;
                    //if (!Directory.Exists(Server.MapPath(PortalName + "CsvFile")))
                    //    Directory.CreateDirectory(Server.MapPath(PortalName + "CsvFile"));
                    //string virtualFolder = PortalName + "CsvFile/";
                    //string FilePath = virtualFolder + "sample.csv";
                    //if (File.Exists(Server.MapPath(FilePath)))
                    //    File.Delete(Server.MapPath(FilePath));

                    //CreateCSVFile(dtUser, Server.MapPath(FilePath));

                    //#endregion
                }
                catch (Exception ex)
                {
                    throw ex;
                }








            }
            else
            {
                lblSignUp.CssClass = "errorText";
                lblSignUp.Text = "Problem in creating user. Please check all fields";
                divLoginForm.Attributes.Add("style", "display:none;");
                divSignUp.Attributes.Add("style", "display:block;");
            }
        }
        else
        {
            lblSignUp.CssClass = "errorText";
            lblSignUp.Text = "User with same mobile number already exists.";
            divLoginForm.Attributes.Add("style", "display:none;");
            divSignUp.Attributes.Add("style", "display:block;");
        }
    }

    public enum OTPCheck
    {
        Resend,
        Verification
    }

    public bool OTPVerification(OTPCheck _otp, out int userID)
    {
        DataTable dt = new DataTable();
        dt = objBusinessLogic.OTPVerification(ddlOTPCountryCode.SelectedValue + "-" + txtOTPPhoneNumber.Text.Trim(), txtOTP.Text.Trim(), AppGlobal.OTPExpiration);
        int liUserId = 0;
        bool lbIsVerified = false;
        bool lbIsOtpExpired = true;
        liUserId = Convert.ToInt32(dt.Rows[0]["UserId"]);
        lbIsVerified = Convert.ToBoolean(dt.Rows[0]["IsVerified"]);
        lbIsOtpExpired = Convert.ToBoolean(dt.Rows[0]["IsOTPExpired"]);
        userID = liUserId;
        bool _returnValue = true;
        switch (_otp)
        {
            case OTPCheck.Resend:
                _returnValue = lbIsOtpExpired;
                break;
            case OTPCheck.Verification:
                if (liUserId == 0)
                {
                    lblOTPError.CssClass = "errorText";
                    lblOTPError.Text = "No user is registered with above mobile number";
                    divLoginForm.Attributes.Add("style", "display:none;");
                    divOTPVerification.Attributes.Add("style", "display:block;");
                    break;
                }
                else if (!lbIsVerified)
                {
                    lblOTPError.CssClass = "errorText";
                    lblOTPError.Text = "Invalid OTP code";
                    divLoginForm.Attributes.Add("style", "display:none;");
                    divOTPVerification.Attributes.Add("style", "display:block;");
                    break;
                }
                else if (lbIsOtpExpired)
                {
                    lblOTPError.CssClass = "errorText";
                    lblOTPError.Text = "OTP code is expired";

                    divLoginForm.Attributes.Add("style", "display:none;");
                    divOTPVerification.Attributes.Add("style", "display:block;");

                    break;
                }
                _returnValue = lbIsOtpExpired;
                break;
        }
        return _returnValue;
    }

    protected void btnOTPVerification_Click(object sender, EventArgs e)
    {

        int UserID = -1;
        if (!OTPVerification(OTPCheck.Verification, out UserID))
        {
            UserInfo objUserInfo = new UserInfo();
            objUserInfo = UserController.GetUserById(0, UserID);
            objUserInfo.Membership.Approved = true;


            MembershipUser objUser = Membership.GetUser(objUserInfo.Username);
            string LsPassword = objUser.GetPassword();
            UserController.UpdateUser(0, objUserInfo);

            CommonFn.SendSMS(objUserInfo.Profile.GetPropertyValue("PhoneNumber").Replace("-", string.Empty), "Thank you for verifying your mobile number, your login details for Jaslok is: Visitor ID- " + objUserInfo.Username + " and Password- " + LsPassword);

            setLoginFields();
            lblLoginError.CssClass = "successText";
            lblLoginError.Text = "User login details that has been sent to your registered mobile number";


            JaslokMailer objMailer = new JaslokMailer();
            List<Parameters> lstParameters = new List<Parameters>();
            string lsEmailStatus = string.Empty;


            lstParameters.Add(new Parameters { ShortCodeName = "Username", ShortCodeValue = objUserInfo.Username });
            lstParameters.Add(new Parameters { ShortCodeName = "Password", ShortCodeValue = LsPassword });
            lsEmailStatus = objMailer.SendEmail("registration", lstParameters, objUserInfo.Email);

        }
    }

    public string RandomString(int length)
    {
        const string chars = "abcdefghijklmnopqrstuvwxyz0123456789";
        var random = new Random();
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }

    #region CSV
    public void CreateCSVFile(DataTable dt, string strFilePath)
    {
        try
        {
            // Create the CSV file to which grid data will be exported.
            StreamWriter sw = new StreamWriter(strFilePath, false);
            // First we will write the headers.
            //DataTable dt = m_dsProducts.Tables[0];
            int iColCount = dt.Columns.Count;
            //for (int i = 0; i < iColCount; i++)
            //{
            //    sw.Write(dt.Columns[i]);
            //    if (i < iColCount - 1)
            //    {
            //        sw.Write(",");
            //    }
            //}
            //sw.Write(sw.NewLine);
            // Now write all the rows.
            foreach (DataRow dr in dt.Rows)
            {
                for (int i = 0; i < iColCount; i++)
                {
                    if (!Convert.IsDBNull(dr[i]))
                    {
                        sw.Write(dr[i].ToString());
                    }
                    if (i < iColCount - 1)
                    {
                        sw.Write(",");
                    }
                }
                sw.Write(sw.NewLine);
            }
            sw.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    #endregion

    public void IsMNumberExist()
    {
        UserInfo objuser = UserController.Instance.GetCurrentUserInfo();
        bool check = false;
        if (objuser.UserID > 0)
            check = objBusinessLogic.IsExistMrNo(objuser.Username);
        else
            check = objBusinessLogic.IsExistMrNo(txtLoginUsername.Text.Trim());

        if (check == false)
        {
            hdnMrNumberexist.Value = "NotExist";
        }
        else
        {
            hdnMrNumberexist.Value = "Exist";
        }
    }

    public string GetKey(string Alias)
    {
        string _node = string.Empty;
        try
        {
            XmlDocument doc = new XmlDocument();
            string xmlpath = Server.MapPath("~/EmailTemlates/ManageHeaderTop.xml");
            doc.Load(xmlpath);
            XmlNode node = doc.SelectSingleNode("/Data/add[@alias='" + Alias + "']");
            if (node != null)
                _node = node.Attributes["key"].Value.ToString();
            else
                _node = string.Empty;
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
        return _node;
    }

    public string GetValue(string Alias)
    {
        string _node = string.Empty;
        try
        {
            XmlDocument doc = new XmlDocument();
            string xmlpath = Server.MapPath("~/EmailTemlates/ManageHeaderTop.xml");
            doc.Load(xmlpath);
            XmlNode node = doc.SelectSingleNode("/Data/add[@alias='" + Alias + "']");
            if (node != null)
                _node = node.Attributes["value"].Value.ToString();
            else
                _node = string.Empty;
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
        return _node;
    }


    private void LoadMenus()
    {
      AllMenus = objBusinessLogic.GetAll_HeaderMenu();

      DataTable ParentMenu = AllMenus.AsEnumerable()
                     .Where(r => r.Field<int>("PARENTID") == 0)
                     .CopyToDataTable();

      rptMenu.DataSource = ParentMenu;
      rptMenu.DataBind();
    }
   
    protected void rptMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (AllMenus != null)
                {
                    DataRowView drv = e.Item.DataItem as DataRowView;
                    string ID = drv["ID"].ToString();
                    DataRow[] rows = AllMenus.Select("PARENTID=" + ID, "Name");
                    if (rows.Length > 0)
                    {
                        StringBuilder sb = new StringBuilder();
                        sb.Append(" <ul class=dropdown-menu dropdown-second-menu>");
                        foreach (var item in rows)
                        {
                            sb.Append("<li><a href='" + item["Url"]+ "'>" +
                            item["Name"] + "</a></li>");
                        }
                        sb.Append("</ul>");
                        (e.Item.FindControl("ltrlSubMenu") as Literal).Text = sb.ToString();
                    }
                }
            }
        }
        catch (Exception)
        {

            throw;
        }
    }
}