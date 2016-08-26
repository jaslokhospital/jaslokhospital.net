using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_Home_BookAppointment : PortalModuleBase
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
            dtSpeciality = (DataSet)objBusinessLogic.GetSpeciality(true);
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
           
            ddlSpecialtyB.DataSource = dtSpeciality;
            ddlSpecialtyB.DataValueField = "SpecialtyId";
            ddlSpecialtyB.DataTextField = "SpecialtyName";
            ddlSpecialtyB.DataBind();
            ddlSpecialtyB.Items.Insert(0, new ListItem("Search by Speciality", "0"));
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    private void bindDoctor()
    {
        string[] TobeDistinct = { "DoctorId", "Name" };

        DataTable dt = new DataTable();
        dt = dtSpecialityDoctor.Tables[0].DefaultView.ToTable(true, TobeDistinct);
        ddlDoctor.DataValueField = "DoctorId";
        ddlDoctor.DataTextField = "Name";

        ddlDoctor.DataSource = dt;
        ddlDoctor.DataBind();
        ddlDoctor.Items.Insert(0, new ListItem("Select Doctor", "0"));
    }
    protected void ddlSpecialtyB_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataView dtView = new DataView(dtSpecialityDoctor.Tables[0]);
        dtView.RowFilter = "SpecialityId=" + ddlSpecialtyB.SelectedValue;
        ddlDoctor.DataValueField = "DoctorId";
        ddlDoctor.DataTextField = "Name";

        ddlDoctor.DataSource = dtView;
        ddlDoctor.DataBind();
        ddlDoctor.Items.Insert(0, new ListItem("Search by Doctor", "0"));
    }

    protected void tbnHBAppointment_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Validated');", true);
        //int SID = Convert.ToInt32(ddlSpecialtyB.SelectedValue);
        int di = Convert.ToInt32(ddlDoctor.SelectedValue);
        string doctor = Convert.ToString(ddlDoctor.SelectedItem.Text);
        /*string SD;
        if (!string.IsNullOrEmpty(txtdatetime.Text))
        {
            SD = Convert.ToDateTime(txtdatetime.Text).ToString("yyyyMMddHHmmss");
            Response.Redirect("fix-an-appointment.aspx?DI=" + DID);
        }
        else
        {*/
        if (ddlSpecialtyB.SelectedValue != "0")
        {
            Session["SpecialityId"] = ddlSpecialtyB.SelectedValue;
        }

        if (ddlDay.SelectedValue != "0")
        {
            Session["AppointmentDay"] = ddlDay.SelectedValue;
        }
        Response.Redirect("fix-appointment/" + CommonFn.RemoveSpecialCharacters(doctor) + "/" + di);
        //}       
    }

    protected void ddlDoctor_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetscheduleDays();
    }

    public void GetscheduleDays()
    {
        if (Convert.ToInt32(ddlDoctor.SelectedValue) > 0)
        {
            DataSet ds = new DataSet();
            objDAEntities.DoctorId = Convert.ToInt32(ddlDoctor.SelectedValue);
            ds = (DataSet)objBusinessLogic.GetDoctorDetailsForPage(objDAEntities);

            DataTable dt = new DataTable();
            dt = ds.Tables[1];
            List<DoctorSchedule> list = new List<DoctorSchedule>();
            list = (from DataRow row in dt.Rows
                    select new DoctorSchedule()
                    {
                        Day = row["Day"].ToString(),
                        Time = row["Time"].ToString(),
                        TimeSlot = Convert.ToInt32(row["TimeSlot"]),
                        SpecialtyId = Convert.ToInt32(row["SpecialtyId"])
                    }).ToList();

            if (Convert.ToInt32(ddlSpecialtyB.SelectedValue) > 0)
            {
                list = list.Where(Q => Q.SpecialtyId == Convert.ToInt32(ddlSpecialtyB.SelectedValue)).ToList();
            }
            ddlDay.Items.Clear();
            if (list.Count > 0)
            {
                string fsDays = string.Empty;
                List<string> lstWeekdays = "Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday".Split(',').ToList();
                //Response.Write(list.Count);
                foreach (DoctorSchedule objDoctorSchdule in list)
                {
                    fsDays = fsDays + objDoctorSchdule.Day + ",";
                }
                List<string> lstScheduleDays = fsDays.Replace(" ", string.Empty).Trim(',').Split(',').Distinct().ToList();
                lstWeekdays = lstWeekdays.Intersect(lstScheduleDays.Select(x => { x = x.FullDayNames(); return x; })).ToList();
                ddlDay.DataSource = lstWeekdays;
                ddlDay.DataBind();

                
            }
            ddlDay.Items.Insert(0, new ListItem("Select Day", "0"));
        }
    }
}