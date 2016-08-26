
using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_Home_FindDoctor : System.Web.UI.UserControl
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSpecialty();
           //bindDoctor();
        }
        //else
        //{
        //    if(ddlSpecialty.SelectedIndex==0)
        //    {
        //        GetSpecialtyDoctor(Convert.ToInt32(ddlSpecialty.SelectedValue));
        //    }
        //}
    }
    public void BindSpecialty()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetSpeciality();


            ddlSpecialty.DataValueField = "SpecialtyId";
            ddlSpecialty.DataTextField = "SpecialtyName";

            ddlSpecialty.DataSource = ds;
            ddlSpecialty.DataBind();
            ddlSpecialty.Items.Insert(0, new ListItem("Search by Speciality", "0"));
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    private void bindDoctor()
    {
        DataSet ds = new DataSet();
        ds = null;
        objDAEntities.DoctorId = 0;
        ds = (DataSet)objBusinessLogic.GetDoctorById(objDAEntities);
        drpDoctorName.DataValueField = "DoctorId";
        drpDoctorName.DataTextField = "Name";

        drpDoctorName.DataSource = ds;
        drpDoctorName.DataBind();
        drpDoctorName.Items.Insert(0, new ListItem("Search by Doctor", "0"));
    }
    protected void lnkbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/FAD.aspx?DoctorId=" + drpDoctorName.SelectedValue, true);
    }
   
    private void GetSpecialtyDoctor(int id)
    {
        
    }
    protected void ddlSpecialty_SelectedIndexChanged(object sender, EventArgs e)
    {
        objDAEntities.SpecialtyId = Convert.ToInt32(ddlSpecialty.SelectedValue);
        DataSet ds = new DataSet();
        ds = (DataSet)objBusinessLogic.GetSpecialtyDoctor(objDAEntities);
        drpDoctorName.DataValueField = "DoctorId";
        drpDoctorName.DataTextField = "Name";

        drpDoctorName.DataSource = ds;
        drpDoctorName.DataBind();
        drpDoctorName.Items.Insert(0, new ListItem("Search by Doctor", "0"));
    }
    protected void drpDoctorName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlSpecialty_SelectedIndexChanged1(object sender, EventArgs e)
    {
        objDAEntities.SpecialtyId = Convert.ToInt32(ddlSpecialty.SelectedValue);
        DataSet ds = new DataSet();
        ds = (DataSet)objBusinessLogic.GetSpecialtyDoctor(objDAEntities);
        drpDoctorName.DataValueField = "DoctorId";
        drpDoctorName.DataTextField = "Name";

        drpDoctorName.DataSource = ds;
        drpDoctorName.DataBind();
        drpDoctorName.Items.Insert(0, new ListItem("Search by Doctor", "0"));
    }
}