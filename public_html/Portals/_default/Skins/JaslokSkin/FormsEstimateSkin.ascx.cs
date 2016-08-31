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

public partial class Portals__default_Skins_JaslokSkin_FormsEstimateSkin : DotNetNuke.UI.Skins.Skin
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
            h3header.InnerHtml = "Estimate Request";
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
                contentpane.InnerHtml = ds.Tables[1].Rows[0]["Content"].ToString();

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
    //    Captcha1.ValidateCaptcha(txtCaptcha.Text.Trim());
    //    e.IsValid = Captcha1.UserValidated;
    //    if (e.IsValid)
    //    {
    //        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Valid Captcha!');", true);
    //    }
    //    else
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please enter valid text!!!');", false);
    //    }
    //}

    void clear()
    {
        txtName.Text = String.Empty;
        txtAge.Text = String.Empty;
        txtEmail.Text = String.Empty;
        txtMobile.Text = String.Empty;
        txtWhichHealth.Text = String.Empty;
        txtNumberofPackage.Text = String.Empty;
        txt1stPreffed.Text = String.Empty;
        txtComment.Text = String.Empty;
       // txtCaptcha.Text = String.Empty;
    }

    protected void btnSubmitEstimateS_Click(object sender, EventArgs e)
    {
        if (cptchEstimate.IsValid)
        {
            JaslokMailer objMailer = new JaslokMailer();
            List<EmailParaMeters> lstParameters = new List<EmailParaMeters>();
            string lsEmailStatus = string.Empty;
            // if (Captcha1.UserValidated)
            //{
            // objDAEntities.EnquiryTypeId = AppGlobal.FeedbackId;
            objDAEntities.Name = txtName.Text.Trim();
            objDAEntities.Age = Convert.ToInt16(txtAge.Text.Trim());
            objDAEntities.Gender = rdoGenderCom.SelectedItem.Text;
            objDAEntities.Mobile = Convert.ToString(txtMobile.Text.Trim());
            objDAEntities.Email = txtEmail.Text;
            objDAEntities.Option1 = txtWhichHealth.Text;
            objDAEntities.Option2 = txtNumberofPackage.Text;
            objDAEntities.Option3 = txt1stPreffed.Text;
            objDAEntities.Comment = txtComment.Text;

            objBusinessLogic.SaveEstimate(objDAEntities);
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Username", ShortCodeValue = txtName.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Age", ShortCodeValue = txtAge.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Gender", ShortCodeValue = rdoGenderCom.SelectedItem.Text });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "MobileNo", ShortCodeValue = txtMobile.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "EmailAdd", ShortCodeValue = txtEmail.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "HealthCheckOptFor", ShortCodeValue = txtWhichHealth.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "IndividualPkgNumber", ShortCodeValue = txtNumberofPackage.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "PreferredDay", ShortCodeValue = txt1stPreffed.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Comments", ShortCodeValue = txtComment.Text.Trim() });

            DataSet ds = new DataSet();
            ds = (DataSet)objBusinessLogic.GetFormsEmailDetail((int)AppGlobal.JaslokEmailHandler.EmailFormEstimate);

            string EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
            string EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);

            lsEmailStatus = objMailer.SendEmail("estimate", lstParameters, EmailToId, EmailCCId);

            lsEmailStatus = objMailer.SendEmail("estimate_user", lstParameters, objDAEntities.Email, EmailCCId);

            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Save Successfully!!!');", false);
            // ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Save Successfully!!!');", true);

            divcontentpane.Visible = false;

            PanelMessage.Visible = true;
            clear();
            // }
            //else
            // {  
            //  FillCapctha();
            // }
        }
    }
    protected void btnResetEstimateS_Click(object sender, EventArgs e)
    {
        clear();
    }
}