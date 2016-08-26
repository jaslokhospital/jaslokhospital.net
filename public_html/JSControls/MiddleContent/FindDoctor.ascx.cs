
using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_FindDoctor : PortalModuleBase
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //lblDoctorId.Text = Request.QueryString["DoctorId"];
            objDAEntities.DoctorId = Convert.ToInt32(Request.QueryString["DoctorId"]);
            
           var ds= BindDoctorToPage(objDAEntities.DoctorId);
           lblName.Text = ds.Tables[0].Rows[0]["NAME"].ToString();
           lblMobileNo.Text = ds.Tables[0].Rows[0]["MobileNo"].ToString();
           lblPhoneNo.Text = ds.Tables[0].Rows[0]["PhoneNo"].ToString();
           lblEmailId.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
           lblDesignation.Text = ds.Tables[0].Rows[0]["Designation"].ToString();
           lblDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
           lblSpecialization.Text = ds.Tables[0].Rows[0]["Specialization"].ToString();
           lblImage.ImageUrl = ds.Tables[0].Rows[0]["ImageUrl"].ToString();
        }
        
    }

    public DataSet BindDoctorToPage(int DoctorId)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.DoctorId = DoctorId;
            ds = (DataSet)objBusinessLogic.GetDoctorDetailsForPage(objDAEntities.DoctorId);

           
            return ds;
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
}