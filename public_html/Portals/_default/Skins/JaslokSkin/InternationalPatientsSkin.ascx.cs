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

public partial class Portals__default_Skins_JaslokSkin_InternationalPatientsSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (Request.RawUrl.Contains("/international-patients/hospital-facilities"))
        {
            h3header.InnerHtml = "Hospital Facilities";
            BindPageDetail(147);


            //divCorporate.Visible = false;
            //divInternational.Visible = true;

            MainRoot.InnerText = "International Patients";
            SubRootSpan.InnerText = "Hospital Facilities";
            
        }
        else if (Request.RawUrl.Contains("/corporate-profile/hospital-facilities"))
        {
            h3header.InnerHtml = "Hospital- Facilities";
            BindPageDetail(147);
            //divCorporate.Visible = true;
            //divInternational.Visible = false;
            rootbreadcrumb.HRef = "/corporate-profile";
            MainRoot.InnerText = "International Patients";
            SubRootSpan.InnerText = "Hospital Facilities";
            
        }
        //else if (Request.RawUrl.Contains("/hospital-facilities"))
        //{
        //    h3header.InnerHtml = "Hospital- <span class='desk1'>Facilities</span>";
        //    BindPageDetail(147);
        //    divCorporate.Visible = false;
        //    divInternational.Visible = true;
        //}
        else if (Request.RawUrl.Contains("/international-patients/testimonial"))
        {
            BindPageDetail(124);
            h3header.InnerText = "Testimonial";
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/InnerTestimonials.ascx"));
            SubRootSpan.InnerText = "Testimonial";

            SubRootSpan.InnerText = "Testimonial";
            MainRoot.InnerText = "International Patients";
            rootbreadcrumb.HRef = "/international-patients";
        }
        
        
        else if (Request.RawUrl.Contains("facilities-for-international-patients"))
        {
            h3header.InnerHtml = "Hospital Facilities for International Patients";
            BindPageDetail(154);

            MainRoot.InnerText = "International Patients";
            SubRootSpan.InnerText = "Hospital Facilities for International Patients";
        }
        else if (Request.RawUrl.Contains("doctors-availability"))
        {
           // contentpane.Visible = false;
            h3header.InnerHtml = "Doctors Availability";
            BindPageDetail(155);

            MainRoot.InnerText = "International Patients";
            SubRootSpan.InnerText = "Doctors Availability";
        }
        else if (Request.RawUrl.Contains("virtual-tour"))
        {
            //divLeftMenu.Visible = false;
            h3header.InnerHtml = "Virtual Tour";
            MainRoot.InnerText = "International Patients";
            SubRootSpan.InnerText = "Virtual Tour";
            BindPageDetail(156);
        }
        else if (Request.RawUrl.Contains("Feedback"))
        {
            h3header.InnerHtml = "Query & Feedback";
            BindPageDetail(121);

            MainRoot.InnerText = "International Patients";
            SubRootSpan.InnerText = "Query & Feedback";
        }
        //else if (Request.RawUrl.Contains("testimonial"))
        //{
        //    h3header.InnerHtml = "Testimonials";
        //    BindPageDetail(124);
        //}
        else if (Request.RawUrl.Contains("estimate"))
        {
            BindPageDetail(121); 
        }
        else if (Request.RawUrl.Contains("international-patients"))
        {
            //h3header.InnerHtml = "International <span class='desk1'>Patients</span>";
            h3header.InnerHtml = "Hospital Facilities for International Patients";
            BindPageDetail(122);
            Subrootbreadcrumb.Visible = false;

            MainRoot.InnerText = "Hospital Facilities for International Patients";
            SubRootSpan.InnerText = "Query & Feedback";
            rootbreadcrumb.HRef = "javascript:void(0);";
        }

        //else if (Request.RawUrl.Contains("Estimate request"))
        //{
        //    h3header.InnerText = "Estimate request";
        //    BindPageDetail(122);
        //}
        else if (Request.RawUrl.Contains("testimonial"))
        {
            BindPageDetail(134);
            h3header.InnerText = "Testimonial";
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/TestimonialDetails.ascx"));
            SubRootSpan.InnerText = "Testimonial";
        }
        else if (Request.RawUrl.Contains("/testimonial"))
        {
            BindPageDetail(124);
            h3header.InnerText = "Testimonial";
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/InnerTestimonials.ascx"));
            SubRootSpan.InnerText = "Testimonial";
        }
        else if (Request.RawUrl.Contains("/health-check-up-comprehensive"))
        {
            leftNav.Visible = false;
            BindPageDetail(194);
            h3header.InnerText = "Health Check-up Comprehensive";
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/HealthCheckUpComprehensive.ascx"));
            SubRootSpan.InnerText = "Health Check-up Comprehensive";
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

            //HomePageBanner.Visible = (Request.RawUrl.ToLower() == "/international-patients") ? true : false;
            ds = (DataSet)Cache[id.ToString()];
            if (ds == null)
            {
                //Response.Write("Content - database call");
                ds = (DataSet)objBusinessLogic.GetBannerPageContentDetail(id);
                Cache.Insert(id.ToString(), ds);
            }
            /*else
                Response.Write("Content - Cache call");*/
            //ds = (DataSet)objBusinessLogic.GetBannerPageContentDetail(objDAEntities);
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
            //Response.Write(ex.ToString());
        }
    }

}