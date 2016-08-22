using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_LeftPaneBookAppointment : PortalModuleBase
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //txtdatetime.MinDate = DateTime.Now;
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
            ds = (DataSet)objBusinessLogic.GetSpeciality(true);

            ddlSpecialtyLPB.DataSource = ds;
            ddlSpecialtyLPB.DataValueField = "SpecialtyId";
            ddlSpecialtyLPB.DataTextField = "SpecialtyName";
            ddlSpecialtyLPB.DataBind();
            ddlSpecialtyLPB.Items.Insert(0, new ListItem("Search by Speciality", "0"));
            //ddlSpecialtyB.Items.Insert(0, new Telerik.Web.UI.RadComboBoxItem("Search by Speciality"));
        }
        catch (Exception ex)
        {

        }
    }
    private void bindDoctor()
    {
        DataSet ds = new DataSet();
        ds = null;
        // objDAEntities.CategoryId = Convert.ToInt32(drpspecialCategory.SelectedValue);
        objDAEntities.DoctorId = 0;
        ds = (DataSet)objBusinessLogic.GetDoctorById(objDAEntities);
        ddlDoctorLPBA.DataValueField = "DoctorId";
        ddlDoctorLPBA.DataTextField = "Name";

        ddlDoctorLPBA.DataSource = ds;
        ddlDoctorLPBA.DataBind();
        ddlDoctorLPBA.Items.Insert(0, new ListItem("Search by Doctor", "0"));
    }
    protected void ddlSpecialtyLPB_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ds = null;

        objDAEntities.SpecialtyId = Convert.ToInt32(ddlSpecialtyLPB.SelectedValue);
        ds = (DataSet)objBusinessLogic.GetSpecialtyDoctor(objDAEntities);
        ddlDoctorLPBA.DataValueField = "DoctorId";
        ddlDoctorLPBA.DataTextField = "Name";

        ddlDoctorLPBA.DataSource = ds;
        ddlDoctorLPBA.DataBind();
        ddlDoctorLPBA.Items.Insert(0, new ListItem("Search by Doctor", "0"));
    }
    protected void tbnLPBAppointment_Click(object sender, EventArgs e)
    {
        int DID = Convert.ToInt32(ddlDoctorLPBA.SelectedValue);
        string doctor = Convert.ToString(ddlDoctorLPBA.SelectedItem.Text);


        if (ddlSpecialtyLPB.SelectedValue != "0")
        {
            Session["SpecialityId"] = ddlSpecialtyLPB.SelectedValue;
        }

        if (ddlDay.SelectedValue != "0")
        {
            Session["AppointmentDay"] = ddlDay.SelectedValue;
        }

        Response.Redirect("/fix-appointment/" + CommonFn.RemoveSpecialCharacters(doctor) + "/" + DID);

        ////if (txtdatetime.SelectedDate != null)
        ////{
        ////    SD = Convert.ToDateTime(txtdatetime.SelectedDate).ToString("yyyyMMddHHmmss");
        ////    Response.Redirect("/fix-an-appointment.aspx?DI=" + DID + "&SD=" + SD);
        ////}
        ////else
        ////{
        //    Response.Redirect("/fix-appointment/" + CommonFn.RemoveSpecialCharacters(doctor) + "/" + DID);
        ////}



    }

    protected void ddlDoctorLPBA_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetscheduleDays();
    }
    public void GetscheduleDays()
    {
        if (Convert.ToInt32(ddlDoctorLPBA.SelectedValue) > 0)
        {
            DataSet ds = new DataSet();
            objDAEntities.DoctorId = Convert.ToInt32(ddlDoctorLPBA.SelectedValue);
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

            if (Convert.ToInt32(ddlSpecialtyLPB.SelectedValue) > 0)
            {
                list = list.Where(Q => Q.SpecialtyId == Convert.ToInt32(ddlSpecialtyLPB.SelectedValue)).ToList();
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