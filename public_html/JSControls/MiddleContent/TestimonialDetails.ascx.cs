using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_TestimonialDetails : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["TID"] != null)
            {
                BindTestimonials();
            }
        }
    }
    public void BindTestimonials()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            int id =Convert.ToInt32(Request.QueryString["TID"]);
            objDAEntities.TestimonialId = id;
            ds = (DataSet)objBusinessLogic.GetTestimonialByParm(objDAEntities);
            if (ds.Tables[0].Rows.Count > 0)
            {
                h4testimonialName.InnerHtml = ds.Tables[0].Rows[0]["Name"].ToString();
                imgTestimonialD.ImageUrl = string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ProfileImageUrl"].ToString()) ? CommonFn.DefaultImagePath : ds.Tables[0].Rows[0]["ProfileImageUrl"].ToString();
                pTestimonial.InnerHtml = ds.Tables[0].Rows[0]["Comment"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["ImageUrl"].ToString()) && string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Comment"].ToString()))
                {
                    imgTestimonial.Visible = true;
                    imgTestimonial.ImageUrl = ds.Tables[0].Rows[0]["ImageUrl"].ToString();

                }
            }
             
           
                
            //rptInnerTestimonials.DataSource = dsTestimonials;
            //rptInnerTestimonials.DataBind();

        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
   
}