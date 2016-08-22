using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ManageSAchievements : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            objDAEntities.AchievementID = 0;
            objDAEntities.AchievementTitle = txtAchievementTitle.Text;
            objDAEntities.PublishedDate = DateTime.Parse(txtPublishDate.SelectedDate.ToString());
            objDAEntities.AchievementSummery = reAchievementSummary.Content.Replace("&nbsp;", "");
            objDAEntities.CreatedBy = "1";

            objBusinessLogic.AddEditSAchievement(objDAEntities);

            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Data Save successfully!!!";

            Clear();

        }
        catch (Exception ex)
        {
            lblMessage.CssClass = "errorlbl";
            lblMessage.Text = ex.Message;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
        lblMessage.Visible = false;
    }
    public void Clear()
    {
        txtAchievementTitle.Text = "";
        txtPublishDate.SelectedDate = null;
        reAchievementSummary.Content = null;

    }

}