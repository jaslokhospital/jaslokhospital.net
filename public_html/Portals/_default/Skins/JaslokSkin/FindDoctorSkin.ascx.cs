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
using System.IO;

public partial class Portals__default_Skins_JaslokSkin_FindDoctorSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
            if (Request.QueryString["DI"] != null)
            {
                objDAEntities.DoctorId = Convert.ToInt32(Request.QueryString["DI"]);
                objDAEntities.SpecialtyId = Convert.ToInt32(Request.QueryString["SI"]);
                BindPageDetail(objDAEntities.DoctorId);
            }           
        }        
    }
    public void BindPageDetail(int id)
    {
        try
        {
            DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;
            DataSet ds = new DataSet();

            if (Request.QueryString["SI"] != null && Convert.ToInt32(Request.QueryString["SI"]) > 0)
            {
                int SID = Convert.ToInt32(Request.QueryString["SI"]);
                ds = (DataSet)objBusinessLogic.GetSpecialtiesDescription(SID);
               // string _specialtyName = GetBanner(ds);
                if (!string.IsNullOrEmpty(Convert.ToString(ds.Tables[0].Rows[0]["BannerImage"])))
                {
                    imgbanner.ImageUrl = Convert.ToString(ds.Tables[0].Rows[0]["BannerImage"]);
                }
                else
                {
                    imgbanner.Visible = false;
                }
            }
            else
            {
                imgbanner.Visible = false;
            }


            //imgbanner.ImageUrl = CommonFn.DefaultInnerpageBanner;            
             ds = null;
             ds = (DataSet)objBusinessLogic.GetDoctorDetails(objDAEntities.DoctorId);
            if (ds.Tables[0].Rows.Count > 0)
            {
                imgDoctor.ImageUrl = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageUrl"].ToString()) ? CommonFn.DefaultImagePath : ds.Tables[0].Rows[0]["ImageUrl"].ToString();
                lblDoctorName.Text = Convert.ToString(ds.Tables[0].Rows[0]["Name"]);              
                divDesignation.InnerText = Convert.ToString(ds.Tables[0].Rows[0]["Designation"]);
                divDescription.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["Description"]);
                divBriefWriteUp.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["BriefWriteUp"]);
                divAwards.InnerHtml = Convert.ToString(ds.Tables[0].Rows[0]["Awards"]);
                p.Title = "Find a Doctor | Jaslok Hospital";
                p.KeyWords = lblDoctorName.Text;            
            }
            if (ds.Tables[1].Rows.Count > 0)
            {
                DataRow[] foundRows;
                string sortOrder = "SpecialtyName ASC";
                foundRows = ds.Tables[1].Select("SpecialityId =" + objDAEntities.SpecialtyId, sortOrder);
                lblDocotrSpecialty.Text = Convert.ToString(foundRows[0]["SpecialtyName"]);
            }

        }
        catch (Exception ex)
        {
        }
    }
    protected void lbtnFAD_Click(object sender, EventArgs e)
    {
        int DID = Convert.ToInt32(Request.QueryString["DI"]);
        int SID = Convert.ToInt32(Request.QueryString["SI"]);
		Response.Redirect("/fix-appointment/" + CommonFn.RemoveSpecialCharacters(lblDoctorName.Text) + "/" + DID);
        //Response.Redirect("/Fix-An-Appointment.aspx?SI="+SID+"&DI=" + DID);
    }
}