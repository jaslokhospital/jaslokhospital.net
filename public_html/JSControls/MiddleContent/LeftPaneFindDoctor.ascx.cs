using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_LeftPaneFindDoctor : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    DataSet dtSpecialityDoctor = new DataSet();
    DataSet dtSpeciality = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        dtSpecialityDoctor = (DataSet)Cache[AppGlobal.SpecialityDoctorCache];
        objDAEntities.SpecialtyId = -1;
        if (dtSpecialityDoctor == null)
        {
            dtSpecialityDoctor = objBusinessLogic.GetSpecialtyDoctor(objDAEntities);
            Cache.Insert(AppGlobal.SpecialityDoctorCache, dtSpecialityDoctor);
        }

        dtSpeciality = (DataSet)Cache[AppGlobal.SpecialityCache];
        if (dtSpeciality == null)
        {
            dtSpeciality = (DataSet)objBusinessLogic.GetSpeciality();
            Cache.Insert(AppGlobal.SpecialityCache, dtSpeciality);
        }
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

            ddlSpecialtyLPD.DataSource = dtSpeciality;
            ddlSpecialtyLPD.DataValueField = "SpecialtyId";
            ddlSpecialtyLPD.DataTextField = "SpecialtyName";
            ddlSpecialtyLPD.DataBind();
            ddlSpecialtyLPD.Items.Insert(0, new ListItem("Search by Speciality", "0"));
            //ddlSpecialtyB.Items.Insert(0, new Telerik.Web.UI.RadComboBoxItem("Search by Speciality"));
        }
        catch (Exception ex)
        {

        }        
    }
    protected void ddlSpecialtyLPD_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        DataView dtView = new DataView(dtSpecialityDoctor.Tables[0]);
        dtView.RowFilter = "SpecialityId=" + ddlSpecialtyLPD.SelectedValue;
        ddlDoctorLPD.DataValueField = "DoctorId";
        ddlDoctorLPD.DataTextField = "Name";

        ddlDoctorLPD.DataSource = dtView;
        ddlDoctorLPD.DataBind();
        ddlDoctorLPD.Items.Insert(0, new ListItem("Select by Doctor", "0"));

    }
    private void bindDoctor()
    {
        string[] TobeDistinct = {"DoctorId","Name"};

        DataTable dt = new DataTable();
        dt = dtSpecialityDoctor.Tables[0].DefaultView.ToTable(true, TobeDistinct);
        // objDAEntities.CategoryId = Convert.ToInt32(drpspecialCategory.SelectedValue);
        //objDAEntities.DoctorId = 0;
        //ds = (DataSet)objBusinessLogic.GetDoctorById(objDAEntities);
        ddlDoctorLPD.DataValueField = "DoctorId";
        ddlDoctorLPD.DataTextField = "Name";

        ddlDoctorLPD.DataSource = dt;
        ddlDoctorLPD.DataBind();
        ddlDoctorLPD.Items.Insert(0, new ListItem("Select by Doctor", "0"));
    }
    //protected void btnSubmitLPFD_Click(object sender, EventArgs e)
    //{
    //    Response.Write("sfd");
    //}
    protected void btnSubmitLPFD1_Click(object sender, EventArgs e)
    {
        int Did=Convert.ToInt32(ddlDoctorLPD.SelectedValue);
        if (ddlSpecialtyLPD.SelectedValue != "0")
        {
            Session["SpecialityId"] = ddlSpecialtyLPD.SelectedValue;
        }
        string DoctorName = Convert.ToString(ddlDoctorLPD.SelectedItem.Text);
        Response.Redirect("/find-doctor/" + CommonFn.RemoveSpecialCharacters(DoctorName) + "/" + Did);
    }
}