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
using DotNetNuke.Entities.Tabs;
using System.Xml;
using System.Xml.Linq;

public partial class Portals__default_Skins_JaslokSkin_DetailPageSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));

        XmlDocument xmldoc = new XmlDocument();
        xmldoc.Load(Server.MapPath("~/LoadControl.xml"));
        XmlNode node = xmldoc.SelectSingleNode("/Data/add[@key='"+Request.RawUrl.ToLower()+"']");

        if (node != null)
        {
            if (node.Attributes["value"].Value != string.Empty)
                divcontentpane.Controls.Add(LoadControl(node.Attributes["value"].Value));
            BindPageDetail(TabController.CurrentPage.TabID);
            h3header.InnerText = node.Attributes["Title"].Value;
            SubRootSpan.InnerText = node.Attributes["Title"].Value;
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
                if (id == 123)
                {
                    divContent.Visible = true;
                    divContent.InnerHtml = Convert.ToString(ds.Tables[1].Rows[0]["Content"]);
                }
                else
                {
                    contentpane.InnerHtml = Convert.ToString(ds.Tables[1].Rows[0]["Content"]);

                    p.Title = Convert.ToString(ds.Tables[1].Rows[0]["PageTitle"]);
                    p.KeyWords = Convert.ToString(ds.Tables[1].Rows[0]["PageKeywords"]);
                    p.Description = Convert.ToString(ds.Tables[1].Rows[0]["PageDescription"]);
                }
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