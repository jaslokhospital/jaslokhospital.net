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

public partial class Portals__default_Skins_JaslokSkin_EducationalProgarmSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
       if (Request.RawUrl.Contains("seminars"))
        {
            h3header.InnerText = "Seminars";
            BindPageDetail(140);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/SemminarListing.ascx"));

            SubRootSpan.InnerText = "Seminars";
        }
       else if (Request.RawUrl.Contains("educational-programs"))
       {
           h3header.InnerText = "Educational Programs";
           BindPageDetail(160);

           SubRootSpan.InnerText = "Educational Programs";
       }
        else if (Request.RawUrl.Contains("applyseminar"))
        {
            h3header.InnerText = "Apply Seminar";
            BindPageDetail(141);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/ApplySeminar.ascx"));

            SubRootSpan.InnerText = "Apply Seminar";
        }
        else if (Request.RawUrl.Contains("health-tips"))
        {
            h3header.InnerHtml = "Health Tips";
            BindPageDetail(144);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/HealthTips.ascx"));

            SubRootSpan.InnerText = "Health Tips";
        }
		else if (Request.RawUrl.Contains("research-paper"))
        {
            h3header.InnerHtml = "Research Papers";
            BindPageDetail(186);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/ResearchPaper.ascx"));

            SubRootSpan.InnerText = "Research Paper";
        }
        else if (Request.RawUrl.Contains("healthtip"))
        {
            h3header.InnerText = "Health Tips Details";
            BindPageDetail(146);
            divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/HealthTipsDetails.ascx"));

            SubRootSpan.InnerText = "Health Tips Details";
        }
        else if (Request.RawUrl.Contains("nursing-program"))
        {
            h3header.InnerHtml = "Nursing Program";
            BindPageDetail(152);

            SubRootSpan.InnerText = "Nursing Program";
        }
        else if (Request.RawUrl.Contains("advance-courses"))
        {
            h3header.InnerHtml = "Advance Courses";
            BindPageDetail(151);

            SubRootSpan.InnerText = "Advance Courses";
        }
        else if (Request.RawUrl.Contains("internship"))
        {
            h3header.InnerText = "Internship";
            BindPageDetail(150);

            SubRootSpan.InnerText = "Internship";
        }
        else if (Request.RawUrl.Contains("fellowship"))
        {
            h3header.InnerText = "Fellowship";
            BindPageDetail(149);

            SubRootSpan.InnerText = "Fellowship";
        }
        else if (Request.RawUrl.Contains("dnb-program"))
        {
            h3header.InnerHtml ="DNB Program";
            BindPageDetail(148);

            SubRootSpan.InnerText = "DNB Program";
        }
       else if (Request.RawUrl.Contains("healthtips"))
       {
           h3header.InnerText = "Health Tips";
           BindPageDetail(144);
           divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/HealthTips.ascx"));

           SubRootSpan.InnerText = "Health Tips";
       }
       else if (Request.RawUrl.Contains("healthdetails"))
       {
           h3header.InnerText = "Health Tips Details";
           BindPageDetail(146);
           divcontentpane.Controls.Add(LoadControl("~/JSControls/MiddleContent/HealthTipsDetails.ascx"));

           SubRootSpan.InnerText = "Health Tips Details";
       }
        
        //else if (Request.RawUrl.Contains("seminars"))
        //{
        //    h3header.InnerText = "Seminars";
        //    BindPageDetail(140);
        //}
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
                contentpane.InnerHtml = ds.Tables[1].Rows[0]["Content"].ToString();

                p.Title = ds.Tables[1].Rows[0]["PageTitle"].ToString();
                p.KeyWords = ds.Tables[1].Rows[0]["PageKeywords"].ToString();
                p.Description = ds.Tables[1].Rows[0]["PageDescription"].ToString();
            }
            else
            {
                contentpane.Visible = false;
            }
            
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    
}