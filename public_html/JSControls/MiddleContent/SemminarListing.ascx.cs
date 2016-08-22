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

public partial class JSControls_MiddleContent_SemminarListing : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetJaslokSemminars();
        }
    }

    public void GetJaslokSemminars()
    {

        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.SeminarId = 0;
            objDAEntities.Title = txtKeyword.Text;
            ds = (DataSet)objBusinessLogic.GetJaslokSemminars(objDAEntities);

            if (ds.Tables[0].Rows.Count == 0)
            {
                rptSeminars.Visible = false;

            }
            else
            {
                rptSeminars.Visible = true;
                rptSeminars.DataSource = ds;
                rptSeminars.DataBind();
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetJaslokSemminars();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtKeyword.Text = "";
        GetJaslokSemminars();
    }
}