using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetNuke.Modules.JaslokAdmin
{
    public partial class ManageCareerPosition : PortalModuleBase
    {
        public BusinessLogic objBusinessLogic = new BusinessLogic();
        public DataAccessLogic objDALogic = new DataAccessLogic();
        public DataAccessEntities objDAEntities = new DataAccessEntities();
        public void ShowAdd()
        {
            plcView.Visible = false;
            plcAdd.Visible = true;
            Clear();
        }
        public void ShowView()
        {
            plcView.Visible = true;
            plcAdd.Visible = false;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BingJobCategory();
                BindPosition();
                ViewState["JobId"] = 0;
                ViewState["optype"] = "INSERT";

            }
        }
        public void BingJobCategory()
        {
            try
            {
                DataSet ds = new DataSet();
                ds = null;
                ds = (DataSet)objBusinessLogic.GetCareerCategoryDetails();

                drpJobCategoryName.DataValueField = "FunctionId";
                drpJobCategoryName.DataTextField = "FunctionName";


                drpJobCategoryName.DataSource = ds;
                drpJobCategoryName.DataBind();
                drpJobCategoryName.Items.Insert(0, new ListItem("-Select-", "0"));
            }
            catch (Exception ex)
            {

            }
        }
        public void BindPosition()
        {
            try
            {
                DataSet ds = new DataSet();
                ds = null;
                ds = (DataSet)objBusinessLogic.GetCareerPositionDetails();


                if (ds.Tables[0].Rows.Count == 0)
                {
                    //Bind your grid here
                    lblempty.Visible = true;
                    dgCareerPosition.Visible = false;

                }
                else
                {
                    lblempty.Visible = false;
                    dgCareerPosition.Visible = true;
                    dgCareerPosition.DataSource = ds;
                    dgCareerPosition.DataBind();
                }
               
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //if (listofuploadedfiles.Text.Trim() != "" && listofuploadedfiles.Text != "No file selected")
                //{
                DataSet ds = new DataSet();
                ds = null;
                objDAEntities.FunctionId = Convert.ToInt32(drpJobCategoryName.SelectedValue);
                objDAEntities.PositionName = txtPosition.Text;
                objDAEntities.ReportTo = txtReportTo.Text.Replace("&nbsp;", "");
                objDAEntities.Location = txtLocation.Text.Replace("&nbsp;", "");

                objDAEntities.TotalVacantPosition = DBNull.Value;
                if (txtTotalVacantPosition.Text.Length > 0)
                {
                    objDAEntities.TotalVacantPosition = txtTotalVacantPosition.Text.Replace("&nbsp;", ""); 
                }

                objDAEntities.MinExp = DBNull.Value;                
                if (txtMinExp.Text.Length > 0)
                {
                    objDAEntities.MinExp = txtMinExp.Text.Replace("&nbsp;", "");
                }

                objDAEntities.MaxExp = DBNull.Value;
                if (txtMaxExp.Text.Length > 0)
                {
                    objDAEntities.MaxExp = txtMaxExp.Text.Replace("&nbsp;", "");
                }               
                if (txtTotalExp.Text.Length > 0)
                {
                    objDAEntities.TotalExperience = txtTotalExp.Text.Replace("&nbsp;", "");
                }
                objDAEntities.Job_Role = conJob_Role.Content;
                objDAEntities.ProfessionalRequirement = conProfessionalRequirement.Content.Replace("&nbsp;", ""); 
                objDAEntities.Education = conEducation.Content;
                objDAEntities.ExpiryDate = Convert.ToString(datetimepick.SelectedDate);
                objDAEntities.Salary = txtSalary.Text.Replace("&nbsp;", "");
                objDAEntities.SubmittedAt = txtSubmittedAt.Text.Replace("&nbsp;", ""); 
                objDAEntities.IsApproved = ckbIsApproved.Checked;
              
                if (ViewState["optype"].ToString() == "INSERT")
                {
                    objDAEntities.CreatedByUserID = CommonFn.UserID;
                    string msg = objBusinessLogic.SaveCareerPosition(objDAEntities);
                    Clear();
                    lblMessage.Visible = true;
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Career position added successfully!!!";
                }
                else if (ViewState["optype"].ToString() == "UPDATE")
                {
                    objDAEntities.JobId = (int)ViewState["JobId"];
                    objDAEntities.optype = "UPDATE";
                    objDAEntities.UpdatedByUserID = CommonFn.UserID;
                    objBusinessLogic.UpdateDeleteCareerPosition(objDAEntities);
                    Clear();
                    lblMessage.Visible = true;
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Career Positions updated successfully!!!";
                }

                ViewState["optype"] = "INSERT";
                BindPosition();
                ShowView();
               
            }
            catch (Exception ex)
            {
            }
        }
        protected void dgCareerPosition_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            objDAEntities.JobId = Convert.ToInt32(e.CommandArgument);
            lblMessage.Visible = false;

            ViewState["JobId"] = objDAEntities.JobId;
            if (e.CommandName == "Update")
            {
                ShowAdd();
                txtPosition.Text = e.Item.Cells[1].Text;
                if (drpJobCategoryName.Items.FindByText(e.Item.Cells[2].Text) != null)
                {
                    drpJobCategoryName.ClearSelection();
                    drpJobCategoryName.Items.FindByText(e.Item.Cells[2].Text).Selected = true;
                }

                txtReportTo.Text = e.Item.Cells[3].Text.Replace("&nbsp;","");
                txtLocation.Text = e.Item.Cells[4].Text.Replace("&nbsp;", "");
                txtTotalVacantPosition.Text = e.Item.Cells[5].Text.Replace("&nbsp;", ""); 
                txtMinExp.Text = e.Item.Cells[6].Text;
                txtMaxExp.Text = e.Item.Cells[7].Text.Replace("&nbsp;", "");
                txtTotalExp.Text = e.Item.Cells[8].Text.Replace("&nbsp;", "");
                conJob_Role.Content = e.Item.Cells[9].Text;
                conProfessionalRequirement.Content = e.Item.Cells[10].Text.Replace("&nbsp;", "");
                conEducation.Content = e.Item.Cells[11].Text;
                if (Convert.ToDateTime(e.Item.Cells[12].Text) > datetimepick.MinDate)
                {
                    datetimepick.SelectedDate = Convert.ToDateTime(e.Item.Cells[12].Text);
                }
                txtSalary.Text = e.Item.Cells[13].Text.Replace("&nbsp;", "");
                txtSubmittedAt.Text = e.Item.Cells[14].Text.Replace("&nbsp;", "");

                //if (e.Item.Cells[14].Text == "True")
                //{
                //    ckbIsApproved.Checked = true;
                //}
                string status = (e.Item.FindControl("ltstatus") as Literal).Text;

                ckbIsApproved.Checked = status == "Yes";
                ViewState["optype"] = "UPDATE";
            }
            else if (e.CommandName == "Delete")
            {
                objDAEntities.optype = "DELETE";
                objBusinessLogic.UpdateDeleteCareerPosition(objDAEntities);
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Career Positions deleted successfully!!!";
                ViewState["optype"] = "INSERT";
            }
            BindPosition();
        }
        public void Clear()
        {
            drpJobCategoryName.ClearSelection();
            txtPosition.Text = "";
            txtReportTo.Text = "";
            txtLocation.Text = "";
            txtTotalVacantPosition.Text = "";
            txtMinExp.Text = "";
            txtMaxExp.Text = "";
            conJob_Role.Content = "";
            conProfessionalRequirement.Content = "";
            conEducation.Content = "";
            datetimepick.Clear();
            txtSalary.Text = "";
            txtSubmittedAt.Text = "";
            ckbIsApproved.Checked = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ShowView();
            Clear();
            lblMessage.Visible = false;
        }
        protected void dgCareerPosition_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
        {
            dgCareerPosition.CurrentPageIndex = e.NewPageIndex;
            this.BindPosition();
        }

        protected void btnAddPosition_Click(object sender, EventArgs e)
        {
            ShowAdd();
        }
}
}