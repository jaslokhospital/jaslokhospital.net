using BusinessDataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class JSControls_MiddleContent_NewsListing : System.Web.UI.UserControl
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            BindNews();
        }
    }
    public void BindNews()
    {
        try
        {
            DataSet dsrptNews = new DataSet();
            dsrptNews = null;
            objDAEntities.IsActive = true;
            dsrptNews = (DataSet)objBusinessLogic.GetNewsDetails(objDAEntities);
            rptNews.DataSource = dsrptNews;
            rptNews.DataBind();

        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    protected void rptNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        
        if ((e.Item.ItemIndex + 1) % 3 == 0)
        {
            HtmlGenericControl divNewLine = (HtmlGenericControl)e.Item.FindControl("divNewLine");
            divNewLine.Visible = true;
        }

       /* Literal litTopDiv = (Literal)e.Item.FindControl("litTopDiv");
        Literal litBottomDiv = (Literal)e.Item.FindControl("litBottomDiv");

        if ((e.Item.ItemIndex + 1) % 3 == 0)
        {
            litTopDiv.Visible = true;
            litBottomDiv.Visible = true;
        }*/

    }
}