using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_Common_StickyFindDoctor : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            BindSpecialty();
            bindDoctor();
        }
    }
    public void BindSpecialty()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetSpeciality();

            ddlSpecialtySFD.DataSource = ds;
            ddlSpecialtySFD.DataValueField = "SpecialtyId";
            ddlSpecialtySFD.DataTextField = "SpecialtyName";
            ddlSpecialtySFD.DataBind();
            ddlSpecialtySFD.Items.Insert(0, new ListItem("Search by Speciality", "0"));
            //ddlSpecialtyB.Items.Insert(0, new Telerik.Web.UI.RadComboBoxItem("Search by Speciality"));
        }
        catch (Exception ex)
        {

        }        
    }
    protected void ddlSpecialtySFD_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Write("sfsdf");
        DataSet ds = new DataSet();
        ds = null;
        objDAEntities.SpecialtyId = Convert.ToInt32(ddlSpecialtySFD.SelectedValue);
        ds = (DataSet)objBusinessLogic.GetSpecialtyDoctor(objDAEntities);
        ddlDoctorSFD.DataValueField = "DoctorId";
        ddlDoctorSFD.DataTextField = "Name";

        ddlDoctorSFD.DataSource = ds;
        ddlDoctorSFD.DataBind();
        ddlDoctorSFD.Items.Insert(0, new ListItem("Select Doctor", "0"));

    }
    private void bindDoctor()
    {
        DataSet ds = new DataSet();
        ds = null;
        // objDAEntities.CategoryId = Convert.ToInt32(drpspecialCategory.SelectedValue);
        objDAEntities.DoctorId = 0;
        ds = (DataSet)objBusinessLogic.GetDoctorById(objDAEntities);
        ddlDoctorSFD.DataValueField = "DoctorId";
        ddlDoctorSFD.DataTextField = "Name";

        ddlDoctorSFD.DataSource = ds;
        ddlDoctorSFD.DataBind();
        ddlDoctorSFD.Items.Insert(0, new ListItem("Select Doctor", "0"));
    }
    //protected void btnSubmitLPFD_Click(object sender, EventArgs e)
    //{
    //    Response.Write("sfd");
    //}
    protected void btnSubmitLPFD_Click(object sender, EventArgs e)
    {
        int Did=Convert.ToInt32(ddlDoctorSFD.SelectedValue);
        Response.Redirect("FAD.aspx?DI="+Did);
    }
}