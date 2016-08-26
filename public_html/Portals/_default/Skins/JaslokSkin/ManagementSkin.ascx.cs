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

public partial class Portals__default_Skins_JaslokSkin_ManagementSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (!IsPostBack)
        {
            if (Request.RawUrl.Contains("management"))
            {
                BindPageBanner(123);
            }             
        }
    }
        public void BindPageBanner(int id)
    {
        try
        {
           
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.PageTypeId = id;
            ds = (DataSet)objBusinessLogic.GetBannerPageContentDetail(id);
            if (ds.Tables[0].Rows.Count > 0)
            {
                imgbanner.ImageUrl = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageUrl"].ToString()) ? CommonFn.DefaultInnerpageBanner : ds.Tables[0].Rows[0]["ImageUrl"].ToString();
            }
            if (ds.Tables[1].Rows.Count > 0)
            {
                divFeedbContent.InnerHtml = ds.Tables[1].Rows[0]["Content"].ToString();
            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    
    }   
}