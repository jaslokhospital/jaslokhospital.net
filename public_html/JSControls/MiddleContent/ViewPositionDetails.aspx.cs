using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_ViewPositionDetails : System.Web.UI.Page
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        int JobId = 0;
        if (Request.QueryString["JobId"] != null)
        {
            JobId = Convert.ToInt32(Request.QueryString["JobId"]);
            GetPositionInfoByJobId(JobId);
        }
    }

    public void GetPositionInfoByJobId(int JobId)
    {
        objDAEntities.JobId = JobId;
        DataSet ds = new DataSet();
        ds = null;
        ds = (DataSet)objBusinessLogic.GetPositionInfoByJobId(objDAEntities);

        if (ds.Tables[0] != null)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblFunctionName.Text = ds.Tables[0].Rows[0]["FunctionName"].ToString();
                lblPost.Text = ds.Tables[0].Rows[0]["Position"].ToString();
                lblLocation.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                lblTotalVacancy.Text = ds.Tables[0].Rows[0]["TotalVacantPosition"].ToString();
                lblTotalExpReq.Text = ds.Tables[0].Rows[0]["TotalExperience"].ToString();
                lblRolesAndResp.Text = ds.Tables[0].Rows[0]["Job_Role"].ToString();
                lblEducation.Text = ds.Tables[0].Rows[0]["Education"].ToString();
                lblSubmittedAt.Text = ds.Tables[0].Rows[0]["SubmittedAt"].ToString();
                lblMinExp.Text = ds.Tables[0].Rows[0]["MinExp"].ToString();
                lblMaxExp.Text = ds.Tables[0].Rows[0]["MaxExp"].ToString();

                
            }
        }

        
    }

}