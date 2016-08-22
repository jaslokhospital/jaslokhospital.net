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

public partial class DesktopModules_JaslokAdmin_ViewCandidateWorkExp : System.Web.UI.Page
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        int ApplicantID = 0;
        if (Request.QueryString["ApplicantID"] != null)
        {
            ApplicantID = Convert.ToInt32(Request.QueryString["ApplicantID"]);
            GetWorkExperienceByAppId(ApplicantID);
        }
    }

    public void GetWorkExperienceByAppId(int AppID)
    {
        objDAEntities.ApplicantID = AppID;
        DataSet ds = new DataSet();
        ds = null;
        ds = (DataSet)objBusinessLogic.GetWorkExperienceByAppId(objDAEntities);
        dgApplicationWorkExp.DataSource = ds;
        dgApplicationWorkExp.DataBind();
    }
}