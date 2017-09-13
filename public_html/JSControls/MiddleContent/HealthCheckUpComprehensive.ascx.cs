﻿using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Users;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_HealthCheckUpComprehensive : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    UserInfo user = UserController.Instance.GetCurrentUserInfo();
    bool check = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(user.Username))
            check = objBusinessLogic.IsExistMrNo(user.Username.Trim());
        if (check == false && user.Username != "host")
        {
            ContentPane.Visible = false;
            plcDivError.Visible = true;
        }
        else
        {
            ContentPane.Visible = true;
            plcDivError.Visible = false;
            txtdatetime.MinDate = DateTime.Today;
            if (!IsPostBack)
            {
                bindDoctor();
            }
        }
    }
    public void Pre_Init(object sender, EventArgs e)
    {
        if (Cache["Doctors"] != null)
        {
            DataSet ds = GetDoctors;
            ddlDoctorbedbook.DataValueField = "DoctorId";
            ddlDoctorbedbook.DataTextField = "Name";

            ddlDoctorbedbook.DataSource = ds;
            ddlDoctorbedbook.DataBind();
            ddlDoctorbedbook.Items.Insert(0, new ListItem("-Select-", "0"));
        }

    }
    private void bindDoctor()
    {
        ddlDoctorbedbook.DataValueField = "DoctorId";
        ddlDoctorbedbook.DataTextField = "Name";

        ddlDoctorbedbook.DataSource = GetDoctors;
        ddlDoctorbedbook.DataBind();
        ddlDoctorbedbook.Items.Insert(0, new ListItem("-Select-", "0"));
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
    public void Clear()
    {
        ddlDoctorbedbook.ClearSelection();
        // RadioButtonList1.SelectedIndex = -1;
        txtAdmissionCharge.Text = "";
        txtdatetime.Clear();
       
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objDAEntities.FacilityName = "Health";
        objDAEntities.DoctorId = Convert.ToInt32(ddlDoctorbedbook.SelectedValue);
        objDAEntities.BookinDateTime = Convert.ToDateTime(txtdatetime.SelectedDate);

        objDAEntities.AdmissionCharge = Request.Form[txtAdmissionCharge.UniqueID];

        objDAEntities.Category = hdnDeposit.Value.Split(',')[1];

        objDAEntities.MRNumber = user.Username;
        //objDAEntities.AdmissionCharge = Convert.ToString(10);
        //Session["Amount"] = Convert.ToString(10);
        //Session["Amount"] = objDAEntities.AdmissionCharge;
        //Session["HealthCheck-upComprehensive"] = objDAEntities;

        objDAEntities.Amount = Convert.ToInt32(objDAEntities.AdmissionCharge);
        string _categoryName = objDAEntities.Category;
        if (_categoryName == "Male" || _categoryName == "Female")
        {
            _categoryName = "Package B (" + objDAEntities.Category + ")";
        }
        objDAEntities.Category = _categoryName;
        objDAEntities.Guid = System.Guid.NewGuid().ToString();
        objDAEntities.UserId = user.UserID;
        Session["Guid"] = "Hea-" + objDAEntities.Guid;
        objBusinessLogic.SaveInfoGuid(objDAEntities);


        //Response.Redirect(@"/Payment.aspx");
        if (CommonFn.UserID <= 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ResetRadio", "setRadioButtonBEDB('" + hdnDeposit.Value + "', '" + txtAdmissionCharge.Text + "');", true);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){loadUserPopup();});", true);

        }
        else
        {
            string amount = HttpUtility.UrlEncode(objBusinessLogic.Encrypt(objDAEntities.Amount.ToString()));
            Response.Redirect("/Payment.aspx?amount=" + amount);
            //Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
        }
    }
}