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


public partial class JSControls_MiddleContent_HealthTips : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetHealthTipsInfo();
        }
    }

    public void GetHealthTipsInfo()
    {

        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.HealthTipId = 0;
            objDAEntities.Title = txtKeyword.Text;
            ds = (DataSet)objBusinessLogic.GetHealthTipsInfo(objDAEntities);

            if (ds.Tables[0].Rows.Count == 0)
            {
                rptHealthTips.Visible = false;
            }
            else
            {
                rptHealthTips.Visible = true;
                rptHealthTips.DataSource = ds;
                rptHealthTips.DataBind();
            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetHealthTipsInfo();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtKeyword.Text = "";
        GetHealthTipsInfo();
    }

    protected void btnArchive_Click(object sender, EventArgs e)
    {

    }


}