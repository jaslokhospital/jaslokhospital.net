using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetNuke.Modules.JaslokAdmin
{
    public partial class ManageBookAppointment : PortalModuleBase
    {
        public BusinessLogic objBusinessLogic = new BusinessLogic();
        public DataAccessLogic objDALogic = new DataAccessLogic();
        public DataAccessEntities objDAEntities = new DataAccessEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindDoctor();
                //BindAppointment(0);
            }
        }
        private void bindDoctor()
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetDoctorIdName();

            drpDoctorName.DataValueField = "DoctorId";
            drpDoctorName.DataTextField = "Name";

            drpDoctorName.DataSource = ds;
            drpDoctorName.DataBind();
            drpDoctorName.Items.Insert(0, new ListItem("-Select-", "0"));
        }
        public void BindAppointment(int DId )
        {
            try
            {
                DataSet ds = new DataSet();
                ds = null;
                ds = (DataSet)objBusinessLogic.GetBookAppointment(DId);

                if (ds.Tables[0].Rows.Count == 0)
                {
                    //Bind your grid here
                    lblempty.Visible = true;
                    dgAppointment.Visible = false;

                }
                else
                {
                    lblempty.Visible = false;
                    dgAppointment.Visible = true;
                    dgAppointment.DataSource = ds;
                    dgAppointment.DataBind();
                }
                
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (drpDoctorName.SelectedValue != null)
            {

                int i = Convert.ToInt32(drpDoctorName.SelectedValue);
                BindAppointment(i);
            }
        }
        protected void dgAppointment_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
        {
            dgAppointment.CurrentPageIndex = e.NewPageIndex;
            this.BindAppointment(0);
        }
}
}