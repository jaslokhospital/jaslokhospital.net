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
using System.Text;
using System.IO;
using System.Web.UI.HtmlControls;
using DotNetNuke.Framework;

public partial class Portals__default_Skins_JaslokSkin_SpecialtiesDetailsSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{           
                //BindPageDetail(133);
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
                if (Request.QueryString["SID"] != null)
                {
                    BindSpecialties(Convert.ToInt32(Request.QueryString["SID"]));
                   
                }               
        //}
    }
    //public void BindPageDetail(int id)
    //{

    //    try
    //    {
    //        DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;

    //        DataSet ds = new DataSet();
    //        ds = null;
    //        objDAEntities.PageTypeId = id;
    //        ds = (DataSet)objBusinessLogic.GetBannerPageContentDetail(objDAEntities);
    //        /*if (ds.Tables[0].Rows.Count > 0)
    //        {
    //            imgbanner.ImageUrl = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageUrl"].ToString()) ? CommonFn.DefaultInnerpageBanner : ds.Tables[0].Rows[0]["ImageUrl"].ToString();
    //        }
    //        else
    //        {
    //            imgbanner.ImageUrl = CommonFn.DefaultInnerpageBanner;
    //        }*/
    //        if (ds.Tables[1].Rows.Count > 0)
    //        {
    //            if (Convert.ToString(ds.Tables[1].Rows[0]["Content"]).Length>0)
    //            {
    //                innerParagraph.Visible = true;
    //                innerParagraph.InnerHtml = Convert.ToString(ds.Tables[1].Rows[0]["Content"]);
    //            }
    //            else
    //            {
    //                innerParaDiv.Visible = false;
    //            }
    //            p.Title = ds.Tables[1].Rows[0]["PageTitle"].ToString();
    //            p.KeyWords = ds.Tables[1].Rows[0]["PageKeywords"].ToString();
    //            p.Description = ds.Tables[1].Rows[0]["PageDescription"].ToString();
    //        }
            
    //    }
    //    catch (Exception ex)
    //    {
    //    }    
    //}

    public void BindSpecialties(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetDoctoDetailbySID(id);

            if (!string.IsNullOrEmpty(Convert.ToString(ds.Tables[0].Rows[0]["keyword"])))
            {
                CDefault tp = (CDefault)this.Page;
                tp.KeyWords = Convert.ToString(ds.Tables[0].Rows[0]["keyword"]);
            }
			//string _specialtyName = String.Empty;
            if (Convert.ToString(ds.Tables[0].Rows[0]["CategoryName"]) == "Patient Facilities")
            {
				if (ds.Tables[0].Rows.Count > 0)
                {
                    h3header1.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["SpecialtyName"]);
                    h3subheader.Visible = false;
                    //_specialtyName = GetBanner(ds);
                    //if (!string.IsNullOrEmpty(Convert.ToString(ds.Tables[0].Rows[0]["BannerImage"])))
                    //{
                    //    imgAbout.ImageUrl = Convert.ToString(ds.Tables[0].Rows[0]["BannerImage"]);
                    //}
                    //else
                    //{
                    //    imgAbout.Visible = false;
                    //}
                    imgAbout.Visible = false;
                   // aboutheader.Visible = false;
                    PAboutSD.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["About"]);
                    leftPanelTab.Visible = false;
                }
            }
            else
            {
                //leftPanelTab.Visible = true;
                if (ds.Tables[0].Rows.Count > 0)
                {
					
                    h3header1.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["SpecialtyName"]);
                    //_specialtyName = GetBanner(ds);
                    if (!string.IsNullOrEmpty(Convert.ToString(ds.Tables[0].Rows[0]["BannerImage"])))
                    {
                        imgAbout.ImageUrl = Convert.ToString(ds.Tables[0].Rows[0]["BannerImage"]);
                    }
                    else
                    {
                        imgAbout.Visible = false;
                    }
                    objDAEntities.SpecialtyId = Convert.ToInt32(ds.Tables[0].Rows[0]["SpecialtyId"]);
                    PAboutSD.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["About"]);
                    PFacilities.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["Facilities"]);

                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    datalistOurSpecialtyDs.DataSource = ds.Tables[1];
                    datalistOurSpecialtyDs.DataBind();
                }
            }
           lblAboutmsg.Visible = (PAboutSD.InnerHtml.Length > 0) ? false : true;
           lblFacilitiesMsg.Visible = (PFacilities.InnerHtml.Length > 0) ? false : true;
           lblNoRec.Visible = (datalistOurSpecialtyDs.Items.Count > 0) ? false : true;



           DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;
           if (!string.IsNullOrEmpty(h3header1.InnerHtml))
               p.Title = h3header1.InnerHtml + " | Jaslok Hospital";
           else
               p.Title = "Specialties | Jaslok Hospital";
           p.KeyWords =Convert.ToString(ds.Tables[0].Rows[0]["keyword"]);
          // p.Description = ds.Tables[1].Rows[0]["PageDescription"].ToString();
        }
        catch (Exception ex)
        {
        }
    }   
    protected void datalistOurSpecialtyDs_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Literal litDoctorDesc = e.Item.FindControl("litDoctorDesc") as Literal;
        Literal litBriefWriteUp = e.Item.FindControl("litBriefWriteUp") as Literal;
        Literal litAwards = e.Item.FindControl("litAwards") as Literal;
        HtmlGenericControl MainPanel = e.Item.FindControl("MainPanel") as HtmlGenericControl;
        Panel panelArea = e.Item.FindControl("panelArea") as Panel;
        Panel pnlBriefWriteUp = e.Item.FindControl("pnlBriefWriteUp") as Panel;
        Panel panelAwards = e.Item.FindControl("panelAwards") as Panel;

        if (!String.IsNullOrEmpty(litDoctorDesc.Text) || !String.IsNullOrEmpty(litBriefWriteUp.Text) || !String.IsNullOrEmpty(litAwards.Text))
        {
            MainPanel.Visible = true;

            if (!String.IsNullOrEmpty(litDoctorDesc.Text))
            {
                panelArea.Visible = true;
            }

            if (!String.IsNullOrEmpty(litBriefWriteUp.Text))
            {
                pnlBriefWriteUp.Visible = true;
            }
            if (!String.IsNullOrEmpty(litAwards.Text))
            {
                panelAwards.Visible = true;
            }

        }
    }
    protected void lkbAppointment_Command(object sender, CommandEventArgs e)
    {
        
    }
    protected void lkbAppointment_Click(object sender, EventArgs e)
    {
        
    }
    protected void datalistOurSpecialtyDs_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "AppointMentRedirect")
        {
            Session["SpecialityId"] = Request.QueryString["SID"];
            Response.Redirect(e.CommandArgument.ToString());
        }
    }
}