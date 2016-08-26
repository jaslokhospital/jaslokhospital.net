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

public partial class Portals__default_Skins_JaslokSkin_DoctorOPDSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    DataSet ds = new DataSet();
    DataSet dsopdDoctors = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (Request.RawUrl.ToLower().Contains("doctorwise-opd") || Request.RawUrl.ToLower().Contains("/specialties/doctors-availability"))
        {
            BindPageDetail(178);
            BindDoctorOpd();
        }
    }
    public void BindPageDetail(int id)
    {
        try
        {
            DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;

            objDAEntities.PageTypeId = id;
            ds = (DataSet)objBusinessLogic.GetBannerPageContentDetail(id);

            //if (ds.Tables[0].Rows.Count > 0)
            //{
            //    imgbanner.ImageUrl = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageUrl"].ToString()) ? CommonFn.DefaultInnerpageBanner : ds.Tables[0].Rows[0]["ImageUrl"].ToString();
            //}
            //else
            //{
            //    imgbanner.ImageUrl = CommonFn.DefaultInnerpageBanner;
            //}
            // imgbanner.Visible = (Request.RawUrl == "/corporate-profile") ? true : false;   
            if (ds != null)
            {
                if (Convert.ToString(ds.Tables[1].Rows[0]["Content"]) != null || Convert.ToString(ds.Tables[1].Rows[0]["Content"]) != "")
                {
                    //contentpane.InnerHtml = ds.Tables[1].Rows[0]["Content"].ToString();

                    p.Title = ds.Tables[1].Rows[0]["PageTitle"].ToString();
                    p.KeyWords = ds.Tables[1].Rows[0]["PageKeywords"].ToString();
                    p.Description = ds.Tables[1].Rows[0]["PageDescription"].ToString();
                }
                else
                {
                    // contentpane.Visible = false;
                }
            }

        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    public void BindDoctorOpd()
    {
        try
        {
            ds = (DataSet)objBusinessLogic.GetDoctorWiseOpd();
            rptDoctorNameSOPD.DataSource = ds.Tables[0];
            rptDoctorNameSOPD.DataBind();

            rptDoctorMainOpd.DataSource = ds.Tables[0];
            rptDoctorMainOpd.DataBind();

            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "hidespeciality('" + ds.Tables[0].Rows[0]["DoctorId"].ToString() + "');", true);


        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);

        }
    }
    protected void rptDoctorMainOpd_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater rptInnerDoctor = (Repeater)e.Item.FindControl("rptInnerDoctor");
            HiddenField hdnDoctorOPDId = (HiddenField)e.Item.FindControl("hdnDoctorOPDId");

            if (ds.Tables[1].Rows.Count > 0)
            {
                DataView dv1 = new DataView(ds.Tables[1]);
                dv1.RowFilter = "DoctorId=" + hdnDoctorOPDId.Value;

                rptInnerDoctor.DataSource = dv1;
                rptInnerDoctor.DataBind();
            }
        }
    }
    //protected void rptInnerDoctor_ItemDataBound(object sender, RepeaterItemEventArgs e)
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        HiddenField hdnDoctorId = e.Item.FindControl("hdnDoctorId") as HiddenField;
    //        Repeater rptDoctorSchedule = e.Item.FindControl("rptDoctorSchedule") as Repeater;

    //        if (hdnDoctorId.Value != string.Empty)
    //        {
    //            DataView dv1 = new DataView(ds.Tables[2]);
    //            dv1.RowFilter = "DoctorId=" + hdnDoctorId.Value;

    //            rptDoctorSchedule.DataSource = dv1;
    //            rptDoctorSchedule.DataBind();
    //        }
    //    }
    //}

}