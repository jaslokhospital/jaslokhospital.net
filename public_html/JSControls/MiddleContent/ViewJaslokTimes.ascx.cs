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

public partial class JSControls_MiddleContent_ViewJaslokTimes : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetJaslokTimesDetails();
        }
    }
    public void GetJaslokTimesDetails()
    {

        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.CategoryID = 0;
            ds = (DataSet)objBusinessLogic.GetJaslokTimesDetails(objDAEntities);

            if (ds.Tables[0].Rows.Count == 0)
            {
                rptJaslokTimes.Visible = false;
            }
            else
            {
                rptJaslokTimes.Visible = true;
                rptJaslokTimes.DataSource = ds;
                rptJaslokTimes.DataBind();
            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }

    }

    protected void rptJaslokTimes_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Literal litTopDiv = (Literal)e.Item.FindControl("litTopDiv");
        Literal litBottomDiv = (Literal)e.Item.FindControl("litBottomDiv");
        if ((e.Item.ItemIndex + 1) % 3 == 0)
        {
            litTopDiv.Visible = true;
            litBottomDiv.Visible = true;
        }
    }
}