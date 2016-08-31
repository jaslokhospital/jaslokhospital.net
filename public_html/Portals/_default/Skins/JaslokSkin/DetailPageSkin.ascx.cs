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

public partial class Portals__default_Skins_JaslokSkin_DetailPageSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (Request.RawUrl.ToLower().Contains("scope-of-services"))
        {
            //contentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/ScopeOfServices.ascx"));
            BindPageDetail(116);
            h3header.InnerText = "Scope of Services";
            SubRootSpan.InnerText = "Scope of Services";
            imgbanner.Visible = false;
        }
        else if (Request.RawUrl.ToLower().Contains("vision-and-mission"))
        {
            h3header.InnerText = "Vision and Mission";
            BindPageDetail(118);
            SubRootSpan.InnerText = "Vision and Mission";
        }
        else if (Request.RawUrl.ToLower().Contains("from-the-chairmans-desk"))
        {
            BindPageDetail(117);
            //h3header.InnerText = "From The Chairman’s Desk";
            //h3header.Attributes.Add("class", "desk");
            //h3header.InnerHtml = "From The <span class='desk1' >Chairman’s Desk</span>";
            h3header.InnerHtml = "From The Chairman’s Desk";
            SubRootSpan.InnerText = "From The Chairman’s Desk";
        }
        else if (Request.RawUrl.ToLower().Contains("photo-gallery"))
        {
            leftNav.Visible = false;
            BindPageDetail(135);
            h3header.InnerText = "Photo Gallery";
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/InnerPhotoGallery.ascx"));
            SubRootSpan.InnerText = "Photo Gallery";
        }
        else if (Request.RawUrl.ToLower().Contains("video-gallery"))
        {
            leftNav.Visible = false;
            h3header.InnerText = "Video Gallery";
            BindPageDetail(136);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/InnerVideoGallery.ascx"));
            SubRootSpan.InnerText = "Video Gallery";
        }
        else if (Request.RawUrl.ToLower().Contains("/corporate-profile/management-team"))
        {
            h3header.InnerText = "Management";
            BindPageDetail(123);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/InnerManagement.ascx"));
            SubRootSpan.InnerText = "Management";
        }
        else if (Request.RawUrl.ToLower().Contains("/management"))
        {
            leftNav.Visible = false;
            h3header.InnerText = "Management Details";
            BindPageDetail(162);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/ManagementDetails.ascx"));
            SubRootSpan.InnerText = "Management Details";
        }
        else if (Request.RawUrl.ToLower().Contains("/corporate-profile/jaslok-news"))
        {
            //BindPageDetail(124);
            BindPageDetail(172);
            h3header.InnerText = "Jaslok in News";
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/NewsListing.ascx"));
            SubRootSpan.InnerText = "Jaslok in News";
        }
        else if (Request.RawUrl.ToLower().Contains("press"))
        {
            BindPageDetail(168);
            h3header.InnerText = "Jaslok in News";
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/JaslokNewsDetails.ascx"));
            SubRootSpan.InnerText = "Jaslok in News";
        }
        else if (Request.RawUrl.ToLower().Contains("/corporate-profile/trustees"))
        {
            h3header.InnerText = "Trustees";
            BindPageDetail(125);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/InnerTrustees.ascx"));
            SubRootSpan.InnerText = "Trustees";
        }
        else if (Request.RawUrl.ToLower().Contains("/corporate-profile/certifications"))
        {
            BindPageDetail(126);
            h3header.InnerText = "Certifications";
            SubRootSpan.InnerText = "Certifications";
        }
        
        else if (Request.RawUrl.ToLower().Contains("/corporate-profile/jaslok-news"))
        {
            //BindPageDetail(124);
            BindPageDetail(172);
            h3header.InnerText = "Jaslok in News";
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/NewsListing.ascx"));
            SubRootSpan.InnerText = "Jaslok in News";
        }
        else if (Request.RawUrl.ToLower().Contains("/trustees"))
        {
            leftNav.Visible = false;
            h3header.InnerText = "Trustees Details";
            BindPageDetail(179);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/ManagementDetails.ascx"));
            SubRootSpan.InnerText = "Trustees Details";
        }

        
        else if (Request.RawUrl.ToLower().Contains("mediaroom"))
        {
            BindPageDetail(127);
            h3header.InnerText = "Media Room";
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/InnerMediaRoom.ascx"));
            SubRootSpan.InnerText = "Media Room";
        }
        else if (Request.RawUrl.ToLower().Contains("tenders"))
        {
            BindPageDetail(128);
            h3header.InnerText = "Tenders";
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/InnerTenders.ascx"));
            SubRootSpan.InnerText = "Tenders";
        }
        else if (Request.RawUrl.ToLower().Contains("quality-corner"))
        {
            BindPageDetail(129);
            h3header.InnerText = "Quality Corner";
            SubRootSpan.InnerText = "Quality Corner";
        }
        else if (Request.RawUrl.ToLower().Contains("contact-us"))
        {
            imgbanner.Visible = false;
            leftNav.Visible = false;
            h3header.InnerText = "Contact Us";
            BindPageDetail(137);
            SubRootSpan.InnerText = "Contact Us";

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "SetWidth();", true);
            //divContactus.Style.Add("width","38%");
            divMap.Visible = true;
            divMap.Controls.Add(LoadControl("~/JSControls/Common/Contactus.ascx"));
        }
        else if (Request.RawUrl.ToLower().Contains("frequently-asked-questions"))
        {
            BindPageDetail(130);
            h3header.InnerText = "FAQs";
            SubRootSpan.InnerText = "FAQ";
            // divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/InnerTenders.ascx"));
        }
        else if (Request.RawUrl.ToLower().Contains("jasloktimes"))
        {
            h3header.InnerText = "Jaslok Times";
            BindPageDetail(139);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/ViewJaslokTimes.ascx"));
            // SubRootSpan.InnerText = "Jaslok Times"; 
            PageBreadCub.Visible = false;
        }
        else if (Request.RawUrl.ToLower().Contains("seminars"))
        {
            h3header.InnerText = "Seminars";
            BindPageDetail(140);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/SemminarListing.ascx"));
            SubRootSpan.InnerText = "Seminars";
        }
        else if (Request.RawUrl.ToLower().Contains("applyseminar"))
        {
            h3header.InnerText = "Apply Seminar";
            BindPageDetail(141);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/ApplySeminar.ascx"));
            SubRootSpan.InnerText = "Apply Seminar";
        }
        else if (Request.RawUrl.ToLower().Contains("health-check-up"))
        {
            h3header.InnerHtml = "Health Checkup";
            BindPageDetail(166);
            SubRootSpan.InnerText = "Health Checkup";
            MainRoot.InnerText = "Specialties";
            rootbreadcrumb.HRef = "/specialties";
            //ulSpeciality.Visible = true;
            //ulCorporate.Visible = false;
        }
        else if (Request.RawUrl.ToLower().Contains("/technological-milestone"))
        {
            h3header.InnerText = "Technological Milestone";
            BindPageDetail(182);
            SubRootSpan.InnerText = "Technological Milestone";
        }
        else if (Request.RawUrl.ToLower().Contains("hospital-facilities"))
        {
            h3header.InnerText = "Hospital Facilities";
            BindPageDetail(147);
            SubRootSpan.InnerText = "Hospital Facilities";
            imgbanner.Visible = false;
        }
        else if (Request.RawUrl.ToLower().Contains("corporate-profile"))
        {
            // h3header.InnerText = "Corporate Profile";
            //h3header.Attributes.Add("class", "desk");
            h3header.InnerHtml = "Corporate Profile";
            BindPageDetail(159);
            Subrootbreadcrumb.Visible = false;
            rootbreadcrumb.HRef = "javascript:void(0);";
        }
        else if (Request.RawUrl.ToLower().Contains("about-us"))
        {
            leftNav.Visible = false;
            h3header.InnerText = "About Us";
            BindPageDetail(153);
            SubRootSpan.InnerText = "About Us";
        }
        else if (Request.RawUrl.ToLower().Contains("career"))
        {
            leftNav.Visible = false;
            h3header.InnerText = "Career";
            BindPageDetail(161);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/JaslokCareer.ascx"));
            SubRootSpan.InnerText = "Career";
        }
        else if (Request.RawUrl.ToLower().Contains("applytojaslok"))
        {
            leftNav.Visible = false;
            h3header.InnerText = "Apply to Jaslok";
            BindPageDetail(161);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/ApplyJaslokCareer.ascx"));
            SubRootSpan.InnerText = "Apply to Jaslok";
        }

        else if (Request.RawUrl.ToLower().Contains("sitemap"))
        {
            leftNav.Visible = false;
            h3header.InnerHtml = "Sitemap";
            BindPageDetail(183);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/Sitemap.ascx"));
            Subrootbreadcrumb.Visible = false;
            rootbreadcrumb.HRef = "javascript:void(0);";
        }
        else if (Request.RawUrl.ToLower().Contains("privacy-policy"))
        {
            // h3header.InnerText = "Corporate Profile";
            //h3header.Attributes.Add("class", "desk");
            h3header.InnerHtml = "Privacy Policy";
            BindPageDetail(185);
            Subrootbreadcrumb.Visible = false;
            rootbreadcrumb.HRef = "javascript:void(0);";
        }
        else if (Request.RawUrl.ToLower().Contains("/surgery-booking"))
        {
            //h3header.InnerText = "Corporate Profile";
           // h3header.Attributes.Add("class", "desk");
            leftNav.Visible = false;
            h3header.InnerHtml = "Surgery Grade Wise";
            BindPageDetail(191);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/SurgeryBooking.ascx"));
            SubRootSpan.InnerText = "Surgery Booking";
        }

        else if (Request.RawUrl.ToLower().Contains("/outstandingbillpayment"))
        {
            leftNav.Visible = false;
            h3header.InnerHtml = "Outstanding Bill Payment";
            BindPageDetail(192);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/OutStandingBillPayment.ascx"));
            SubRootSpan.InnerText = "Outstanding Bill Payment";
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
            ds = (DataSet)Cache[id.ToString()];
            if (ds == null)
            {
                //Response.Write("Content - database call");
                ds = (DataSet)objBusinessLogic.GetBannerPageContentDetail(id);
                Cache.Insert(id.ToString(), ds);
            }
            /*else
                Response.Write("Content - Cache call");*/

            if (ds.Tables[0].Rows.Count > 0)
            {
                if (Request.RawUrl.ToLower().Contains("corporate-Profile") || Request.RawUrl.ToLower().Contains("corporate-profile"))
                {
                    //imgbanner.ImageUrl = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageUrl"].ToString()) ? CommonFn.DefaultInnerpageBanner : ds.Tables[0].Rows[0]["ImageUrl"].ToString();
                    imgbanner.ImageUrl = "/Content/Banner/3_header_corporate_profile-20151217113731433.jpg";
                }
            }
            else
            {
                imgbanner.Visible = false;
            }
            // imgbanner.Visible = (Request.RawUrl.ToLower().ToLower() == "/corporate-profile" || "/corporate-profile") ? true : false;           
            //if (Convert.ToString(ds.Tables[1].Rows[0]["Content"]) != null || Convert.ToString(ds.Tables[1].Rows[0]["Content"]) != "")

            if (ds.Tables[1].Rows.Count > 0)
            {
                contentpane.InnerHtml = Convert.ToString(ds.Tables[1].Rows[0]["Content"]);

                p.Title = Convert.ToString(ds.Tables[1].Rows[0]["PageTitle"]);
                p.KeyWords = Convert.ToString(ds.Tables[1].Rows[0]["PageKeywords"]);
                p.Description = Convert.ToString(ds.Tables[1].Rows[0]["PageDescription"]);
            }
            else
            {
                contentpane.Visible = false;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }

}