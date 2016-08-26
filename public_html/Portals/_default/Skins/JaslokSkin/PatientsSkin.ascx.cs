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

public partial class Portals__default_Skins_JaslokSkin_PatientsSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (Request.RawUrl.Contains("Patient-Facilities"))
        {
            h3header.InnerText = "Patient Facilities";
            BindPageDetail(158);
        }
        else if (Request.RawUrl.Contains("feedback"))
        {
            h3header.InnerText = "Feedback";
            BindPageDetail(121);
        }
        else if (Request.RawUrl.Contains("complaint"))
        {
            h3header.InnerText = "Complaint";
            BindPageDetail(131);
        }
        else if (Request.RawUrl.Contains("Quick-Inquiry"))
        {
            h3header.InnerText = "Quick Inquiry";
            BindPageDetail(142);
        }
        else if (Request.RawUrl.Contains("patients"))
        {
            h3header.InnerText = "Patients";
            BindPageDetail(157);
        }
       
    }
    public void BindPageDetail(int id)
    {
        try
        {
            DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;

            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.PageTypeId = id;
            ds = (DataSet)objBusinessLogic.GetBannerPageContentDetail(id);
            HomePageBanner.Visible = (Request.RawUrl.ToLower() == "/patientfacilities") ? true : false;

            /*if (ds.Tables[0].Rows.Count > 0)
            {
                imgbanner.ImageUrl = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageUrl"].ToString()) ? CommonFn.DefaultInnerpageBanner : ds.Tables[0].Rows[0]["ImageUrl"].ToString();
            }
            else
            {
                imgbanner.ImageUrl = CommonFn.DefaultInnerpageBanner;
            }*/
            if (ds.Tables[1].Rows.Count > 0)
            {
                innerParagraph.InnerHtml = ds.Tables[1].Rows[0]["Content"].ToString();
                p.Title = ds.Tables[1].Rows[0]["PageTitle"].ToString();
                p.KeyWords = ds.Tables[1].Rows[0]["PageKeywords"].ToString();
                p.Description = ds.Tables[1].Rows[0]["PageDescription"].ToString();
            }
            else
            {
                innerParagraph.Visible = false;
            }
            
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    
}