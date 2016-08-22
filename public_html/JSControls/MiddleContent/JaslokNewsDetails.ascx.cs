using BusinessDataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_JaslokNewsDetails : System.Web.UI.UserControl
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["newsid"] != null)
            {
                BindNews();
            }
        }
    }
    public void BindNews()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            int id = Convert.ToInt32(Request.QueryString["newsid"]);
            objDAEntities.NewId = id;
            ds = (DataSet)objBusinessLogic.GetNewsDetails(objDAEntities);
            if (ds.Tables[0].Rows.Count > 0)
            {
                h4Title.InnerHtml = ds.Tables[0].Rows[0]["NewsTitle"].ToString();
                if (!string.IsNullOrEmpty(Convert.ToString(ds.Tables[0].Rows[0]["NewsContent"])))
                    pContents.InnerHtml = ds.Tables[0].Rows[0]["NewsContent"].ToString();
                else
                {
                    imgTestimonial.ImageUrl = Convert.ToString(ds.Tables[0].Rows[0]["Thumbnail"]);
                    imgTestimonial.Visible = true;
                }
                //divNewsDate.InnerHtml = ds.Tables[0].Rows[0]["NewsDate"].ToString();
            }
            else
                pContents.InnerHtml = "No record found";
        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
        }
    }
}