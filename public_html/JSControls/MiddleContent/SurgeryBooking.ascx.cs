using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Users;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_SurgeryBooking : PortalModuleBase
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    UserInfo user = UserController.Instance.GetCurrentUserInfo();

    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        bool check = objBusinessLogic.IsExistMrNo(user.Username.Trim());

        if (check == false && user.Username != "host")
        {
            contentpane.Visible = false;
            plcDivError.Visible = true;
        }
        else
        {
            contentpane.Visible = true;
            plcDivError.Visible = false;
            txtdatetime.MinDate = DateTime.Today;
            if (!IsPostBack)
            {
                BindSurgery();
                BindDoctor();
            }
        }
    }
    public void BindSurgery()
    {
        try
        {

            ds = (DataSet)objBusinessLogic.GetFacilitationDetailsSurgery();



            rptOuter.DataSource = ds.Tables[0].AsEnumerable()
                .GroupBy(r => new { Name = r["Name"] })
                .Select(g => g.OrderBy(r => r["Name"]).First()).CopyToDataTable();
            rptOuter.DataBind();

        }
        catch (Exception ex)
        {

        }
    }
    public void BindDoctor()
    {
        try
        {
            drpDoctorName.DataValueField = "DoctorId";
            drpDoctorName.DataTextField = "Name";

            drpDoctorName.DataSource = GetDoctors;
            drpDoctorName.DataBind();
            drpDoctorName.Items.Insert(0, new ListItem("Doctors", "0"));
        }
        catch (Exception ex)
        {

        }
    }

    protected void rptOuter_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //RadioButtonList rbList = (RadioButtonList)e.Item.FindControl("rbList");

            string NAME = ((DataRowView)(e.Item.DataItem))["Name"].ToString();
            DataTable DT;
            DT = ds.Tables[0].AsEnumerable().Where(x => x.Field<string>("NAME") == NAME).AsDataView().ToTable();

            //rbList.DataTextField = "Type";
            //rbList.DataValueField = "Price";

            //rbList.DataSource = DT;
            //rbList.DataBind();

            Repeater rpt = (Repeater)e.Item.FindControl("InnerRepeater");

            for (int i = 0; i < DT.Rows.Count; i++)
            {
                DT.Rows[i]["Type"] = Convert.ToString(ds.Tables[0].Rows[i]["Type"]).Replace("_", " "); 
            }


            rpt.DataSource = DT;
            rpt.DataBind();
        }
    }
    public DataSet GetDoctors
    {
        get
        {
            DataSet ds = new DataSet();
            if (Cache["Doctors"] == null)
            {
                ds = (DataSet)objBusinessLogic.GetDoctorById(objDAEntities);
                Cache.Insert("Doctors", ds);
            }
            else
            {
                ds = Cache["Doctors"] as DataSet;
            }
            return ds;
        }
        set
        {
            Cache["Doctors"] = value;
        }
    }

    public void clear()
    {
        hdnSurgeryFeeSB.Value = null;
        drpDoctorName.ClearSelection();
        txtdatetime.Clear();
    }

    protected void btnSubmitSB_Click(object sender, EventArgs e)
    {
        try
        {

            objDAEntities.FacilityName = "Surgery" + "-" + hdnFacilityNameSB.Value;
            if (Convert.ToInt16(drpDoctorName.SelectedValue) != 0)
            {
                objDAEntities.DoctorId = Convert.ToInt32(drpDoctorName.SelectedValue);
            }
            objDAEntities.BookinDateTime = Convert.ToDateTime(txtdatetime.SelectedDate);
            objDAEntities.Category = hdnCategorySB.Value;
            objDAEntities.AdmissionCharge = hdnSurgeryFeeSB.Value;
            objDAEntities.MRNumber = user.Username;

            objDAEntities.AdmissionCharge = Convert.ToString(9);
            Session["Amount"] = objDAEntities.AdmissionCharge;

            Session["Surgery"] = objDAEntities;

            clear();


            if (CommonFn.UserID <= 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){showPopupWindow();});", true);

            }
            else
            {
                Response.Redirect("/Payment.aspx");
                //string pageurl = "/Payment.aspx";
               // Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
            }

        }
        catch (Exception ex)
        {

        }
    }
}