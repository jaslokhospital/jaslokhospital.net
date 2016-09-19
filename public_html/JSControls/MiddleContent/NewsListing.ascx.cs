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
    int PageSize = 10;

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
            //DataSet dsrptNews = new DataSet();
            //dsrptNews = null;
            //objDAEntities.IsActive = true;
            //dsrptNews = (DataSet)objBusinessLogic.GetNewsDetails(objDAEntities);
            //rptNews.DataSource = dsrptNews;
            //rptNews.DataBind();
            DataSet dsrptNews = new DataSet();
            objDAEntities.IsActive = true;
            objDAEntities.jcPageSize = PageSize;
            objDAEntities.jcCurrentPageIndex = PagingControl.CurrentPage;
            dsrptNews = (DataSet)objBusinessLogic.GetNewsDetails(objDAEntities);

            if (dsrptNews.Tables[0].Rows.Count > 0)
            {
                rptNews.DataSource = dsrptNews;
                rptNews.DataBind();

                if (Convert.ToInt32(dsrptNews.Tables[0].Rows[0]["TotalRecord"]) <= PageSize)
                //if (TotalRecords <= PageSize)
                {
                    //divPAgerControl.Visible = false;
                    PagingControl.Visible = false;
                }
                else
                {
                    // divPAgerControl.Visible = true;
                    PagingControl.Visible = true;
                    PagingControl.PageSize = PageSize;
                    PagingControl.TotalRecordsCount = Convert.ToInt32(dsrptNews.Tables[0].Rows[0]["TotalRecord"]);
                    //PagerControls.TotalRecordsCount = TotalRecords;
                    PagingControl.BuildPages();
                }
            }
            else
            {
                //divPAgerControl.Visible = false;
                PagingControl.Visible = false;
                // divNoRecordFound.Visible = true;
            }


        }
        catch (Exception ex)
        {
            //Response.Write("Total Records : " + ex.ToString());
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
    protected override bool OnBubbleEvent(object source, EventArgs args)
    {
        CommandEventArgs e = (CommandEventArgs)args;

        if (e != null)
        {
            //Go to Next Page
            if (string.Equals(e.CommandName, "MoveNext", StringComparison.OrdinalIgnoreCase))
            {
                BindNews();
            }
            //Go to Previous Page
            else if (string.Equals(e.CommandName, "MovePrev", StringComparison.OrdinalIgnoreCase))
            {
                BindNews();
            }
            //Go to First Page
            else if (string.Equals(e.CommandName, "MoveFirst", StringComparison.OrdinalIgnoreCase))
            {
                BindNews();
            }
            //Go to Last Page
            else if (string.Equals(e.CommandName, "MoveLast", StringComparison.OrdinalIgnoreCase))
            {
                BindNews();
            }
            //Go to Page Number ...
            else if (string.Equals(e.CommandName, "GoToPage", StringComparison.OrdinalIgnoreCase))
            {
                BindNews();
            }
        }

        return base.OnBubbleEvent(source, e);
    }

}