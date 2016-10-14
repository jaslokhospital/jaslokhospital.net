using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using DotNetNuke;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


public partial class Portals__default_Skins_JaslokSkin_FeedBackSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (!IsPostBack)
        {
            //FillCapctha();
            BindPageDetail(121);
            h3header.InnerHtml = "Feedback Form";
            if (Request.QueryString["name"] != null && Request.QueryString["email"] != null)
            {
                txtName.Text = Convert.ToString(Request.QueryString["name"]);
                txtEmail.Text = Convert.ToString(Request.QueryString["email"]);
            }

        }
    }
    public void BindPageDetail(int id)
    {
        try
        {
            DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;

            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.PageTypeId = id;
            ds = (DataSet)objBusinessLogic.GetBannerPageContentDetail(id);
            if (ds.Tables[1].Rows.Count > 0)
            {
                //innerParagraph.InnerHtml = ds.Tables[1].Rows[0]["Content"].ToString();

                p.Title = ds.Tables[1].Rows[0]["PageTitle"].ToString();
                p.KeyWords = ds.Tables[1].Rows[0]["PageKeywords"].ToString();
                p.Description = ds.Tables[1].Rows[0]["PageDescription"].ToString();
            }
        }
        catch (Exception ex)
        {
        }
    }
    //void FillCapctha()
    //{
    //    try
    //    {
    //        Random random = new Random();
    //        string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    //        StringBuilder captcha = new StringBuilder();
    //        for (int i = 0; i < 6; i++)
    //            captcha.Append(combination[random.Next(combination.Length)]);
    //        Session["captcha"] = captcha.ToString();
    //        //imgCaptcha.ImageUrl = "GenerateCaptcha.ascx?" + DateTime.Now.Ticks.ToString();
    //    }
    //    catch
    //    {
    //        throw;
    //    }
    //}
    //protected void ValidateCaptcha(object sender, ServerValidateEventArgs e)
    //{
    //    //Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());
    //    //e.IsValid = Captcha1.UserValidated;
    //    //if (e.IsValid)
    //    //{
    //    //    //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Valid Captcha!');", true);
    //    //}
    //    //else
    //    //{
    //    //    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please enter valid text!!!');", false);
    //    //}
    //}
    protected void btnSubmitFeedbck_Click(object sender, EventArgs e)
    {
        // Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());
        if (cptchFeedback.IsValid)
        {
            JaslokMailer objMailer = new JaslokMailer();
            List<Parameters> lstParameters = new List<Parameters>();
            string lsEmailStatus = string.Empty;
            //if (Captcha1.UserValidated)
            //{

            // objDAEntities.EnquiryTypeId = AppGlobal.FeedbackId;
            objDAEntities.Name = txtName.Text.Trim();
            objDAEntities.Gender = rdoGenderCom.SelectedItem.Text;
            objDAEntities.PhoneNo = txtMobile.Text.Trim();
            objDAEntities.Email = txtEmail.Text;
            objDAEntities.Description = txtFeedBack.Text;


            objBusinessLogic.SaveFeedBack(objDAEntities);
            lstParameters.Add(new Parameters { ShortCodeName = "Username", ShortCodeValue = txtName.Text.Trim() });
            lstParameters.Add(new Parameters { ShortCodeName = "Gender", ShortCodeValue = rdoGenderCom.SelectedItem.Text });
            lstParameters.Add(new Parameters { ShortCodeName = "MobileNo", ShortCodeValue = txtMobile.Text.Trim() });
            lstParameters.Add(new Parameters { ShortCodeName = "EmailAdd", ShortCodeValue = txtEmail.Text.Trim() });
            lstParameters.Add(new Parameters { ShortCodeName = "Feedback", ShortCodeValue = txtFeedBack.Text.Trim() });

            DataSet ds = new DataSet();
            ds = (DataSet)objBusinessLogic.GetFormsEmailDetail((int)AppGlobal.JaslokEmailHandler.EmailFormFeedBack);

            string EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
            string EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);

            lsEmailStatus = objMailer.SendEmail("feedback", lstParameters, EmailToId, EmailCCId);

            lsEmailStatus = objMailer.SendEmail("feedback_user", lstParameters, objDAEntities.Email, EmailCCId);
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Save Successfully!!!');", true);
            // fdback.Visible = false;
           /// divcontentpane.Visible = false;

            //PanelMessage.Visible = true;

            //Response.Write(lsEmailStatus);
            clear();
            Response.Redirect("/feedback/success");
        }
        //}

        //else
        //{   
        //    FillCapctha();
        //}
    }
    void clear()
    {
        txtName.Text = String.Empty;
        rdoGenderCom.SelectedIndex = 0;
        txtMobile.Text = String.Empty;
        txtEmail.Text = String.Empty;
        txtFeedBack.Text = String.Empty;
        // txtCaptcha.Text = String.Empty;
    }
    protected void btnResetFeedbck_Click(object sender, EventArgs e)
    {
        clear();
    }
}