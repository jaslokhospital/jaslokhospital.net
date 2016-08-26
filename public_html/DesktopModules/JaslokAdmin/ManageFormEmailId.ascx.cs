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
    public partial class ManageFormEmailId : PortalModuleBase
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
                BindFormDetails(0);                     
                ViewState["FormMailid"] = 0;
                ViewState["optype"] = "INSERT";
            } 
        }       

        public void BindFormDetails(int id)
          {
            try
            {
                DataSet ds = new DataSet();
                ds = null;
                ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(id);

                if (ds.Tables[0].Rows.Count == 0)
                {
                    //Bind your grid here
                    lblempty.Visible = true;
                    dgFormMail.Visible = false;
                }
                else
                {
                    lblempty.Visible = false;
                    dgFormMail.Visible = true;
                    dgFormMail.DataSource = ds;
                    dgFormMail.DataBind();
                }
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
            }
        }
        public void Clear()
        {
            txtMailTo.Text = null;
            txtMailcc.Text = null;
            ddlFormType.ClearSelection();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
            ShowView();
            BindFormDetails(0);
            lblMessage.Visible = false;
            ddlFormType.Enabled = true;
        }
       
        //protected void btnAddMailDetail_Click(object sender, EventArgs e)
        //{
        //    ShowAdd();
        //}
        //protected void dgFormMail_ItemCommand1(object source, DataGridCommandEventArgs e)
        //{
            
        //}
        protected void dgFormMail_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dgFormMail.CurrentPageIndex = e.NewPageIndex;
            this.BindFormDetails(0);
        }
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {            
            try
            {
                
                DataSet ds = new DataSet();
                ds = null;
                objDAEntities.Id = (int)ViewState["FormMailid"];
                objDAEntities.EmailToId = txtMailTo.Text;
                objDAEntities.EmailCCId = txtMailcc.Text;
                if (!string.IsNullOrEmpty(ddlFormType.SelectedValue))
                {
                    objDAEntities.FormType = ddlFormType.SelectedValue;
                }
                lblMessage.Visible = true;
                if (ViewState["optype"].ToString() == "INSERT")
                {
                    objDAEntities.CreatedByUserID = CommonFn.UserID;
                    ds = (DataSet)objBusinessLogic.SaveUpdateFormsEmailDetail(objDAEntities);
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Form mail details added successfully!!!";
                }
                else if (ViewState["optype"].ToString() == "UPDATE")
                {
                    objDAEntities.UpdatedByUserID = CommonFn.UserID;
                    objDAEntities.optype = "UPDATE";
                    ds = (DataSet)objBusinessLogic.SaveUpdateFormsEmailDetail(objDAEntities);
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Form mail detail updated successfully!!!";
                }
                ViewState["optype"] = "INSERT";
                BindFormDetails(0);
                ShowView();
                Clear();
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
            }
        }
        
       
        protected void dgFormMail_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            int FormMailid = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Update")
            {
                ShowAdd();
                lblMessage.Visible = false;
                DataSet ds = new DataSet();

                ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(FormMailid);

                txtMailTo.Text = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
                txtMailcc.Text = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]).Trim();
                if (ddlFormType.Items.FindByValue(Convert.ToString(ds.Tables[0].Rows[0]["FormType"])) != null)
                {
                    ddlFormType.ClearSelection();
                    ddlFormType.Items.FindByValue(ds.Tables[0].Rows[0]["FormType"].ToString()).Selected = true;
                }

                ViewState["FormMailid"] = FormMailid;
                ViewState["optype"] = "UPDATE";
            }
            ddlFormType.Enabled = false;
            //else if (e.CommandName == "Delete")
            //{
            //    DataSet ds = new DataSet();
            //    objDAEntities.optype = "DELETE";
            //    //int albumid = Convert.ToInt32(e.CommandArgument);
            //    // objDAEntities.Id = FormMailid;
            //    objBusinessLogic.DeleteFormsEmailDetail(FormMailid);
            //    lblMessage.Visible = true;
            //    lblMessage.CssClass = "successlbl";
            //    lblMessage.Text = "Form mail detail deleted successfully!!!";
            //    ViewState["optype"] = "INSERT";
            //}
            BindFormDetails(0);
        }
}
}