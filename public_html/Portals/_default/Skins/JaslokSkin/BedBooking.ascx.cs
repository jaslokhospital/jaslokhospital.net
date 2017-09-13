using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using DotNetNuke;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Globalization;
using System.IO;
using DotNetNuke.Entities.Users;
using System.Security.Cryptography;

public partial class Portals__default_Skins_JaslokSkin_BedBooking : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    UserInfo user = UserController.Instance.GetCurrentUserInfo();
    public static DataSet ds = new DataSet();
    bool check = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (!String.IsNullOrEmpty(user.Username))
            check = objBusinessLogic.IsExistMrNo(user.Username.Trim());

        if (check == false && user.Username != "host")
        {
            divContent.Visible = false;
            plcDivError.Visible = true;
            
        }
        else
        {
            divContent.Visible = true;
            plcDivError.Visible = false;

            txtdatetime.MinDate = DateTime.Today;
            if (!IsPostBack)
            {
                bindDoctor();
            }
            bindList();
        }
    }
    public void bindList()
    {

        ds = (DataSet)objBusinessLogic.GetBedDetails();

        ds.Tables[0].Columns.Add("Images", typeof(String));

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["Room"] = Convert.ToString(ds.Tables[0].Rows[i]["Room"]).Replace("_", " ");
            ds.Tables[0].Rows[i]["Images"] = Convert.ToString(ds.Tables[0].Rows[i]["Room"]).Replace(" ", "_") + ".jpg";
        }

        rptBedReservation.DataSource = ds;
        rptBedReservation.DataBind();
    }
    protected void rptBedReservation_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {



        if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType
           != ListItemType.AlternatingItem)
            return;

        //RadioButton rdo = (RadioButton)e.Item.FindControl("rdbPrice");
        //string script =
        //   "SetUniqueRadioButton('rptBedReservation.*rdb',this)";
        //rdo.Attributes.Add("onclick", script);


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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            objDAEntities.FacilityName = "Bed Reservation";
            objDAEntities.DoctorId = Convert.ToInt32(ddlDoctorbedbook.SelectedValue);
            objDAEntities.BookinDateTime = Convert.ToDateTime(txtdatetime.SelectedDate);

            objDAEntities.AdmissionCharge = txtAdmissionCharge.Text;

            objDAEntities.Category = hdnDepositBB.Value.Split(',')[1];
            objDAEntities.MRNumber = user.Username;
            objDAEntities.Amount = Convert.ToInt32(txtAdmissionCharge.Text);
            //Session["Amount"] = objDAEntities.AdmissionCharge;
            //Session["Bed"] = objDAEntities;

            objDAEntities.Guid = System.Guid.NewGuid().ToString();
            objDAEntities.UserId = user.UserID;
            Session["Guid"] = "Bed-" + objDAEntities.Guid;
            objBusinessLogic.SaveInfoGuid(objDAEntities);

            if (CommonFn.UserID <= 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ResetRadio", "setRadioButtonBEDB('" + hdnDepositBB.Value + "', '" + txtAdmissionCharge.Text + "');", true);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){loadUserPopup();});", true);
            }
            else
            {
                string amount = HttpUtility.UrlEncode(objBusinessLogic.Encrypt(objDAEntities.Amount.ToString()));
                Response.Redirect("/Payment.aspx?amount=" + amount);
                //Response.Redirect("/PaymentResponse.aspx");
            }
            // Clear();
        }

        catch (Exception ex)
        {

        }
    }

    public void Clear()
    {
        ddlDoctorbedbook.ClearSelection();
        // RadioButtonList1.SelectedIndex = -1;
        txtAdmissionCharge.Text = "";
        txtdatetime.Clear();
        bindList();

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
}