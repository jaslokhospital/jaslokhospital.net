using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ManageDoctorSchedule : PortalModuleBase
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            drpDoctorName.ClearSelection();
          bindDoctor();
            //BindPage();
            ViewState["DSId"] = 0;
            ViewState["Action"] = "INSERT";
        }
        dgscgrid.Visible = true;

    }

    private void BindPage()
     {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetDoctorScheduleDetails();

            dgscgrid.DataSource = ds;
            dgscgrid.DataBind();
        }
        catch (Exception ex)
        {

        }
    }

    public void bindSchedulegrid()
    {
        DataSet ds = new DataSet();
        ds = null;
        objDAEntities.DoctorId = Convert.ToInt32(drpDoctorName.SelectedValue);
        bindDoctorSpeciality();
        ds = (DataSet)objBusinessLogic.GetDoctorSchedule(objDAEntities);

        dgscgrid.DataSource = ds;
        dgscgrid.DataBind();
        objDAEntities.DoctorId = 0;
    }
    protected void drpDoctorNM_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ds = null;
        hdnDoctorScheduleId.Value = string.Empty;
        lblMessage.Visible = false;
        Clear();
        bindDoctorSpeciality();
    }

    public void bindDoctorSpeciality()
    {
        DataTable dt = new DataTable();
        dt = objBusinessLogic.GetDoctorSpecialities(Convert.ToInt32(drpDoctorName.SelectedValue));

        drpSpeciality.DataValueField = "SpecialtyId";
        drpSpeciality.DataTextField = "SpecialityWithCategory";

        drpSpeciality.DataSource = dt;
        drpSpeciality.DataBind();
        drpSpeciality.Items.Insert(0, new ListItem("-Select-", "0"));
    }

    private void bindDoctor()
    {
        DataSet ds = new DataSet();
        ds = null;
      
        objDAEntities.DoctorId = Convert.ToInt32(drpDoctorName.SelectedValue);
        ds = (DataSet)objBusinessLogic.GetDoctorById(objDAEntities);
        drpDoctorName.DataValueField = "DoctorId";
        drpDoctorName.DataTextField = "Name";

        drpDoctorName.DataSource = ds;
        drpDoctorName.DataBind();
        drpDoctorName.Items.Insert(0, new ListItem("-Select-", "0"));
    }

    public void bindScheduleDetail()
    {
        DataTable dt = new DataTable();
        dt = objBusinessLogic.GetScheduleDetail(Convert.ToInt32(hdnDoctorScheduleId.Value));
        if (dt != null)
        {
            txtRoom.Text = Convert.ToString(dt.Rows[0]["Room"]);
            if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["day"])))
            {
                List<string> appointMentDays = Convert.ToString(dt.Rows[0]["day"]).Split(',').ToList();
                foreach (string day in appointMentDays)
                {
                    chklstDay.Items.FindByValue(day.Trim()).Selected = true;
                }
            }

            rbtSlots.SelectedValue = Convert.ToString(dt.Rows[0]["TimeSlot"]);
            if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["SpecialtyId"])))
            {
                drpSpeciality.SelectedValue = Convert.ToString(dt.Rows[0]["SpecialtyId"]);
            }
            else
            {
                drpSpeciality.SelectedValue = "0";
            }
            drpFromTime.ClearSelection();
            drpToTime.ClearSelection();
            drpFromTime.Items.FindByText(Convert.ToString(dt.Rows[0]["Time"]).Split('-')[0].Trim()).Selected = true;
            drpToTime.Items.FindByText(Convert.ToString(dt.Rows[0]["Time"]).Split('-')[1].Trim()).Selected = true;
            //drpToTime.SelectedItem.Text = Convert.ToString(dt.Rows[0]["Time"]).Split('-')[1].Trim();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string checkItem = string.Empty;
            IEnumerable<string> CheckedItems = chklstDay.Items.Cast<ListItem>()
                                   .Where(i => i.Selected)
                                   .Select(i => i.Value);
            foreach (string i in CheckedItems)
            {
                checkItem += i + ", ";
            }

            checkItem = checkItem.Trim();
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.DoctorId = Convert.ToInt32(drpDoctorName.SelectedValue);
            objDAEntities.Day = checkItem.Trim(',');
            objDAEntities.Time = drpFromTime.SelectedItem.Text + " - " + drpToTime.SelectedItem.Text;
            objDAEntities.Room = txtRoom.Text;
            //objDAEntities.Action = ViewState["Action"].ToString();
            objDAEntities.SpecialtyId = Convert.ToInt32(drpSpeciality.SelectedValue);
            objDAEntities.TimeSlot = Convert.ToInt32(rbtSlots.SelectedValue);
            lblMessage.Visible = true;
            if (!string.IsNullOrEmpty(hdnDoctorScheduleId.Value))
            { objDAEntities.UpdatedByUserID = CommonFn.UserID;
                objDAEntities.Action = "UPDATE";
                objDAEntities.DSId = Convert.ToInt32(hdnDoctorScheduleId.Value);
                ds = (DataSet)objBusinessLogic.DSInsertUpdateDelete(objDAEntities);
                Clear();
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Doctor schedule updated successfully!!!";
            }
            else
            {
                objDAEntities.CreatedByUserID = CommonFn.UserID;
                objDAEntities.Action = "INSERT";
                ds = (DataSet)objBusinessLogic.DSInsertUpdateDelete(objDAEntities);
                Clear();
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Doctor schedule added successfully!!!";
                
            }
           
            // BindPage();

        }
        catch (Exception ex)
        {

        }
    }

    public void UpdateClear()
    {
        hdnDoctorScheduleId.Value = string.Empty;
        chklstDay.ClearSelection();
        rbtSlots.ClearSelection();
        bindSchedulegrid();
    }

    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        int doctorScheduleId = Convert.ToInt32(dgscgrid.DataKeys[e.NewEditIndex].Values[0]);
        //dgscgrid.EditIndex = e.NewEditIndex;
        lblMessage.Visible = false;
        bindSchedulegrid();
    }

    public void Clear()
    {
        txtRoom.Text = "";
        bindSchedulegrid();
        hdnDoctorScheduleId.Value = string.Empty;
        drpToTime.ClearSelection();
        drpFromTime.ClearSelection();
        chklstDay.ClearSelection();
        rbtSlots.ClearSelection();
    
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
        bindDoctor();
        bindDoctorSpeciality();
        lblMessage.Visible = false;
        dgscgrid.Visible = false;
        //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Images size is more than 1.035 mb!!!');", true);
    }

    protected void dgscgrid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower() == "editsch")
        {
            Clear();
            lblMessage.Visible = false;
            hdnDoctorScheduleId.Value = Convert.ToString(e.CommandArgument);
            bindScheduleDetail();
        }
        else if (e.CommandName.ToLower() == "deletesch")
        {
            DataSet ds = new DataSet();
            ds = null;
            int DSId = Convert.ToInt32(e.CommandArgument);
            objDAEntities.DSId = DSId;
            ViewState["Action"] = "DELETE";
            if (ViewState["Action"].ToString() == "DELETE")
            {
                objDAEntities.Action = "DELETE";
                ds = (DataSet)objBusinessLogic.DSInsertUpdateDelete(objDAEntities);
                Clear();
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Doctor schedule deleted successfully!!!";
            }
           
        }
    }
}

