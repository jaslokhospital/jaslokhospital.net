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

public partial class Portals__default_Skins_JaslokSkin_ComplaintSkin : DotNetNuke.UI.Skins.Skin
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
            BindPageDetail(131);
            //h3header.InnerText = "Complaint Form";
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
                innerParagraph.InnerHtml = ds.Tables[1].Rows[0]["Content"].ToString();
                innerParagraph.Visible = (!string.IsNullOrEmpty(ds.Tables[1].Rows[0]["Content"].ToString()));
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
        txtEmail.Text = String.Empty;
        txtComplaint.Text = String.Empty;
        // txtCaptcha.Text = String.Empty;
    }


    protected void btnSubmitComp_Click1(object sender, EventArgs e)
    {
        if (cptchComplaint.IsValid)
        {
            JaslokMailer objMailer = new JaslokMailer();
            List<EmailParaMeters> lstParameters = new List<EmailParaMeters>();
            string lsEmailStatus = string.Empty;
            //if (Captcha1.UserValidated)
            // {
            // objDAEntities.EnquiryTypeId = AppGlobal.FeedbackId;
            objDAEntities.Name = txtName.Text.Trim();

            objDAEntities.Email = txtEmail.Text;
            objDAEntities.Description = txtComplaint.Text;
            objBusinessLogic.SaveComplaint(objDAEntities);

            //            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Save Successfully!!!');", false);
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Username", ShortCodeValue = txtName.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "EmailAdd", ShortCodeValue = txtEmail.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Complaint", ShortCodeValue = txtComplaint.Text.Trim() });

            DataSet ds = new DataSet();
            ds = (DataSet)objBusinessLogic.GetFormsEmailDetail((int)AppGlobal.JaslokEmailHandler.EmailFormComplaint);

            string EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
            string EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);

            lsEmailStatus = objMailer.SendEmail("complaint", lstParameters, EmailToId, EmailCCId);

            lsEmailStatus = objMailer.SendEmail("complaint_user", lstParameters, objDAEntities.Email, EmailCCId);

           // divcontentpane.Visible = false;
           // PanelMessage.Visible = true;

            clear();
            Response.Redirect("/complaint/success");
            // }
            // else
            // {            // Label1.ForeColor = System.Drawing.Color.Red;

            // Label1.Text = "You have Entered InValid Captcha Characters please Enter again";
            //  FillCapctha();
            // }
        }
    }
    protected void btnResetComp_Click1(object sender, EventArgs e)
    {
        clear();
    }

}