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
    public partial class ManageSpecialityClinicsOPD : PortalModuleBase
    {
        public BusinessLogic objBusinessLogic = new BusinessLogic();
        public DataAccessLogic objDALogic = new DataAccessLogic();
        public DataAccessEntities objDAEntities = new DataAccessEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               BindDoctor();
               BindSpecialityClinicOPD();
               ViewState["SpecialityClinicId"] = 0;
                ViewState["optype"] = "INSERT";
            }
        }
        private void BindDoctor()
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetDoctorIdName();
            lbDoctortabs.DataValueField = "DoctorId";
            lbDoctortabs.DataTextField = "Name";

            lbDoctortabs.DataSource = ds;
            lbDoctortabs.DataBind();
        }
        private void BindSpecialityClinicOPD()
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetSpecialityClinicOPD();
            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgSpecialityClinics.Visible = false;

            }
            else
            {
                lblempty.Visible = false;
                dgSpecialityClinics.Visible = true;
                dgSpecialityClinics.DataSource = ds;
                dgSpecialityClinics.DataBind();
            }
          
        }   
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (lbDoctortabs.SelectedValue != "")
                {
                    if (Convert.ToInt32(lbDoctortabs.SelectedValue) > 0)
                    {
                        foreach (ListItem li in lbDoctortabs.Items)
                        {
                            if (li.Selected)
                            {
                                objDAEntities.SelectTabId = objDAEntities.SelectTabId + li.Value + ",";
                            }
                        }
                    }
                    objDAEntities.SelectTabId.Trim(',');
                }
                else
                {
                    objDAEntities.SelectTabId = null;
                }
                
                DataSet ds = new DataSet();
                ds = null;
                objDAEntities.SpecialityClinicId = (int)ViewState["SpecialityClinicId"];

                objDAEntities.SpecialtyName = txtSpecialityClinics.Text;

                objDAEntities.IsApproved = ckbIsActive.Checked;


                lblMessage.Visible = true;
                if (ViewState["optype"].ToString() == "INSERT")
                {
                    objDAEntities.SpecialityClinicId = 0;
                    objDAEntities.optype = "INSERT";
                    string msg = objBusinessLogic.SaveUpdateSpecialityClinicOPD(objDAEntities);
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Data Save successfully!!!";
                }
                else if (ViewState["optype"].ToString() == "UPDATE")
                {
                    objDAEntities.optype = "UPDATE";
                    string msg = objBusinessLogic.SaveUpdateSpecialityClinicOPD(objDAEntities);
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Data Updated successfully!!!";
                }
                ViewState["optype"] = "INSERT";
                BindSpecialityClinicOPD();
                Clear();
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
            }
        }
        protected void dgSpecialityClinics_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            
            if (e.CommandName == "Update")
            {
                btnSubmit.Text = "Update";
                txtSpecialityClinics.Text=e.Item.Cells[1].Text;
                string TabName = e.Item.Cells[2].Text;
                string[] TabArray = TabName.Split(',');
                foreach (object obj in TabArray)
                {
                    if (lbDoctortabs.Items.FindByText(Convert.ToString(obj).Trim()) != null)
                        lbDoctortabs.Items.FindByText(Convert.ToString(obj).Trim()).Selected = true;
                }
                if (e.Item.Cells[3].Text == "True")
                {
                    ckbIsActive.Checked = true;
                }

                int SpecialityClinicId = Convert.ToInt32(e.CommandArgument);
                ViewState["SpecialityClinicId"] = SpecialityClinicId;
                objDAEntities.SpecialityClinicId = SpecialityClinicId;
                ViewState["optype"] = "UPDATE";
                objDAEntities.optype = "UPDATE";              
            }
            else if (e.CommandName == "Delete")
            {
                DataSet ds = new DataSet();
                objDAEntities.optype = "DELETE";
               
                int SpecialityClinicId = Convert.ToInt32(e.CommandArgument);
                ViewState["SpecialityClinicId"] = SpecialityClinicId;
                objDAEntities.SpecialityClinicId = SpecialityClinicId;
                objBusinessLogic.SaveUpdateSpecialityClinicOPD(objDAEntities);
            
                //objBusinessLogic.DeleteHomeSlider(objDAEntities);
                ViewState["optype"] = "DELETE";
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Data deleted successfully!!!";
                ViewState["optype"] = "INSERT";
            }
            BindSpecialityClinicOPD();
        }
        public void Clear()
        {
            txtSpecialityClinics.Text = "";
            lbDoctortabs.ClearSelection();
            ckbIsActive.Checked = false;
            btnSubmit.Text = "Save";
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
            lblMessage.Visible = false;
        }
        protected void dgSpecialityClinics_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
        {
            dgSpecialityClinics.CurrentPageIndex = e.NewPageIndex;
            this.BindSpecialityClinicOPD();
        }
       
    }
}