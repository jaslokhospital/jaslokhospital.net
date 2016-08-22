using BusinessDataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class JSControls_Home_HomePageBanner : System.Web.UI.UserControl
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    DataSet dsHomebnner = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindBanner();
    }
    public void BindBanner()
    {
        try
        {

            objDAEntities.PageTabId = AppGlobal.HomePageId;

            dsHomebnner = (DataSet)Cache[AppGlobal.HomeBannerCache];

            if (dsHomebnner == null)
            {
                dsHomebnner = (DataSet)objBusinessLogic.GetBannerDetails(objDAEntities);
                Cache.Insert(AppGlobal.HomeBannerCache, dsHomebnner);
            }



            if (dsHomebnner.Tables.Count > 0)
            {

                rptHomePagebanner.DataSource = dsHomebnner;
                rptHomePagebanner.DataBind();

                //rptPager.DataSource = dsHomebnner;
                //rptPager.DataBind();

            }
        }
        catch (Exception ex)
        {
        }
    }
}