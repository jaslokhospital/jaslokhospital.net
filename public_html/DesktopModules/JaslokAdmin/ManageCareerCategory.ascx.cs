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
    public partial class ManageCareerCategory : PortalModuleBase
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
                BindPage();
                ViewState["FunctionId"] = 0;
                ViewState["optype"] = "INSERT";
            }
        }
         protected void dgCareer_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            objDAEntities.FunctionId = Convert.ToInt32(e.CommandArgument);
            ViewState["FunctionId"] = objDAEntities.FunctionId;

            if (e.CommandName == "Update")
            {
                ShowAdd();
                txtFunctionName.Text = e.Item.Cells[0].Text;

                string status = (e.Item.FindControl("ltstatus") as Literal).Text;

                ckbIsActive.Checked = status == "Yes";
                           
                ViewState["optype"] = "UPDATE";
                btnSubmit.Text = "Update";
            }
            else if (e.CommandName == "Delete")
            {
                DataSet ds = new DataSet();
                objDAEntities.optype = "DELETE";
                objBusinessLogic.UpdateDeleteCareerCategory(objDAEntities);
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Career category deleted successfully!!!";
               ViewState["optype"] = "INSERT";
            }
            BindPage();

            
        }

        public void Clear()
        {
            txtFunctionName.Text = "";
            ckbIsActive.Checked = false;            
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ShowView();
            Clear();
            lblMessage.Visible = false;
            btnSubmit.Text = "Save";
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                objDAEntities.FunctionId = (int)ViewState["FunctionId"];
                objDAEntities.FunctionName = txtFunctionName.Text;
                objDAEntities.UIsActive = ckbIsActive.Checked;
                lblMessage.Visible = true;
                if (ViewState["optype"].ToString() == "INSERT")
                {
                    objDAEntities.CreatedByUserID = CommonFn.UserID;
                    string msg = objBusinessLogic.SaveCareerCategory(objDAEntities);
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Career category added successfully!!!";
                }
                else if (ViewState["optype"].ToString() == "UPDATE")
                {
                    objDAEntities.optype = "UPDATE";
                    objDAEntities.UpdatedByUserID = CommonFn.UserID;
                    objBusinessLogic.UpdateDeleteCareerCategory(objDAEntities); 
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Career category Updated successfully!!!";
                }
                ViewState["optype"] = "INSERT";

               BindPage();
               ShowView();
               Clear();
                //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Data saved successfully!!!');", true);
               btnSubmit.Text = "Save";
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
               
            }
        }
        public void BindPage()
        {
            try
            {
                DataSet ds = new DataSet();
                ds = null;
                ds = (DataSet)objBusinessLogic.GetCareerCategoryDetails();


                if (ds.Tables[0].Rows.Count == 0)
                {
                    //Bind your grid here
                    lblempty.Visible = true;
                    dgCareer.Visible = false;

                }
                else
                {
                    lblempty.Visible = false;
                    dgCareer.Visible = true;
                    dgCareer.DataSource = ds;
                    dgCareer.DataBind();
                }
                
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
            }
        }
        protected void dgCareer_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
        {
            dgCareer.CurrentPageIndex = e.NewPageIndex;
            this.BindPage();
        }
        protected void btnAddJobCategory_Click(object sender, EventArgs e)
        {
             ShowAdd();
        }
        //protected void dgCareer_ItemDataBound(object sender, DataGridItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {

        //    }
        //}
}
}