using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Portals__default_Skins_JaslokSkin_HomePageSkin : DotNetNuke.UI.Skins.Skin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        //string currentUrl = Request.RawUrl;

        //if (!currentUrl.Contains("home")) 
        //{
        //    //FooterSection.Visible = false;
        //}


        //if (!Page.IsPostBack)
        //{
        //    BindSpecialty();
        //}

    }

    //public void BindSpecialty()
    //{
    //    try
    //    {
    //        DataSet ds = new DataSet();
    //        ds = null;
    //        ds = (DataSet)objBusinessLogic.GetSpeciality();

    //        rcmbSpecialty.DataSource = ds;
    //        rcmbSpecialty.DataValueField = "SpecialtyId";
    //        rcmbSpecialty.DataTextField = "SpecialtyName";
    //        rcmbSpecialty.DataBind();
    //        //ddlSpecialtyB.Items.Insert(0, new ListItem("Search by Speciality", "0"));
    //        //rcmbSpecialty.Items.Insert(0, new Telerik.Web.UI.RadComboBoxItem("Search by Speciality"));
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}

    //protected void rcmbSpecialty_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    //{
    //    Response.Write("selected index changed worked");
    //}

}