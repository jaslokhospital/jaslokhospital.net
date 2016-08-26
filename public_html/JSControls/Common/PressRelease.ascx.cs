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

public partial class JSControls_Common_PressRelease : System.Web.UI.UserControl
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    public int iCounterPager = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
       
            BindPressRelease();
    }
    public void BindPressRelease()
    {
        try
        {
            DataSet dsPressRelease = new DataSet();
            dsPressRelease = null;
            objDAEntities.IsActive = true;

            dsPressRelease = (DataSet)Cache[AppGlobal.HomePressReleaseCache];
            if (dsPressRelease == null)
            {
                dsPressRelease = (DataSet)objBusinessLogic.GetNewsDetails(objDAEntities);
                Cache.Insert(AppGlobal.HomePressReleaseCache, dsPressRelease);
            }

            rptPressRelease.DataSource = dsPressRelease.Tables[0].AsEnumerable().Take(5).CopyToDataTable();
            rptPressRelease.DataBind();


           rptPager.DataSource = dsPressRelease.Tables[0].AsEnumerable().Take(5);
           rptPager.DataBind();

        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
}