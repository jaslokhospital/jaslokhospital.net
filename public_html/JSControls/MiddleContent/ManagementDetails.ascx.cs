using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_ManagementDetails : PortalModuleBase
{
    public CommonFn objcommonfun = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["uid"] != null || Request.QueryString["uid"] != "")
            {
                int id = Convert.ToInt32(Request.QueryString["uid"]);
                BindUserDetail(id);
            }
        }
    }
    public void BindUserDetail(int uid)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.UserId = uid;

            ds = (DataSet)objBusinessLogic.GetUserDetails(objDAEntities);
            if (ds.Tables[0].Rows.Count > 0)
            {
                imgProfile.ImageUrl = Convert.ToString(ds.Tables[0].Rows[0]["ImageUrl"]);
                FindDName.InnerText = Convert.ToString(ds.Tables[0].Rows[0]["Name"]);
                lblDoctorDesignation.InnerText = Convert.ToString(ds.Tables[0].Rows[0]["Designation"]);
                //pbodyDesignation.InnerText = Convert.ToString(ds.Tables[0].Rows[0]["Designation"]);
                pbodyDescription.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["Description"]);

                DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;
                if (!string.IsNullOrEmpty(FindDName.InnerText))
                    p.Title = FindDName.InnerText + " | Jaslok Hospital";
            }
            else
            {
                DivNotfound.Visible = true;
                DivDetail.Visible = false;
            }

        }
        catch (Exception ex)
        {

        }
    }
   
}