using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using DotNetNuke.Entities.Modules;
using BusinessDataLayer;
using System.Collections.Generic;

public partial class JSControls_MiddleContent_ApplyJaslokCareer : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    string pathForSaving = "";
    int JobId = 0;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        rdpDOB.MaxDate = DateTime.Now;
        CompareValidator2.ValueToCompare = DateTime.Now.ToShortDateString();

        if (Request.QueryString["JobId"] != null)
        {
            JobId = Convert.ToInt32(Request.QueryString["JobId"]);
        }

        if (!Page.IsPostBack)
        {
            //BindNationality();
            GetCareerPostAndCategory();
            ViewState["dtWork"] = null;
            ViewState["WorkExpData"] = null;
        }
        BindDynamic();
        BindNationality();
        BindTotalExpYear();
        BindTotalExpMonth();
        BindOtherExpYear();
        BindOtherExpMonth();

    }

    public void GetCareerPostAndCategory()
    {

        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.JobId = JobId;
            ds = (DataSet)objBusinessLogic.GetCareerPostAndCategory(objDAEntities);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFunction.Text = ds.Tables[0].Rows[0]["FunctionName"].ToString();
                txtPost.Text = ds.Tables[0].Rows[0]["Position"].ToString();
                lblFunctionID.Text = ds.Tables[0].Rows[0]["FunctionId"].ToString();
                lblJobId.Text = ds.Tables[0].Rows[0]["JobId"].ToString();
                txtFunction.ReadOnly = true;
                txtPost.ReadOnly = true;
            }

        }
        catch (Exception ex)
        {

        }

    }

    public void BindNationality()
    {
        try
        {
            SqlDataAdapter da = new SqlDataAdapter("JH_SP_getNationality", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "data");
            ddlNationality.DataSource = ds.Tables["data"];
            ddlNationality.DataValueField = "NationalityID";
            ddlNationality.DataTextField = "NationalityDescription";
            ddlNationality.DataBind();
            ddlNationality.Items.Insert(0, new ListItem("--Select--", ""));
        }
        catch (Exception ex)
        {
        }

    }

    public void BindTotalExpYear()
    {
        try
        {
            ddlTotalExp.Items.Insert(0, new ListItem("--Year--", ""));
            for (Int32 i = 0; i <= 25; i++)
            {
                ddlTotalExp.Items.Add(new ListItem(i.ToString(), i.ToString(), true));
            }
        }
        catch (Exception ex)
        {

        }

    }
    public void BindTotalExpMonth()
    {
        try
        {
            ddlTotalExpMonth.Items.Insert(0, new ListItem("--Month--", ""));
            for (Int32 i = 0; i <= 11; i++)
            {
                ddlTotalExpMonth.Items.Add(new ListItem(i.ToString(), i.ToString(), true));
            }
        }
        catch (Exception ex)
        {

        }

    }
    public void BindOtherExpYear()
    {
        try
        {

            ddlOtherExp.Items.Insert(0, new ListItem("--Year--", ""));
            for (Int32 i = 0; i <= 25; i++)
            {
                ddlOtherExp.Items.Add(new ListItem(i.ToString(), i.ToString(), true));
            }
        }
        catch (Exception ex)
        {

        }

    }
    public void BindOtherExpMonth()
    {
        try
        {
            ddlOtherExpMonth.Items.Insert(0, new ListItem("--Month--", ""));
            for (Int32 i = 0; i <= 11; i++)
            {
                ddlOtherExpMonth.Items.Add(new ListItem(i.ToString(), i.ToString(), true));
            }
        }
        catch (Exception ex)
        {

        }

    }
    public DataTable BindQualification()
    {
        try
        {
            SqlDataAdapter da = new SqlDataAdapter("JH_SP_getQualification", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "data");

            return ds.Tables["data"];
        }
        catch (Exception ex)
        {
            return null;
        }

    }


    public void BindDynamic()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        //Define the Columns
        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));

        dt.Columns.Add(new DataColumn("Qualification", typeof(string)));

        dt.Columns.Add(new DataColumn("Deggree", typeof(string)));

        dt.Columns.Add(new DataColumn("University/Institute", typeof(string)));

        dt.Columns.Add(new DataColumn("Specialization ", typeof(string)));

        dt.Columns.Add(new DataColumn("Percentage /Grade  ", typeof(string)));

        //Add a Dummy Data on Initial Load
        for (Int32 i = 0; i < 5; i++)
        {
            dr = dt.NewRow();

            dr["RowNumber"] = i;

            dt.Rows.Add(dr);

        }

        //Bind the DataTable to the Grid

        gdQualification.DataSource = dt;

        gdQualification.DataBind();


    }
    public DataTable CreateGridWorkDynamic()
    {
        DataTable dt = new DataTable();
        ViewState["dtWork"] = null;

        dt.Columns.Add(new DataColumn("Company", typeof(string)));

        dt.Columns.Add(new DataColumn("Designation", typeof(string)));

        dt.Columns.Add(new DataColumn("Location", typeof(string)));

        dt.Columns.Add(new DataColumn("FromDate", typeof(string)));

        dt.Columns.Add(new DataColumn("ToDate", typeof(string)));

        dt.Columns.Add(new DataColumn("CompanyTurnOver", typeof(string)));

        dt.Columns.Add(new DataColumn("NoOfEmployee", typeof(string)));

        dt.Columns.Add(new DataColumn("Responsibility", typeof(string)));

        dt.Columns.Add(new DataColumn("Reporting", typeof(string)));

        dt.Columns.Add(new DataColumn("Salary", typeof(string)));

        dt.Columns.Add(new DataColumn("Reason", typeof(string)));

        return dt;

    }
    protected void gdQualification_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.RowType != DataControlRowType.DataRow)
            return;

        DropDownList ddl = new DropDownList();
        TextBox txt1 = new TextBox();
        TextBox txt2 = new TextBox();
        TextBox txt3 = new TextBox();
        TextBox txt4 = new TextBox();
        ddl.ID = "ddlQualification" + row.RowIndex;
        txt1.ID = "txtDeggree" + row.RowIndex;
        txt2.ID = "txtUniversity" + row.RowIndex;
        txt3.ID = "txtSpecialization" + row.RowIndex;
        txt4.ID = "txtPercentage" + row.RowIndex;

        ddl.Items.Insert(0, new ListItem("--Select--", ""));
        DataTable dt = BindQualification();
        for (Int32 i = 0; i < dt.Rows.Count; i++)
        {
            ddl.Items.Add(new ListItem(dt.Rows[i]["QualificationDescription"].ToString(), dt.Rows[i]["QualificationID"].ToString(), true));
            row.Cells[1].Controls.Add(ddl);
            row.Cells[2].Controls.Add(txt1);
            row.Cells[3].Controls.Add(txt2);
            row.Cells[4].Controls.Add(txt3);
            row.Cells[5].Controls.Add(txt4);
        }
    }
    public void Upload()
    {

        ////HttpPostedFile MyFile = Request.Files["MyFile"];
        //string fileName = Path.GetFileName(UploadResume.PostedFile.FileName);
        ViewState["FilePath"] = "";

        //for (int i = 0; i < Request.Files.Count; i++)
        //{
        //    var myFile = Request.Files[i];
        //    if (myFile != null && myFile.ContentLength != 0)
        //    {
        //        pathForSaving = Server.MapPath("~/uploadedfiles/");
        //        string pathForSavingFile = "/uploadedfiles/";
        //        try
        //        {
        //            string strFileNameOnly = CommonFn.GetFileName(myFile.FileName);
        //            ViewState["FilePath"] = Path.Combine(pathForSavingFile, strFileNameOnly);
        //            string strFileName= Path.Combine(pathForSavingFile, strFileNameOnly);
        //            MyFile = Request.Files[CommonFn.GetFileName(myFile.FileName)];
        //            MyFile.SaveAs(Path.Combine(pathForSaving, strFileName));


        //        }
        //        catch (Exception ex)
        //        {

        //        }

        //    }
        //}
        string strDBImagePath = string.Empty;
        try
        {
            if (UploadResume.HasFile)
            {
                string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
                string strSaveImagePath = string.Empty;
                string fileName = Path.GetFileName(UploadResume.PostedFile.FileName);

                string FolderName = CommonFn.UploadedResumeFolder;

                string strFileNameOnly = CommonFn.GetFileName(fileName);

                strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly;

                UploadResume.SaveAs(strSaveImagePath);

                strDBImagePath = CommonFn.DbSave + CommonFn.DbUploadedResume;
                strDBImagePath = strDBImagePath + strFileNameOnly;

                ViewState["FilePath"] = strDBImagePath;
            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //string strWorkExp = "<WorkExpList>";
        //if (gdWorkExp.Rows.Count > 0)
        //{


        try
        {
            Upload();

            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.FunctionId = Convert.ToInt32(lblFunctionID.Text);
            objDAEntities.PositionID = Convert.ToInt32(lblJobId.Text);
            objDAEntities.ApplicantFirstName = txtFirstName.Text.Trim();
            objDAEntities.ApplicantMiddleName = txtMiddleName.Text;
            objDAEntities.ApplicantLastName = txtLastName.Text;
            objDAEntities.ApplicantDOB = Convert.ToDateTime(rdpDOB.SelectedDate).ToShortDateString().ToString();
            objDAEntities.ApplicantGender = ddlGender.SelectedValue;
            objDAEntities.ApplicantReligion = txtReligion.Text;
            objDAEntities.ApplicantNationality = ddlNationality.SelectedValue;
            objDAEntities.ApplicantLandLineOffice = txtLandLineOffice1.Text.Trim() + "-" + txtLandLineOffice2.Text.Trim();
            objDAEntities.ApplicantLandLineResidance = txtLandLineRes1.Text.Trim() + "-" + txtLandLineRes2.Text.Trim();

            objDAEntities.ApplicantMobile = txtMobile.Text;
            objDAEntities.ApplicantEmail = txtEmail.Text;
            objDAEntities.ApplicantCurrentAddress = txtCurrentAddress.Text;
            objDAEntities.ApplicantPermanentAddress = txtPermanentAddress.Text;
            objDAEntities.AdditionalQualification = txtAddotionalQual.Text;

            objDAEntities.TotalExpInYear = DBNull.Value;
            if (ddlTotalExp.SelectedValue != "")
            {
                objDAEntities.TotalExpInYear = Convert.ToInt32(ddlTotalExp.SelectedValue);
            }

            objDAEntities.TotalExpInMonth = DBNull.Value;
            if (ddlTotalExpMonth.SelectedValue != "")
            {
                objDAEntities.TotalExpInMonth = Convert.ToInt32(ddlTotalExpMonth.SelectedValue);
            }

            objDAEntities.AdditionalExpInYear = DBNull.Value;
            if (ddlOtherExp.SelectedValue != "")
            {
                objDAEntities.AdditionalExpInYear = Convert.ToInt32(ddlOtherExp.SelectedValue);
            }

            objDAEntities.AdditionalExpInMonth = DBNull.Value;
            if (ddlOtherExpMonth.SelectedValue != "")
            {
                objDAEntities.AdditionalExpInMonth = Convert.ToInt32(ddlOtherExpMonth.SelectedValue);
            }

            objDAEntities.ApplicantCurrSal = DBNull.Value;
            if (txtCurrSal.Text != "")
            {
                objDAEntities.ApplicantCurrSal = Convert.ToDouble(txtCurrSal.Text);
            }
            objDAEntities.ApplicantExpSal = DBNull.Value;
            if (txtExpSal.Text != "")
            {
                objDAEntities.ApplicantExpSal = Convert.ToDouble(txtExpSal.Text);
            }

            objDAEntities.ApplicantCVPath = ViewState["FilePath"].ToString();


            objDAEntities.ApplicantID = objBusinessLogic.SaveCandidateApplication(objDAEntities);

            if (objDAEntities.ApplicantID > 0)
            {
                DataTable dt = new DataTable();
                dt = getWorkExpTable();

                // Add Work Experience
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {

                    if (dt.Rows[i]["CompanyName"] != null)
                    {

                        DataSet dsnew = new DataSet();
                        dsnew = null;

                        objDAEntities.ApplicantID = objDAEntities.ApplicantID;
                        objDAEntities.CompanyName = Convert.ToString(dt.Rows[i]["CompanyName"]);
                        objDAEntities.empDesignation = Convert.ToString(dt.Rows[i]["empDesignation"]);
                        objDAEntities.CompanyTurnOver = Convert.ToString(dt.Rows[i]["CompanyTurnOver"]);
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[i]["NoOfEmployee"])))
                        {
                            objDAEntities.NoOfEmployee = Convert.ToInt32(dt.Rows[i]["NoOfEmployee"]);
                        }
                        objDAEntities.JobResponsibilities = Convert.ToString(dt.Rows[i]["JobResponsibilities"]);
                        objDAEntities.Location = Convert.ToString(dt.Rows[i]["Location"].ToString());
                        objDAEntities.FromDate = Convert.ToString(dt.Rows[i]["FromDate"]);
                        objDAEntities.ToDate = Convert.ToString(dt.Rows[i]["ToDate"]);
                        objDAEntities.Reporting = Convert.ToString(dt.Rows[i]["Reporting"]);
                        if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[i]["SalaryInlacs"])))
                        {
                            objDAEntities.SalaryInlacs = Convert.ToDouble(dt.Rows[i]["SalaryInlacs"]);
                        }
                        // objDAEntities.SalaryInlacs =(!string.IsNullOrEmpty(Convert.ToString(dt.Rows[i]["SalaryInlacs"])))?Convert.ToDouble(dt.Rows[i]["SalaryInlacs"]):;
                        objDAEntities.ReasonForLeaving = Convert.ToString(dt.Rows[i]["ReasonForLeaving"]);

                        string msg = objBusinessLogic.SaveWorkExpByApplicant(objDAEntities);

                    }

                }



                // Add Qualification

                for (int i = 1; i <= 5; i++)
                {
                    string ddlName = "ddlQualification" + i.ToString();
                    DropDownList ddlQualID = (DropDownList)this.FindControl(ddlName);
                    //ddlQualID.ID = ddlName;


                    if (ddlQualID.SelectedValue != "")
                    {
                        if (Convert.ToInt32(ddlQualID.SelectedValue) > 0)
                        {
                            string strDegree = "txtDegree" + i.ToString();
                            TextBox txtDegree = (TextBox)this.FindControl(strDegree);

                            string strUniversity = "txtUniversity" + i.ToString();
                            TextBox txtUniversity = (TextBox)this.FindControl(strUniversity);

                            string strSpecialization = "txtSpecialization" + i.ToString();
                            TextBox txtSpecialization = (TextBox)this.FindControl(strSpecialization);

                            string strGrade = "txtGrade" + i.ToString();
                            TextBox txtGrade = (TextBox)this.FindControl(strGrade);


                            objDAEntities.ApplicantID = objDAEntities.ApplicantID;
                            objDAEntities.AppQualification = ddlQualID.SelectedItem.Text;
                            objDAEntities.AppDegree = txtDegree.Text;
                            objDAEntities.AppUniversityName = txtUniversity.Text;
                            objDAEntities.AppSpecialization = txtSpecialization.Text;
                            objDAEntities.AppPercentage_Grade = txtGrade.Text;

                            string msg = objBusinessLogic.Save_ApplicantQualification(objDAEntities);

                        }

                    }

                }



            }

            JaslokMailer objMailer = new JaslokMailer();
            List<Parameters> lstParameters = new List<Parameters>();
            lstParameters.Add(new Parameters { ShortCodeName = "Post", ShortCodeValue = txtPost.Text.Trim() });
            lstParameters.Add(new Parameters { ShortCodeName = "Username", ShortCodeValue = txtFirstName.Text.Trim() + " " + (!string.IsNullOrEmpty(txtMiddleName.Text.Trim()) ? (txtMiddleName.Text.Trim() + " ") : string.Empty) + txtLastName.Text.Trim() });
            lstParameters.Add(new Parameters { ShortCodeName = "DateOfBirth", ShortCodeValue = Convert.ToDateTime(rdpDOB.SelectedDate).ToString("dd/MM/yyyy") });
            lstParameters.Add(new Parameters { ShortCodeName = "Gender", ShortCodeValue = ddlGender.SelectedValue });
            lstParameters.Add(new Parameters { ShortCodeName = "EmailAdd", ShortCodeValue = txtEmail.Text.Trim() });
            lstParameters.Add(new Parameters { ShortCodeName = "Permanent", ShortCodeValue = txtPermanentAddress.Text.Trim() });

            DataSet objds = new DataSet();
            objds = null;
            objds = (DataSet)objBusinessLogic.GetFormsEmailDetail((int)AppGlobal.JaslokEmailHandler.ApplyJaslokCareer);

            string EmailToId = Convert.ToString(objds.Tables[0].Rows[0]["EmailToId"]);
            string EmailCCId = Convert.ToString(objds.Tables[0].Rows[0]["EmailCCId"]);

            objMailer.SendEmail("career", lstParameters, EmailToId, EmailCCId);

            //objMailer.SendEmail("career", lstParameters, AppGlobal.CareerEmailAddress);
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Application saved successfully!!!";

            clear();

        }
        catch (Exception ex)
        {
            lblMessage.CssClass = "errorlbl";
            lblMessage.Text = ex.Message;
        }
        finally
        {
            ViewState["WorkExpData"] = null;
        }



    }
    protected void btnSaveAdd_Click(object sender, EventArgs e)
    {
        DataTable dtWork = new DataTable();
        DataRow dr = null;

        try
        {
            dtWork = getWorkExpTable();

            if ((dtWork.Rows.Count > 0))
            {
                for (int i = 0; i <= dtWork.Rows.Count - 1; i++)
                {
                    dr = dtWork.NewRow();
                    if ((dtWork.Rows[i]["CompanyName"].ToString() != txtComapnyName.Text.ToString()))
                    {
                        dr["CompanyName"] = txtComapnyName.Text;
                        dr["empDesignation"] = txtDesignation.Text;
                        dr["Location"] = txtLocation.Text;
                        dr["FromDate"] = Convert.ToString(Convert.ToDateTime(rdpFromDate.SelectedDate).ToShortDateString());
                        dr["ToDate"] = Convert.ToString(Convert.ToDateTime(rdpToDate.SelectedDate).ToShortDateString());
                        dr["CompanyTurnOver"] = txtTurnOver.Text;
                        if (!string.IsNullOrEmpty(txtNoOfEmployees.Text))
                        {
                            dr["NoOfEmployee"] = Convert.ToInt32(txtNoOfEmployees.Text);
                        }
                        //dr["NoOfEmployee"] = Convert.ToInt32(txtNoOfEmployees.Text);
                        dr["JobResponsibilities"] = txtReason.Text;
                        dr["Reporting"] = txtReporting.Text;
                        dr["SalaryInLacs"] = txtSalPA.Text;
                        dr["JobResponsibilities"] = txtReason.Text;

                    }

                }

                dtWork.Rows.Add(dr);

            }
            else
            {
                dr = dtWork.NewRow();

                dr["CompanyName"] = Convert.ToString(txtComapnyName.Text);
                dr["empDesignation"] = Convert.ToString(txtDesignation.Text);
                dr["Location"] = Convert.ToString(txtLocation.Text);
                dr["FromDate"] = Convert.ToString(Convert.ToDateTime(rdpFromDate.SelectedDate).ToShortDateString());
                dr["ToDate"] = Convert.ToString(Convert.ToDateTime(rdpToDate.SelectedDate).ToShortDateString());
                dr["CompanyTurnOver"] = Convert.ToString(txtTurnOver.Text);
                if (!string.IsNullOrEmpty(txtNoOfEmployees.Text))
                {
                    dr["NoOfEmployee"] = Convert.ToInt32(txtNoOfEmployees.Text);
                }
                dr["JobResponsibilities"] = Convert.ToString(txtReason.Text);
                dr["Reporting"] = Convert.ToString(txtReporting.Text);
                dr["SalaryInLacs"] = txtSalPA.Text.ToString();
                dr["ReasonForLeaving"] = Convert.ToString(txtReason.Text);

                dtWork.Rows.Add(dr);

            }

            dtWork.AcceptChanges();

            ViewState["WorkExpData"] = dtWork;

            clearWorkExp();

            gdWorkExp.DataSource = dtWork;
            gdWorkExp.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());

        }


    }

    protected DataTable getWorkExpTable()
    {
        DataTable dt = new DataTable();
        if (ViewState["WorkExpData"] == null)
        {

            DataColumn Col_CompanyName = new DataColumn("CompanyName", System.Type.GetType("System.String"));
            dt.Columns.Add(Col_CompanyName);
            DataColumn Col_empDesignation = new DataColumn("empDesignation", System.Type.GetType("System.String"));
            dt.Columns.Add(Col_empDesignation);
            DataColumn Col_CompanyTurnOver = new DataColumn("CompanyTurnOver", System.Type.GetType("System.String"));
            dt.Columns.Add(Col_CompanyTurnOver);
            DataColumn Col_NoOfEmployee = new DataColumn("NoOfEmployee", System.Type.GetType("System.Int32"));
            dt.Columns.Add(Col_NoOfEmployee);

            DataColumn Col_JobResponsibilities = new DataColumn("JobResponsibilities", System.Type.GetType("System.String"));
            dt.Columns.Add(Col_JobResponsibilities);

            DataColumn Col_Location = new DataColumn("Location", System.Type.GetType("System.String"));
            dt.Columns.Add(Col_Location);

            DataColumn Col_FromDate = new DataColumn("FromDate", System.Type.GetType("System.String"));
            dt.Columns.Add(Col_FromDate);
            DataColumn Col_ToDate = new DataColumn("ToDate", System.Type.GetType("System.String"));
            dt.Columns.Add(Col_ToDate);

            DataColumn Col_Reporting = new DataColumn("Reporting", System.Type.GetType("System.String"));
            dt.Columns.Add(Col_Reporting);

            DataColumn Col_SalaryInLacs = new DataColumn("SalaryInLacs", System.Type.GetType("System.String"));
            dt.Columns.Add(Col_SalaryInLacs);
            DataColumn Col_ReasonForLeaving = new DataColumn("ReasonForLeaving", System.Type.GetType("System.String"));
            dt.Columns.Add(Col_ReasonForLeaving);


            ViewState["WorkExpData"] = dt;
        }
        else
        {
            dt = (DataTable)ViewState["WorkExpData"];
        }

        return dt;
    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        clear();
        clearWorkExp();

    }
    public void clear()
    {
        txtFirstName.Text = "";
        txtMiddleName.Text = "";
        txtLastName.Text = "";
        rdpDOB.SelectedDate = null;
        ddlGender.ClearSelection();
        ddlNationality.ClearSelection();
        txtReligion.Text = "";
        txtLandLineOffice1.Text = "";
        txtLandLineOffice2.Text = "";
        txtLandLineRes1.Text = "";
        txtLandLineRes2.Text = "";
        txtMobile.Text = "";
        txtEmail.Text = "";
        txtCurrentAddress.Text = "";
        txtPermanentAddress.Text = "";
        chkSameAddress.Checked = false;
        txtAddotionalQual.Text = "";
        ddlTotalExp.ClearSelection();
        ddlTotalExpMonth.ClearSelection();
        ddlOtherExp.ClearSelection();
        ddlOtherExpMonth.ClearSelection();
        txtCurrSal.Text = "";
        txtExpSal.Text = "";
        chkDeclaration.Checked = false;
        //UploadResume.FileName = null;
        listofuploadedResume.Text = null;

        ddlQualification1.ClearSelection();
        ddlQualification1.SelectedValue = "0";

        ddlQualification2.ClearSelection();
        ddlQualification2.SelectedValue = "0";

        ddlQualification2.ClearSelection();
        ddlQualification2.SelectedValue = "0";

        ddlQualification2.ClearSelection();
        ddlQualification2.SelectedValue = "0";

        ddlQualification2.ClearSelection();
        ddlQualification2.SelectedValue = "0";

        txtDegree1.Text = "";
        txtUniversity1.Text = "";
        txtSpecialization1.Text = "";
        txtGrade1.Text = "";

        txtDegree2.Text = "";
        txtUniversity2.Text = "";
        txtSpecialization2.Text = "";
        txtGrade2.Text = "";

        txtDegree3.Text = "";
        txtUniversity3.Text = "";
        txtSpecialization3.Text = "";
        txtGrade3.Text = "";

        txtDegree4.Text = "";
        txtUniversity4.Text = "";
        txtSpecialization4.Text = "";
        txtGrade4.Text = "";

        txtDegree5.Text = "";
        txtUniversity5.Text = "";
        txtSpecialization5.Text = "";
        txtGrade5.Text = "";

    }
    public void clearWorkExp()
    {
        txtComapnyName.Text = "";
        txtDesignation.Text = "";
        txtLocation.Text = "";
        txtTurnOver.Text = "";
        txtNoOfEmployees.Text = "";
        txtJobRespons.Text = "";
        txtReporting.Text = "";
        txtFromDate.Text = "";
        txtToDate.Text = "";
        txtSalPA.Text = "";
        txtReason.Text = "";
    }


    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/career");
    }
}