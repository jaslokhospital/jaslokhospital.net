using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessDataLayer;
using System.Data;
using System.Data.SqlClient;
using System.Text;

    public partial class JSControls_MiddleContent_Feedback : DotNetNuke.Entities.Modules.PortalModuleBase
    {
        public BusinessLogic objBusinessLogic = new BusinessLogic();
        public DataAccessLogic objDALogic = new DataAccessLogic();
        public DataAccessEntities objDAEntities = new DataAccessEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCapctha();

            }
        }
        void FillCapctha()
        {
            try
            {

                Random random = new Random();

                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

                StringBuilder captcha = new StringBuilder();

                for (int i = 0; i < 6; i++)

                    captcha.Append(combination[random.Next(combination.Length)]);

                Session["captcha"] = captcha.ToString();

                //imgCaptcha.ImageUrl = "GenerateCaptcha.ascx?" + DateTime.Now.Ticks.ToString();

            }

            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
            }

        }
        protected void ValidateCaptcha(object sender, ServerValidateEventArgs e)
        {
            Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());
            e.IsValid = Captcha1.UserValidated;
            if (e.IsValid)
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Valid Captcha!');", true);
            }
        }
        protected void btnSubmitFeedbck_Click(object sender, EventArgs e)
        {
            Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());

            if (Captcha1.UserValidated)
            {
                objDAEntities.EnquiryTypeId = AppGlobal.FeedbackId;
                objDAEntities.Name = txtName.Text.Trim();
                objDAEntities.Gender = rdoGenderCom.SelectedItem.Text;
                objDAEntities.MobileNo = txtMobile.Text.Trim();
                objDAEntities.Email = txtEmail.Text;
                objDAEntities.Description = txtFeedBack.Text;


                objBusinessLogic.SaveAllTypeEnquiry(objDAEntities);
                Response.Write("<script LANGUAGE='JavaScript'>alert('Query Save Successful')</script>");
                txtName.Text = String.Empty;
                txtEmail.Text = string.Empty;
                txtFeedBack.Text = String.Empty;
                txtCaptcha.Text = String.Empty;
            }

            else
            {

               // Label1.ForeColor = System.Drawing.Color.Red;

               // Label1.Text = "You have Entered InValid Captcha Characters please Enter again";
                FillCapctha();
            }
        }
        protected void btnResetFeedbck_Click(object sender, EventArgs e)
        {
            txtName.Text = String.Empty;
            rdoGenderCom.ClearSelection();
            txtMobile.Text = String.Empty;
            txtEmail.Text = String.Empty;
            txtFeedBack.Text = String.Empty;
            txtCaptcha.Text = String.Empty;
        }
}
