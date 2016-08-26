﻿using BusinessDataLayer;
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

public partial class Portals__default_Skins_JaslokSkin_FixAnAppointmentSkin : DotNetNuke.UI.Skins.Skin
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    public static DataSet dsDoctorDetail;

    protected void Page_Load(object sender, EventArgs e)
    {
        txtdob.MaxDate = DateTime.Now;
        txtdob.MinDate = Convert.ToDateTime("01/01/1900");
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
        if (Request.RawUrl.Contains("fix-an-appointment"))
        {
            BindPageBanner(120);
        }
        if (Request.QueryString["DI"] != null && Convert.ToInt32(Request.QueryString["DI"]) > 0)
        {
            objDAEntities.DoctorId = Convert.ToInt32(Request.QueryString["DI"]);
            
            //FillCapctha();
            if (!IsPostBack)
            {
                BindDetails();
                //bindDoctorSpeciality(objDAEntities.DoctorId);
                int SessionSpecialityId = 0;
                int.TryParse(Convert.ToString(Session["SpecialityId"]), out SessionSpecialityId);
                if (SessionSpecialityId > 0)
                {
                    drpSpecialty.SelectedValue = SessionSpecialityId.ToString();
                    Session["SpecialityId"] = null;
                }
                GetscheduleDays();

                if (Session["AppointmentDay"] != null)
                {
                    ddlAppointmentDay.SelectedValue = Convert.ToString(Session["AppointmentDay"]);
                    Session["AppointmentDay"] = null;
                    GetDates();
                }
            }
            divEmpty.Visible = false;
            divDoctorInfo.Visible = true;
        }
        else
        {
            divEmpty.Visible = true;
            divDoctorInfo.Visible = false;
        }
    }
    public void BindPageBanner(int id)
    {
        try
        {
            DotNetNuke.Framework.CDefault p = (DotNetNuke.Framework.CDefault)this.Page;

            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.PageTypeId = id;
            ds = (DataSet)objBusinessLogic.GetBannerPageContentDetail(id);
            if (ds.Tables[1].Rows.Count > 0)
            {
				if (ds.Tables[1].Rows[0]["Content"].ToString() != String.Empty)
					divScopeContent.InnerHtml = ds.Tables[1].Rows[0]["Content"].ToString();
				else
					divScopeContent.Style.Add("display", "none");

                p.Title = ds.Tables[1].Rows[0]["PageTitle"].ToString();
                p.KeyWords = ds.Tables[1].Rows[0]["PageKeywords"].ToString();
                p.Description = ds.Tables[1].Rows[0]["PageDescription"].ToString();
            }
			else
			{
				divScopeContent.Style.Add("display", "none");
			}
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    public void BindDetails()
    {
        try
        {
            
                dsDoctorDetail = new DataSet();
                dsDoctorDetail = null;
                dsDoctorDetail = (DataSet)objBusinessLogic.GetDoctorDetailsForPage(objDAEntities);
            
            

            if (dsDoctorDetail.Tables[0].Rows.Count > 0)
            {
                //imgDoctor.ImageUrl = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageUrl"].ToString()) ? CommonFn.DefaultImagePath : ds.Tables[0].Rows[0]["ImageUrl"].ToString();
                lblDoctorName.Text = Convert.ToString(dsDoctorDetail.Tables[0].Rows[0]["Name"]);
                litDoctormname.Text = lblFixDoctor.Text = lblDoctorName.Text;
                objDAEntities.dName = litDoctormname.Text;
                lblDocotrSpecialty.Text = Convert.ToString(dsDoctorDetail.Tables[0].Rows[0]["Specialization"]);
                lblDEmail.Text = Convert.ToString(dsDoctorDetail.Tables[0].Rows[0]["EmailId"]);
                lblDMobile.Text = Convert.ToString(dsDoctorDetail.Tables[0].Rows[0]["MobileNo"]) + "  " + Convert.ToString(dsDoctorDetail.Tables[0].Rows[0]["PhoneNo"]);
                divDesignation.InnerText = Convert.ToString(dsDoctorDetail.Tables[0].Rows[0]["Designation"]);

                hdnfollowup.Value = Convert.ToString(dsDoctorDetail.Tables[0].Rows[0]["FollowUpCharge"]);
                hdnconsulting.Value = Convert.ToString(dsDoctorDetail.Tables[0].Rows[0]["ConsultingCharge"]);
                // FixlabelBookingdate.Text = objDAEntities.Day;
            }
			bindDoctorSpeciality(dsDoctorDetail.Tables[3]);
           

        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }

    //public void bindDoctorSpeciality(int fiDoctorId)
    //{
    //    DataTable dt = new DataTable();
    //    dt = objBusinessLogic.GetDoctorSpecialities(fiDoctorId);

       // DataView dv = new DataView(dt);
     //   dv.RowFilter = "CategoryId <> 6";
        //DataRow[] result = dt.Select("CategoryId <> 6");
      //  drpSpecialty.DataValueField = "SpecialtyId";
     //   drpSpecialty.DataTextField = "SpecialityWithCategory";

      //  drpSpecialty.DataSource = dv;
      //  drpSpecialty.DataBind();
      //  drpSpecialty.Items.Insert(0, new ListItem("-Select-", "0"));
    //}
	public void bindDoctorSpeciality(DataTable dt)
    {
       // DataTable dt = new DataTable();
       // dt = objBusinessLogic.GetDoctorSpecialities(fiDoctorId);

        DataView dv = new DataView(dt);
        dv.RowFilter = "CategoryId <> 6";
        //DataRow[] result = dt.Select("CategoryId <> 6");
        drpSpecialty.DataValueField = "SpecialtyId";
        drpSpecialty.DataTextField = "SpecialityWithCategory";

        drpSpecialty.DataSource = dv;
        drpSpecialty.DataBind();
        drpSpecialty.Items.Insert(0, new ListItem("-Select-", "0"));
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Boolean DSFlag = false;
        JaslokMailer objMailer = new JaslokMailer();
        List<EmailParaMeters> lstParameters = new List<EmailParaMeters>();
        string lsEmailStatus = string.Empty;
        try
        {
            /*if (Captcha1.UserValidated)
            {*/

            //objDAEntities.DoctorScheduleId = Convert.ToInt32(hdnDoctorId.Value);
            objDAEntities.DoctorId = Convert.ToInt32(Request.QueryString["DI"]);
            
            int SpecialtyId = 0;
            Int32.TryParse(drpSpecialty.SelectedValue, out SpecialtyId);
            objDAEntities.SpecialtyId = Convert.ToInt32(drpSpecialty.SelectedValue);
            TimeSpan time = DateTime.ParseExact(drpTimeSlot.SelectedValue, "h:mm tt", CultureInfo.InvariantCulture).TimeOfDay;
            objDAEntities.TimeDate = DateTime.ParseExact(ddlAppointMentDate.SelectedValue, "dd/MM/yyyy", CultureInfo.InvariantCulture) + time;
            objDAEntities.Name = txtName.Text;
            objDAEntities.Day = Convert.ToDateTime(txtdob.SelectedDate).ToString("dd/MM/yyyy");//Convert.ToString(txtdob.SelectedDate);
            objDAEntities.Email = txtEmail.Text;
            objDAEntities.PhoneNo = txtPhoneNo.Text;
            objDAEntities.MobileNo = txtMobileNo.Text;
            objDAEntities.Location = ddlCountry.SelectedItem.Text;
            objDAEntities.Address = txtState.Text;
            objDAEntities.Description = txtInquiry.Text;
			
			objDAEntities.AppointmentType = (drpAppointmentType.SelectedValue == "Follow-Up") ? "Follow-Up" : "New";
			
            objBusinessLogic.SaveBookAppointment(objDAEntities);

            CommonFn.SendSMS(txtMobileNo.Text, "Your appointment date is: " + ddlAppointMentDate.SelectedValue);
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Username", ShortCodeValue = txtName.Text.Trim() });
            //lsEmailStatus = objMailer.SendEmail("fixanappointment", lstParameters, txtEmail.Text);
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Username", ShortCodeValue = txtName.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Day", ShortCodeValue = objDAEntities.Day });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Email", ShortCodeValue = txtEmail.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "PhoneNo", ShortCodeValue = txtPhoneNo.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "MobileNo", ShortCodeValue = txtMobileNo.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Location", ShortCodeValue = ddlCountry.SelectedItem.Text });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Username", ShortCodeValue = txtName.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Address", ShortCodeValue = txtState.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Description", ShortCodeValue = txtInquiry.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Apponintment", ShortCodeValue = objDAEntities.TimeDate.ToString("dd-MMM-yyyy hh:mm tt") });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "DoctorName", ShortCodeValue = lblDoctorName.Text.Trim() });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "AppointmentType", ShortCodeValue = objDAEntities.AppointmentType });
            lstParameters.Add(new EmailParaMeters { ShortCodeName = "Speciality", ShortCodeValue = lblDocotrSpecialty.Text.Trim() });


            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(AppGlobal.EmailFormFixAnappointment);

            string EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
            string EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);

           // lsEmailStatus = objMailer.SendEmail("fixanappointment_Admin", lstParameters, EmailToId, EmailCCId);

            lsEmailStatus = objMailer.SendEmail("fixanappointment_Admin", lstParameters, AppGlobal.FixAppointmentEmailAddress);
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('We have received your appointment request, you should receive a reply or a call shortly');", true);
            PlaceMessage.Visible = true;
            placeRightPart.Visible = false;
            Clear();
            /*}
            else
                FillCapctha();*/
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    public void Clear()
    {
        txtName.Text = "";
        txtdob.SelectedDate = null;
        txtEmail.Text = "";
        txtPhoneNo.Text = "";
        txtMobileNo.Text = "";
        ddlCountry.ClearSelection();
        txtState.Text = "";
        txtInquiry.Text = "";
        //txtCaptcha.Text = "";
        //datetimepick.SelectedDate = null;
        drpSpecialty.ClearSelection();
    }
    protected void btnResetFAA_Click(object sender, EventArgs e)
    {
        Clear();
    }
    //protected void drpSpecialty_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DataTable dt1 = new DataTable();
    //    dt1.Columns.Add("SpecialtyName", typeof(string));

    //    dt1.Rows.Add(drpSpecialty.SelectedItem.Text);
    //   // int specialty = Convert.ToInt32(drpSpecialty.SelectedValue);

    //    //dt1 = ds.Tables[2].Copy();
    //    DataSet ds1 = new DataSet();
    //    ds1.Tables.Add(dt1);

    //    string _specialtyName = GetBanner(ds1);
    //    if (File.Exists(Server.MapPath("/Content/SpecialtiesGallery/Banner/" + _specialtyName + ".jpg")))
    //    {
    //        imgbanner.Visible = true;
    //        imgbanner.ImageUrl = "/Content/SpecialtiesGallery/Banner/" + _specialtyName + ".jpg";
    //    }
    //    else
    //    {
    //        imgbanner.Visible = false;
    //    }
    //}
    public void BindTimeSlot()
    {
        lblTimeSlotError.Visible = false;
        lblTimeSlotError.Text = string.Empty;
        //CultureInfo english = new CultureInfo("en-US");
        //string selectedDay = (english.DateTimeFormat.DayNames[(int)Convert.ToDateTime(datetimepick.SelectedDate).DayOfWeek]).Substring(0, 3);
        string selectedDay = ddlAppointmentDay.SelectedValue.Substring(0, 3);

        DataTable dt = new DataTable();
        dt = dsDoctorDetail.Tables[1];
        List<DoctorSchedule> list = new List<DoctorSchedule>();
        list = (from DataRow row in dt.Rows
                select new DoctorSchedule()
                {
                    Day = row["Day"].ToString(),
                    Time = row["Time"].ToString(),
                    TimeSlot = Convert.ToInt32(row["TimeSlot"]),
                    SpecialtyId = Convert.ToInt32(row["SpecialtyId"])
                }).ToList();

        list = list.Where(Q => Q.SpecialtyId == Convert.ToInt32(drpSpecialty.SelectedValue) && Q.Day.Contains(selectedDay)).ToList();

        if (list.Count > 0)
        {
            drpTimeSlot.Items.Clear();
            List<string> lstMainSlots = new List<string>();
            foreach (DoctorSchedule objSchedule in list)
            {
                List<string> lstTime = objSchedule.Time.Split('-').ToList();
                DateTime dtStartTime = DateTime.ParseExact(lstTime[0].Trim().ToUpper(), "htt", CultureInfo.InvariantCulture);
                DateTime dtEndTime = DateTime.ParseExact(lstTime[1].Trim().ToUpper(), "htt", CultureInfo.InvariantCulture);
                List<string> lstSlots = new List<string>();
                lstSlots = GetTimeRange(dtStartTime, dtEndTime, objSchedule.TimeSlot).Select(Q => DateTime.ParseExact(Q.TimeOfDay.ToString(), "HH:mm:ss", CultureInfo.InvariantCulture).ToString("h:mm tt")).ToList();
                lstSlots.RemoveAt(lstSlots.Count - 1);
                lstMainSlots.AddRange(lstSlots);
            }

            foreach (string stSlot in lstMainSlots)
            {
                drpTimeSlot.Items.Add(new ListItem(stSlot));
            }

            drpTimeSlot.Items.Insert(0, new ListItem("-Select-", "0"));
        }
    }

    public IEnumerable<DateTime> GetTimeRange(DateTime startTime, DateTime endTime, int minutesBetween)
    {
        int periods = (int)(endTime - startTime).TotalMinutes / minutesBetween;
        return Enumerable.Range(0, periods + 1)
                         .Select(p => startTime.AddMinutes(minutesBetween * p));
    }
    protected void drpSpecialty_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetscheduleDays();
    }
    protected void drpTimeSlot_SelectedIndexChanged(object sender, EventArgs e)
    {
        TimeSpan time = DateTime.ParseExact(drpTimeSlot.SelectedValue, "h:mm tt", CultureInfo.InvariantCulture).TimeOfDay;
        DateTime SelectedDate = DateTime.ParseExact(ddlAppointMentDate.SelectedValue, "dd/MM/yyyy", CultureInfo.InvariantCulture) + time;
        bool isTimeSlotEmpty = objBusinessLogic.IstimeSlotEmpty(SelectedDate, Convert.ToInt32(Request.QueryString["DI"]), Convert.ToInt32(drpSpecialty.SelectedValue));
        if (!isTimeSlotEmpty)
        {
            lblTimeSlotError.Visible = true;
            lblTimeSlotError.Text = "Time slot is already full, please check for another slot";
        }
        else
        {
            lblTimeSlotError.Visible = false;
            lblTimeSlotError.Text = string.Empty;
        }
    }

    public void GetDates()
    {
        if (ddlAppointmentDay.SelectedValue != "0")
        {
            List<string> lstDates = new List<string>();

            TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime startDate = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
            startDate = startDate.AddDays(1);
            DateTime endDate = startDate.AddDays(31);

            TimeSpan diff = endDate - startDate;
            int days = diff.Days;

            for (var i = 0; i <= days; i++)
            {
                var testDate = startDate.AddDays(i);

                switch (testDate.DayOfWeek)
                {
                    case DayOfWeek.Monday:
                        if (ddlAppointmentDay.SelectedValue.ToLower().Substring(0, 3) == "mon")
                            lstDates.Add(testDate.ToString("dd/MM/yyyy"));
                        break;
                    case DayOfWeek.Tuesday:
                        if (ddlAppointmentDay.SelectedValue.ToLower().Substring(0, 3) == "tue")
                            lstDates.Add(testDate.ToString("dd/MM/yyyy"));
                        break;
                    case DayOfWeek.Wednesday:
                        if (ddlAppointmentDay.SelectedValue.ToLower().Substring(0, 3) == "wed")
                            lstDates.Add(testDate.ToString("dd/MM/yyyy"));
                        break;
                    case DayOfWeek.Thursday:
                        if (ddlAppointmentDay.SelectedValue.ToLower().Substring(0, 3) == "thu")
                            lstDates.Add(testDate.ToString("dd/MM/yyyy"));
                        break;
                    case DayOfWeek.Friday:
                        if (ddlAppointmentDay.SelectedValue.ToLower().Substring(0, 3) == "fri")
                            lstDates.Add(testDate.ToString("dd/MM/yyyy"));
                        break;
                    case DayOfWeek.Saturday:
                        if (ddlAppointmentDay.SelectedValue.ToLower().Substring(0, 3) == "sat")
                            lstDates.Add(testDate.ToString("dd/MM/yyyy"));
                        break;
                    case DayOfWeek.Sunday:
                        if (ddlAppointmentDay.SelectedValue.ToLower().Substring(0, 3) == "sun")
                            lstDates.Add(testDate.ToString("dd/MM/yyyy"));
                        break;
                }
            }

            ddlAppointMentDate.DataSource = lstDates;
            ddlAppointMentDate.DataBind();
        }

        
        ddlAppointMentDate.Items.Insert(0, new ListItem("Select Date", "0"));
    }

    protected void ddlAppointmentDay_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetDates();
    }

    public void GetscheduleDays()
    {
        if (Convert.ToInt32(Request.QueryString["DI"]) > 0)
        {
            DataSet ds = new DataSet();
            objDAEntities.DoctorId = Convert.ToInt32(Request.QueryString["DI"]);
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

            if (Convert.ToInt32(drpSpecialty.SelectedValue) > 0)
            {
                list = list.Where(Q => Q.SpecialtyId == Convert.ToInt32(drpSpecialty.SelectedValue)).ToList();
            }
            ddlAppointmentDay.Items.Clear();
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
                ddlAppointmentDay.DataSource = lstWeekdays;
                ddlAppointmentDay.DataBind();
            }
            ddlAppointmentDay.Items.Insert(0, new ListItem("Select Day", "0"));
        }
    }
    protected void ddlAppointMentDate_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindTimeSlot();
    }
    protected void btnPayNow_Click(object sender, EventArgs e)
    {
        Boolean DSFlag = false;
        JaslokMailer objMailer = new JaslokMailer();
        List<EmailParaMeters> lstParameters = new List<EmailParaMeters>();
        string lsEmailStatus = string.Empty;
        try
        {
            UserInfo objuser = UserController.Instance.GetCurrentUserInfo();
            bool check = objBusinessLogic.IsExistMrNo(objuser.Username.Trim());
            /*if (Captcha1.UserValidated)
            {*/

            //objDAEntities.DoctorScheduleId = Convert.ToInt32(hdnDoctorId.Value);
            objDAEntities.DoctorId = Convert.ToInt32(Request.QueryString["DI"]);
            DataSet ds = new DataSet();
            ds = null;
            int SpecialtyId = 0;
            Int32.TryParse(drpSpecialty.SelectedValue, out SpecialtyId);
            objDAEntities.SpecialtyId = Convert.ToInt32(drpSpecialty.SelectedValue);
            TimeSpan time = DateTime.ParseExact(drpTimeSlot.SelectedValue, "h:mm tt", CultureInfo.InvariantCulture).TimeOfDay;
            objDAEntities.TimeDate = DateTime.ParseExact(ddlAppointMentDate.SelectedValue, "dd/MM/yyyy", CultureInfo.InvariantCulture) + time;
            objDAEntities.Name = txtName.Text;
            objDAEntities.Day = Convert.ToDateTime(txtdob.SelectedDate).ToString("dd/MM/yyyy");//Convert.ToString(txtdob.SelectedDate);
            objDAEntities.Email = txtEmail.Text;
            objDAEntities.PhoneNo = txtPhoneNo.Text;
            objDAEntities.MobileNo = txtMobileNo.Text;
            objDAEntities.Location = ddlCountry.SelectedItem.Text;
            objDAEntities.Address = txtState.Text;
            objDAEntities.Description = txtInquiry.Text;
            objDAEntities.FacilityName = "BookAppointment";

          
			
			 objDAEntities.AppointmentType = (drpAppointmentType.SelectedValue == "Follow-Up") ? "Follow-Up" : "New";
			objDAEntities.ConsultingCharge = Convert.ToInt32(dsDoctorDetail.Tables[0].Rows[0]["ConsultingCharge"]);
            objDAEntities.FollowUpCharge = Convert.ToInt32(dsDoctorDetail.Tables[0].Rows[0]["FollowUpCharge"]);

            objDAEntities.AppointmentTypeCharge = (drpAppointmentType.SelectedValue == "Follow-Up") ? objDAEntities.FollowUpCharge : objDAEntities.ConsultingCharge;
			
            Session["Amount"] = 10;
            Session["AppointmentDetail"] = objDAEntities;
            if (CommonFn.UserID <= 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){loadUserPopup();});", true);
            }
            else if (check == true)
            {               
                PlaceMessage.Visible = true;
                placeRightPart.Visible = false;
                Clear();             
                Response.Redirect("/Payment.aspx");
            }
            else
            {
                 Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){PermanentRegReminderBox();});", true);

            }
            /*}
            else
                FillCapctha();*/
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
        
    }
}

