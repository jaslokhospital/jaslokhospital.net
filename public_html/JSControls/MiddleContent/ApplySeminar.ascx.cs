using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class JSControls_MiddleContent_ApplySeminar : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    int Seminarid = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.QueryString["SeminarId"] != null)
        {
            Seminarid = Convert.ToInt32(Request.QueryString["SeminarId"]);
        }

        if (!Page.IsPostBack)
        {
            GetSeminarNameById(Seminarid);
        }
    }

    public void GetSeminarNameById(int Seminarid)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.SeminarId = Seminarid;
            objDAEntities.Title = "";
            ds = (DataSet)objBusinessLogic.GetJaslokSemminars(objDAEntities);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblSeminarTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
            }
            
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Seminarid > 0)
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.SeminarId = Seminarid;
            objDAEntities.Name = txtUserName.Text;
            objDAEntities.Graduate = txtGraduates.Text;
            objDAEntities.Institution = txtInstitution.Text;
            objDAEntities.Address = txtAddress.Text;
            objDAEntities.Phone = txtPhone.Text;
            objDAEntities.Mobile = txtMobile.Text;
            objDAEntities.Fax = txtFax.Text;
            objDAEntities.Email = txtEmail.Text;

            lblMessage.Visible = true;
            string msg = objBusinessLogic.ApplySeminar(objDAEntities);
            if (msg != "")
            {
                lblMessage.CssClass = "errorlbl";
                lblMessage.Text = "Email Id already exists";
            }
            else
            {
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Data Save successfully!!!";
            }

            Clear();
            
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {        
        Response.Redirect("~/seminars");
    }
    public void Clear()
    {
        objDAEntities.SeminarId = Seminarid;
         txtUserName.Text = "";
        txtGraduates.Text = "";
        txtInstitution.Text = "";
        txtAddress.Text = "";
        txtPhone.Text = "";
        txtMobile.Text = "";
        txtFax.Text = "";
        txtEmail.Text = "";

    }

}