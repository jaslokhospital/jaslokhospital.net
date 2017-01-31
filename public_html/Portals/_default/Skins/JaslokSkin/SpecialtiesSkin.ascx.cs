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

public partial class Portals__default_Skins_JaslokSkin_SpecialtiesSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    DataSet dsBindPageDetail;

    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (!IsPostBack)
        {
            BindPageDetail(132);
            BindSpecialties(0);
            if (Request.RawUrl.ToLower().Contains("/patients/patient-facilities"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert1", "openSISPanel('Patient');", true);

                MainRoot.InnerText = "Patient Facilities";
                rootbreadcrumb.HRef = "/patients/patient-facilities";
            }
            else if (Request.RawUrl.ToLower().Contains("/specialties/speciality-clinic"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert1", "openSISPanel('Specialty');", true);

                MainRoot.InnerText = "Specialty Clinics";
                rootbreadcrumb.HRef = "/specialties/speciality-clinic";

            }
            else if (Request.RawUrl.Contains("health-check-up"))
            {
                h3header.InnerHtml = "Health CheckUp";
                BindPageDetail(166);
                SubRootSpan.InnerText = "Health Checkup";
                MainRoot.InnerText = "Specialties";
                rootbreadcrumb.HRef = "/specialties";
                Subrootbreadcrumb.Visible = true;
            }
        }
    }
    public void BindPageDetail(int id)
    {
        try
        {
            DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;
            objDAEntities.PageTypeId = id;
            dsBindPageDetail = Cache[AppGlobal.SpecialtyPage_BindSpecialtiesCache] as DataSet;

            if (dsBindPageDetail == null)
            {
                dsBindPageDetail = new DataSet();
                dsBindPageDetail = (DataSet)objBusinessLogic.GetBannerPageContentDetail(id);
                Cache.Insert(AppGlobal.SpecialtyPage_BindSpecialtiesCache, dsBindPageDetail);
            }

            // HomePageBanner.Visible = (Request.RawUrl.ToLower() == "/specialties") ? true : false;
            if (dsBindPageDetail.Tables[1].Rows.Count > 0)
            {
                innerParagraph.InnerHtml = Convert.ToString(dsBindPageDetail.Tables[1].Rows[0]["Content"]);
                p.Title = Convert.ToString(dsBindPageDetail.Tables[1].Rows[0]["PageTitle"]);
                p.KeyWords = Convert.ToString(dsBindPageDetail.Tables[1].Rows[0]["PageKeywords"]);
                p.Description = Convert.ToString(dsBindPageDetail.Tables[1].Rows[0]["PageDescription"]);
            }
            else
            {
                Div1.Visible = false;
            }
        }
        catch (Exception ex)
        {
        }
    }
    public void BindSpecialties(int id)
    {
        try
        {
            DataSet dsBindSpecialties = Cache["BindSpecialtiesCache"] as DataSet;
            //Response.Write((Cache["BindSpecialtiesCache"] == null).ToString() + "<br />");
            if (dsBindSpecialties == null)
            {
                //Response.Write("from database");
                dsBindSpecialties = objBusinessLogic.GetSpecialtiesDetails(id) as DataSet;
                Cache["BindSpecialtiesCache"] = dsBindSpecialties;
            }
            /*else
            {
                Response.Write("from cache");
            }*/

            // ds = (DataSet)objBusinessLogic.GetSpecialtiesDetails(id);
            DataView dv = dsBindSpecialties.Tables[0].Select("CategoryId=" + AppGlobal.MedicalSpecialtiesId).CopyToDataTable().DefaultView;
            dv.Sort = "SpecialtyName";
            datalistSpecialtySkin.DataSource = dv;
            datalistSpecialtySkin.DataBind();

            dv = dsBindSpecialties.Tables[0].Select("CategoryId=" + AppGlobal.PatientFacilitiesId).CopyToDataTable().DefaultView;
            dv.Sort = "SpecialtyName";
            datalistPnlPatientSISP.DataSource = dv;
            datalistPnlPatientSISP.DataBind();

            dv = dsBindSpecialties.Tables[0].Select("CategoryId=" + AppGlobal.SpecialtyClinicsId).CopyToDataTable().DefaultView;
            dv.Sort = "SpecialtyName";
            datalistPnlSpecialitySISP.DataSource = dv;
            datalistPnlSpecialitySISP.DataBind();

        }
        catch (Exception ex)
        {
        }
    }

}