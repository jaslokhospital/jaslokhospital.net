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

public partial class Portals__default_Skins_JaslokSkin_SpecialityOPDSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    DataSet dsSpecialtyOPD_dDoctorsCache = new DataSet();
    DataSet dsBindPageDetail = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (Request.RawUrl.Contains("specialitywise-opd"))
        {
            BindPageDetail(176);
            BindSpecialityWiseOpd();
           
        }
    }
    public void BindPageDetail(int id)
    {
        try
        {
            DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;

            objDAEntities.PageTypeId = id;
            //dsBindPageDetail = (DataSet)objBusinessLogic.GetBannerPageContentDetail(objDAEntities);

            dsBindPageDetail = (DataSet)Cache[AppGlobal.SpecialityOPD_detailCache];

            if (dsBindPageDetail == null)
            {
                dsBindPageDetail=(DataSet)objBusinessLogic.GetBannerPageContentDetail(id);
                 Cache.Insert(AppGlobal.SpecialityOPD_detailCache, dsBindPageDetail);
                
            }




            if (Convert.ToString(dsBindPageDetail.Tables[1].Rows[0]["Content"]) != null || Convert.ToString(dsBindPageDetail.Tables[1].Rows[0]["Content"]) != "")
            {
                p.Title = dsBindPageDetail.Tables[1].Rows[0]["PageTitle"].ToString();
                p.KeyWords = dsBindPageDetail.Tables[1].Rows[0]["PageKeywords"].ToString();
                p.Description = dsBindPageDetail.Tables[1].Rows[0]["PageDescription"].ToString();
            }
            else
            {
                // contentpane.Visible = false;
            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    public void BindSpecialityWiseOpd()
    {
        try
        {
            
            dsSpecialtyOPD_dDoctorsCache = (DataSet)Cache[AppGlobal.SpecialtyOPD_dDoctorsCache];

            if (dsSpecialtyOPD_dDoctorsCache == null)
            {
                dsSpecialtyOPD_dDoctorsCache = (DataSet)objBusinessLogic.GetSpecialityWiseOpd();
                Cache.Insert(AppGlobal.SpecialtyOPD_dDoctorsCache, dsSpecialtyOPD_dDoctorsCache);
            }






            rptSpecialtyNameSOPD.DataSource = dsSpecialtyOPD_dDoctorsCache.Tables[0];
            rptSpecialtyNameSOPD.DataBind();

            rptSpecialOpdDoctorMain.DataSource = dsSpecialtyOPD_dDoctorsCache.Tables[0];
            rptSpecialOpdDoctorMain.DataBind();

            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "hidespeciality('" + dsSpecialtyOPD_dDoctorsCache.Tables[0].Rows[0]["SpecialtyId"].ToString() + "');", true);
            
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
 
    protected void rptSpecialOpdDoctorMain_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rptInnerDoctor = (Repeater)e.Item.FindControl("rptInnerDoctor");
            HiddenField hdnSpecialityOPDId = (HiddenField)e.Item.FindControl("hdnSpecialityOPDId");

            if (dsSpecialtyOPD_dDoctorsCache.Tables[1].Rows.Count > 0)
            {
                DataView dv1 = new DataView(dsSpecialtyOPD_dDoctorsCache.Tables[1]);
                dv1.RowFilter = "SpecialtyId=" + hdnSpecialityOPDId.Value;

                rptInnerDoctor.DataSource = dv1;
                rptInnerDoctor.DataBind();
            }
        }
    }
    protected void rptInnerDoctor_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HiddenField hdnDoctorId = e.Item.FindControl("hdnDoctorId") as HiddenField;
            Repeater rptDoctorSchedule = e.Item.FindControl("rptDoctorSchedule") as Repeater;

            if (hdnDoctorId.Value != string.Empty)
            {
                DataView dv1 = new DataView(dsSpecialtyOPD_dDoctorsCache.Tables[2]);
                dv1.RowFilter = "DoctorId=" + hdnDoctorId.Value;
                rptDoctorSchedule.DataSource = dv1;
                rptDoctorSchedule.DataBind();
            }
        }
    }

    protected void lkbAppointment_Click(object sender, EventArgs e)
    {

    }
    protected void rptSpecialOpdDoctorMain_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "AppointMentRedirect")
        {
            HiddenField hdnSpecialityOPDInnerId = e.Item.FindControl("hdnSpecialityOPDInnerId") as HiddenField;
            Session["SpecialityId"] = hdnSpecialityOPDInnerId.Value;
            Response.Redirect(e.CommandArgument.ToString());
        }
    }
}