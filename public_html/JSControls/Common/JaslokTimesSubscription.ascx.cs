using BusinessDataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class JSControls_Common_JaslokTimesSubscription : System.Web.UI.UserControl
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubscription_Click(object sender, EventArgs e)
    {
        objDAEntities.Email = txtemail.Text.Trim();
        JaslokMailer objMailer = new JaslokMailer();
        objBusinessLogic.AddJaslokTimesSubscription(objDAEntities);
        List<EmailParaMeters> lstParameters = new List<EmailParaMeters>();
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "email", ShortCodeValue = txtemail.Text.Trim() });
        
        DataSet ds = new DataSet();
        ds = (DataSet)objBusinessLogic.GetFormsEmailDetail((int)AppGlobal.JaslokEmailHandler.EmailFormJasloktimesSubscribe);

        string EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
        string EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);

        objMailer.SendEmail("jasloktimes", lstParameters, EmailToId, EmailCCId);
        objMailer.SendEmail("jasloktimes_user", lstParameters, objDAEntities.Email, EmailCCId);

        string message = "You have subscribe Successfully!";
        //dialog.Visible = true;
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "');", true);
        // ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('You have subscribe Successfully!!!');", true);
        txtemail.Text = "";



        //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('You have subscribe Successfully!!!');", true);
    }
}