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

public partial class JSControls_MiddleContent_JaslokCareer : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    Boolean pageindexevent = false;
    Boolean pageSizeChangedRaised = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BingJobCategory();
            BingJobPositions();
            GetPositionsForListing(1);
        }
    }

    public void BingJobCategory()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetCareerCategoryDetails();

            ddlCategory.DataValueField = "FunctionId";
            ddlCategory.DataTextField = "FunctionName";
            ddlCategory.DataSource = ds;
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
        }
        catch (Exception ex)
        {

        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GetPositionsForListing(1);
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        ddlPosition.SelectedValue = "0";
        ddlCategory.SelectedValue = "0";
        GetPositionsForListing(1);

    }


    public void BingJobPositions()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.FunctionId = Convert.ToInt32(ddlCategory.SelectedValue);

            ds = (DataSet)objBusinessLogic.GetCareerPositions(objDAEntities);
            ddlPosition.DataValueField = "JobId";
            ddlPosition.DataTextField = "Position";
            ddlPosition.DataSource = ds;
            ddlPosition.DataBind();
            ddlPosition.Items.Insert(0, new ListItem("-Select-", "0"));
        }
        catch (Exception ex)
        {

        }
    }

    public void GetPositionsForListing(int i)
    {
        DataSet ds = new DataSet();
        ds = null;
        rgCareerPost.PagerStyle.Visible = true;
        objDAEntities.FunctionId = Convert.ToInt32(ddlCategory.SelectedValue);
        objDAEntities.JobId = Convert.ToInt32(ddlPosition.SelectedValue);
        objDAEntities.jcPageSize = rgCareerPost.PageSize;
        objDAEntities.jcCurrentPageIndex = rgCareerPost.CurrentPageIndex;

        ds = (DataSet)objBusinessLogic.GetPositionsForListing(objDAEntities);

        if (ds.Tables[0].Rows.Count > 0)
        {
            rgCareerPost.DataSource = ds;
            rgCareerPost.AllowCustomPaging = true;
            rgCareerPost.VirtualItemCount = Convert.ToInt32(ds.Tables[0].Rows[0]["TotalRecord"]);
            if (i == 1)
            {
                rgCareerPost.DataBind();
            }            

        }
        else
        {
            rgCareerPost.DataSource = ds;
            rgCareerPost.DataBind();
            rgCareerPost.PagerStyle.Visible  = false;
        }

        
    }

    protected void rgCareerPost_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        if (pageindexevent == true)
        {
            pageindexevent = false;
            GetPositionsForListing(2);
        }
    }

    protected void rgCareerPost_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        rgCareerPost.DataSource = null;
        rgCareerPost.CurrentPageIndex = e.NewPageIndex;
        pageindexevent = true;

    }

    protected void rgCareerPost_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
    {
        if (pageSizeChangedRaised == false)
        {
            rgCareerPost.DataSource = null;
            pageSizeChangedRaised = true;
            rgCareerPost.PageSize = e.NewPageSize;
            rgCareerPost.CurrentPageIndex = 0;
            GetPositionsForListing(1);
        }

    }


    
}