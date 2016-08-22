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

public partial class JSControls_MiddleContent_HealthTipsDetails : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    int HealthtipId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["healthtipid"] != null)
        {
            HealthtipId = Convert.ToInt32(Request.QueryString["healthtipid"]);
        }

        if (!Page.IsPostBack)
        {
            GetHealthTipsDetailsById(HealthtipId);
        }
    }


    public void GetHealthTipsDetailsById(int HealthtipId)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.HealthTipId = HealthtipId;
            ds = (DataSet)objBusinessLogic.GetHealthTipsDetailsById(objDAEntities);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                lblHealthTipsInfo.Text = ds.Tables[0].Rows[0]["Description"].ToString();
            }

        }
        catch (Exception ex)
        {
            //lblMessage.Text = ex.Message;
        }
    }

}