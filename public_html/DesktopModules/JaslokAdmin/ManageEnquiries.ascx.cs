using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using Microsoft.ApplicationBlocks.Data;
using System.Data.SqlClient;
using System.Data;
using BusinessDataLayer;
using DotNetNuke.Entities.Modules;

namespace DotNetNuke.Modules.JaslokAdmin
{
    public partial class ManageEnquiries : PortalModuleBase
    {

        public BusinessLogic objBusinessLogic = new BusinessLogic();
        public DataAccessLogic objDALogic = new DataAccessLogic();
        public DataAccessEntities objDAEntities = new DataAccessEntities();
        public string EnqType = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.CssClass = "";
            if (Page.IsPostBack != true)
            {
                BindPage();
                // LoadManage();
                ViewState["EnquiryTypeId"] = 0;
            }
        }

        public void BindPage()
        {
            try
            {
                DataSet ds = new DataSet();
                ds = null;
                ds = (DataSet)objBusinessLogic.GetEnquiryType();

                ddlEnquiry.DataValueField = "EnquiryTypeId";
                ddlEnquiry.DataTextField = "EnquiryType";


                if (ds.Tables[0].Rows.Count == 0)
                {
                    //Bind your grid here
                    ddlEnquiry.Visible = false;

                }
                else
                {
                    ddlEnquiry.Visible = true;
                    ddlEnquiry.DataSource = ds;
                    ddlEnquiry.DataBind();
                }

                ddlEnquiry.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //public void BindEnquiry(int id,int Tid)
        //{
        //    try
        //    {
        //        objDAEntities.EnquiryId = id;
        //        objDAEntities.EnquiryTypeId = Tid;
        //        DataSet ds = new DataSet();
        //        ds = null;
        //        ds = (DataSet)objBusinessLogic.GetAllEquiryGrid(objDAEntities);
        //        EnquiryDetailsView.DataSource = ds;
        //        EnquiryDetailsView.DataBind();

        //        rptPopup.DataSource = ds;
        //        rptPopup.DataBind();
        //    }
        //    catch (Exception ex)
        //    {

        //    }
        //}

        protected void dgEnquiry_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            lblMessage.Visible = true;

            if (e.CommandName == "Update")
            {
                ddlEnquiry.SelectedValue = ((Label)e.Item.Cells[1].FindControl("lblTitle")).Text;
                int EnquiryTypeId = Convert.ToInt32(e.CommandArgument);
                // ViewState["EnquiryTypeId"] = EnquiryTypeId;
            }
            else if (e.CommandName == "Delete")
            {
                objDAEntities.EnquiryTypeId = Convert.ToInt32(ddlEnquiry.SelectedValue);
                if (objDAEntities.EnquiryTypeId == 0)
                {
                    objDAEntities.EnquiryTypeId = Convert.ToInt16(ViewState["EnquiryTypeId"]);
                }
                int EnquiryId = (int)dgEnquiry.DataKeys[e.Item.ItemIndex];
                objDAEntities.EnquiryId = EnquiryId;
                objBusinessLogic.DeleteAllEquiryAdmin(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Data deleted successfully!!!";

                btnSubmit_Click(source, e);
            }
            //else if (e.CommandName == "View")
            //{

            //    int ViewEnquiryid = Convert.ToInt32(e.CommandArgument);
            //    int ViewEnquiryTypeid=Convert.ToInt32(ddlEnquiry.SelectedValue);


            //    BindEnquiry(ViewEnquiryid, ViewEnquiryTypeid);
            //    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "ViewDetail();", true);

            //    if (ddlEnquiry.SelectedItem.ToString() == "Feedback")
            //    {
            //        EnquiryDetailsView.Fields[4].Visible = true;
            //        EnquiryDetailsView.Fields[1].Visible = false;
            //        EnquiryDetailsView.Fields[3].Visible = false;
            //        EnquiryDetailsView.Fields[7].Visible = false;
            //        EnquiryDetailsView.Fields[8].Visible = false;
            //        EnquiryDetailsView.Fields[9].Visible = false;
            //        EnquiryDetailsView.Fields[10].Visible = false;
            //        EnquiryDetailsView.Fields[11].Visible = false;
            //        EnquiryDetailsView.Fields[12].Visible = false;
            //        EnquiryDetailsView.Fields[13].Visible = false;
            //    }
            //    else if (ddlEnquiry.SelectedItem.ToString() == "Complaint")
            //    {                    
            //        EnquiryDetailsView.Fields[1].Visible = false;
            //        EnquiryDetailsView.Fields[2].Visible = false;
            //        EnquiryDetailsView.Fields[3].Visible = false;
            //        EnquiryDetailsView.Fields[4].Visible = false;
            //        EnquiryDetailsView.Fields[6].Visible = false;
            //        EnquiryDetailsView.Fields[8].Visible = false;
            //        EnquiryDetailsView.Fields[9].Visible = false;
            //        EnquiryDetailsView.Fields[10].Visible = false;
            //        EnquiryDetailsView.Fields[11].Visible = false;
            //        EnquiryDetailsView.Fields[12].Visible = false;
            //        EnquiryDetailsView.Fields[13].Visible = false;
            //    }
            //    else if (ddlEnquiry.SelectedItem.ToString() == "EstimateRequest")
            //    {
            //        EnquiryDetailsView.Fields[3].Visible = false;
            //        EnquiryDetailsView.Fields[6].Visible = false;
            //        EnquiryDetailsView.Fields[7].Visible = false;
            //        EnquiryDetailsView.Fields[8].Visible = false;
            //        EnquiryDetailsView.Fields[13].Visible = false;
            //    }
            //    else if (ddlEnquiry.SelectedItem.ToString() == "QuickInquiry")
            //    {
            //        EnquiryDetailsView.Fields[3].Visible = false;
            //        EnquiryDetailsView.Fields[6].Visible = false;
            //        EnquiryDetailsView.Fields[7].Visible = false;


            //        EnquiryDetailsView.Fields[9].Visible = false;
            //        EnquiryDetailsView.Fields[10].Visible = false;
            //        EnquiryDetailsView.Fields[11].Visible = false;
            //        EnquiryDetailsView.Fields[12].Visible = false;
            //        EnquiryDetailsView.Fields[13].Visible = false;
            //    }

            //}
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();
                ds = null;
                //int column = GetColumnIndexByName(dgEnquiry, "EnquiryTypeId");
                objDAEntities.EnquiryTypeId = Convert.ToInt32(ddlEnquiry.SelectedValue);
                objDAEntities.EnquiryId = 0;
                divDataGride.Visible = true;

                ds = (DataSet)objBusinessLogic.GetAllEquiryGrid(objDAEntities);


                dgEnquiry.Columns[1].Visible = true;
                dgEnquiry.Columns[2].Visible = true;
                dgEnquiry.Columns[3].Visible = true;
                dgEnquiry.Columns[4].Visible = true;
                dgEnquiry.Columns[5].Visible = true;
                dgEnquiry.Columns[6].Visible = true;
                dgEnquiry.Columns[7].Visible = true;
                dgEnquiry.Columns[8].Visible = true;
                dgEnquiry.Columns[9].Visible = true;
                dgEnquiry.Columns[10].Visible = true;
                dgEnquiry.Columns[11].Visible = true;
                dgEnquiry.Columns[12].Visible = true;
                dgEnquiry.Columns[13].Visible = true;

                if (ddlEnquiry.SelectedItem.ToString() == "Feedback")
                {
                    dgEnquiry.Columns[4].Visible = true;
                    dgEnquiry.Columns[2].Visible = false;
                    dgEnquiry.Columns[7].Visible = false;
                    dgEnquiry.Columns[8].Visible = false;
                    dgEnquiry.Columns[9].Visible = false;
                    dgEnquiry.Columns[10].Visible = false;
                    dgEnquiry.Columns[11].Visible = false;
                    dgEnquiry.Columns[12].Visible = false;
                    EnqType = "Feedback";
                }
                else if (ddlEnquiry.SelectedItem.ToString() == "Complaint")
                {

                    dgEnquiry.Columns[2].Visible = false;
                    dgEnquiry.Columns[3].Visible = false;                    
                    dgEnquiry.Columns[6].Visible = false;
                    dgEnquiry.Columns[8].Visible = false;
                    dgEnquiry.Columns[9].Visible = false;
                    dgEnquiry.Columns[10].Visible = false;
                    dgEnquiry.Columns[11].Visible = false;
                    dgEnquiry.Columns[12].Visible = false;
                    EnqType = "Complaint";

                }
                else if (ddlEnquiry.SelectedItem.ToString() == "EstimateRequest")
                {


                    dgEnquiry.Columns[6].Visible = false;
                    dgEnquiry.Columns[7].Visible = false;
                    dgEnquiry.Columns[8].Visible = false;
                    EnqType = "Estimate Request";

                }
                else if (ddlEnquiry.SelectedItem.ToString() == "QuickInquiry")
                {
                    dgEnquiry.Columns[6].Visible = false;
                    dgEnquiry.Columns[7].Visible = false;

                    dgEnquiry.Columns[9].Visible = false;
                    dgEnquiry.Columns[10].Visible = false;
                    dgEnquiry.Columns[11].Visible = false;
                    dgEnquiry.Columns[12].Visible = false;
                    EnqType = "Quick Inquiry";

                }
                dgEnquiry.DataSource = ds;
                dgEnquiry.DataBind();

                if (dgEnquiry.Items.Count == 0)
                {
                    lblempty.Visible = true;
                    dgEnquiry.Visible = false;
                    divDataGride.Style.Remove("overflow-x");
                }
                else
                {
                    lblempty.Visible = false;
                    dgEnquiry.Visible = true;

                }

                //lblMessage.CssClass = "successlbl";
                //lblMessage.Text = "We have received your " + ddlEnquiry.SelectedItem.ToString() + " !!!";


            }
            catch (Exception ex)
            {

            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ddlEnquiry.ClearSelection();
            divDataGride.Visible = false;

        }
        //protected void dgEnquiry_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
        //{
        //    dgEnquiry.CurrentPageIndex = e.NewPageIndex;
        //    this.BindPage();
        //BindEnquiry(0, (int)ViewState["EnquiryTypeId"]);

        //    ListItem DrpSelVal = ddlEnquiry.Items.FindByValue(Convert.ToString(ViewState["EnquiryTypeId"]));
        //    if (DrpSelVal != null)
        //    {
        //        ddlEnquiry.ClearSelection();
        //        DrpSelVal.Selected = true;
        //    };

        //}

        protected void ddlEnquiry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ViewState["EnquiryTypeId"] = Convert.ToInt32(ddlEnquiry.SelectedValue);
        }

        protected void dgEnquiry_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            switch (ddlEnquiry.SelectedValue)
            {
                case "1":
                    EnqType = "Feedback";
                    break;
                case "2":
                    EnqType = "Complaint";
                    break;
                case "3":
                    EnqType = "Estimate Request";
                    break;
                case "4":
                    EnqType = "Quick Inquiry";
                    break;
            }

            dgEnquiry.CurrentPageIndex = e.NewPageIndex;
            objDAEntities.EnquiryTypeId = Convert.ToInt32(ddlEnquiry.SelectedValue);
            objDAEntities.EnquiryId = 0;
            divDataGride.Visible = true;

            DataSet ds = (DataSet)objBusinessLogic.GetAllEquiryGrid(objDAEntities);
            dgEnquiry.DataSource = ds;
            dgEnquiry.DataBind();
            // this.GetAllEquiryGrid(objDAEntities);
            //this.BindEnquiry(objDAEntities.EnquiryTypeId, 0);
        }
    }
}