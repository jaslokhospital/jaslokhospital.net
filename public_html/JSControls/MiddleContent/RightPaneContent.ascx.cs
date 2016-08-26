using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_RightPaneContent : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPageDetail();
        }
        
    }
    public void BindPageDetail()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.PageTypeId = 33;
            ds = (DataSet)objBusinessLogic.GetBannerPageContentDetail(objDAEntities.PageTypeId);
            imgbanner.ImageUrl = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageUrl"].ToString()) ? CommonFn.DefaultInnerpageBanner : ds.Tables[0].Rows[0]["ImageUrl"].ToString();

            divScopeContent.InnerHtml = ds.Tables[0].Rows[0]["Content"].ToString();



        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }

}