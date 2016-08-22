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

public partial class Portals__default_Skins_JaslokSkin_SpecialityClinicOPDSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    DataSet ds = new DataSet();
    DataSet dsopdDoctors = new DataSet();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        ds = (DataSet)objBusinessLogic.GetActiveSpecialityClinicOPD();
        dsopdDoctors = (DataSet)objBusinessLogic.GetSpecialityClinicOPDDoctors();
        rptSpeciality.DataSource = ds;
        rptSpeciality.DataBind();

        rptRightSpecialityClinic.DataSource = ds;
        rptRightSpecialityClinic.DataBind();
        BindPageDetail(177);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "hidespeciality('"+CommonFn.RemoveBadCharForFolder(ds.Tables[0].Rows[0]["SpecialityClinicOPD"].ToString())+"');", true);
    }

    protected void rptRightSpecialityClinic_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        HiddenField hdnSpecialityClinicOPDId = e.Item.FindControl("hdnSpecialityClinicOPDId") as HiddenField;
        Repeater rptInnerDoctor = e.Item.FindControl("rptInnerDoctor") as Repeater;

        if (hdnSpecialityClinicOPDId.Value != string.Empty)
        {
            DataView dv1 = new DataView(dsopdDoctors.Tables[0]);
            dv1.RowFilter = "SpecialityClinicId=" + hdnSpecialityClinicOPDId.Value;

            rptInnerDoctor.DataSource = dv1;
            rptInnerDoctor.DataBind();
        }
    }
    protected void rptInnerDoctor_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        HiddenField hdnDoctorId = e.Item.FindControl("hdnDoctorId") as HiddenField;
        Repeater rptDoctorSchedule = e.Item.FindControl("rptDoctorSchedule") as Repeater;

        if (hdnDoctorId.Value != string.Empty)
        {
            DataView dv1 = new DataView(dsopdDoctors.Tables[1]);
            dv1.RowFilter = "DoctorId=" + hdnDoctorId.Value;
            rptDoctorSchedule.DataSource = dv1;
            rptDoctorSchedule.DataBind();
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

            if (ds.Tables[0].Rows.Count > 0)
            {
                imgbanner.ImageUrl = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageUrl"].ToString()) ? CommonFn.DefaultInnerpageBanner : ds.Tables[0].Rows[0]["ImageUrl"].ToString();
            }
            else
            {
                imgbanner.ImageUrl = CommonFn.DefaultInnerpageBanner;
            }
            
            if (Convert.ToString(ds.Tables[1].Rows[0]["Content"]) != null || Convert.ToString(ds.Tables[1].Rows[0]["Content"]) != "")
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

        }
    }
}