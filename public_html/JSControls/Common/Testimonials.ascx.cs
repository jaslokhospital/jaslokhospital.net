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

public partial class JSControls_Common_Testimonials : System.Web.UI.UserControl
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
            BindTestinomial();
        //}
    }
    public void BindTestinomial()
    {
        try
        {
            DataSet dsTestimonials = new DataSet();
            dsTestimonials = null;
            objDAEntities.optype = "Home";
            dsTestimonials = (DataSet)Cache[AppGlobal.HomeTestimonialCache];
            if (dsTestimonials == null)
            {
                //Cache
                dsTestimonials = (DataSet)objBusinessLogic.GetTestimonialByParm(objDAEntities);
                Cache.Insert(AppGlobal.HomeTestimonialCache, dsTestimonials);
            }

            rptTestimonials.DataSource = dsTestimonials;
            rptTestimonials.DataBind();
            
        }
        catch (Exception ex)
        {

        }
    }
    protected void rptTestimonials_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Literal objltrComments = ((Literal)e.Item.FindControl("ltrComments"));

            string ltrComments = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "Comment"));
            string Name = Convert.ToString(DataBinder.Eval(e.Item.DataItem, "Name"));
            int Id = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "TestimonialId"));


            if (ltrComments.Length > 100)
            {
                objltrComments.Text = CommonFn.TrimString(Convert.ToString(ltrComments), 100) + "<a href=" + "/testimonial/" + CommonFn.RemoveSpecialCharacters(Name) + "/" + Id + ">....More</a>";
            }
            else
            {
                objltrComments.Text = Convert.ToString(ltrComments);
            }

        }
    }
}