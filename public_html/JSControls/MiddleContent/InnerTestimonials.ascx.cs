using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_InnerTestimonials : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindInnerTestimonials();           
        }
    }
    public void BindInnerTestimonials()
    {
        try
        {
            DataSet dsTestimonials = new DataSet();
            dsTestimonials = null;
            objDAEntities.optype = "Testimonial";
            dsTestimonials = (DataSet)objBusinessLogic.GetTestimonialByParm(objDAEntities);

            rptInnerTestimonials.DataSource = dsTestimonials;
            rptInnerTestimonials.DataBind();

        }
        catch (Exception ex)
        {

        }
    }

    protected void rptInnerTestimonials_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        /*Literal litTopDiv = (Literal)e.Item.FindControl("litTopDiv");
        Literal litBottomDiv = (Literal)e.Item.FindControl("litBottomDiv");*/

        if ((e.Item.ItemIndex + 1) % 3 == 0)
        {
            HtmlGenericControl divNewLine = (HtmlGenericControl)e.Item.FindControl("divNewLine");
            divNewLine.Visible = true;
        }
    }
}