using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class DesktopModules_JaslokAdmin_ManagePage : PortalModuleBase
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPageType();
            //BindPage(0);
            ViewState["pageid"] = 0;
            ViewState["optype"] = "INSERT";
            lblMessage.Visible = false;
        }
    }
    public void BindPageType()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;

            ds = (DataSet)objBusinessLogic.GetPageTabIdName();

            ddlPageType.DataValueField = "TabID";
            ddlPageType.DataTextField = "TabName";

            ddlPageType.DataSource = ds;
            ddlPageType.DataBind();
            ddlPageType.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    protected void dgPage_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        DataSet ds = new DataSet();
        ds = null;
        lblMessage.Visible = false;

        if (e.CommandName == "Update")
        {
            txtPageTitle.Text = e.Item.Cells[1].Text.Replace("&nbsp;", "");

            txtPageTitle.Text = e.Item.Cells[2].Text.Replace("&nbsp;", "");
            txtPageDesc.Text = e.Item.Cells[3].Text.Replace("&nbsp;", "");
            txtPageKeyword.Text = e.Item.Cells[4].Text.Replace("&nbsp;", "");
            int pageid = Convert.ToInt32(e.CommandArgument);


            ds = (DataSet)objBusinessLogic.GetPageDescription(pageid);

            if (ddlPageType.Items.FindByText(Convert.ToString(ds.Tables[0].Rows[0]["PageType"])) != null)
            {
                ddlPageType.ClearSelection();
                ddlPageType.Items.FindByText(Convert.ToString(ds.Tables[0].Rows[0]["PageType"])).Selected = true;
            }
            redPageContent.Content = ds.Tables[0].Rows[0]["Content"].ToString();

            ViewState["pageid"] = pageid;
            ViewState["optype"] = "UPDATE";

        }
        else if (e.CommandName == "Delete")
        {

            objDAEntities.optype = "DELETE";
            int pageid = Convert.ToInt32(e.CommandArgument);
            ViewState["pageid"] = pageid;
            objDAEntities.PageTypeId = pageid;

            ds = (DataSet)objBusinessLogic.UpdateDeletePage(objDAEntities);
            ViewState["optype"] = "DELETE";
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Page deleted successfully!!!";
            ViewState["optype"] = "INSERT";
            lblMessage.Visible = true;
        }
        //BindPage(0);

    }

    public void Clear()
    {
        ddlPageType.ClearSelection();
        ddlPageType.Enabled = true;
        txtPageDesc.Text = "";
        txtPageTitle.Text = "";
        txtPageKeyword.Text = "";
        redPageContent.Content = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
        lblMessage.Visible = false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.PageTypeId = (int)ViewState["pageid"];
            objDAEntities.PageType = ddlPageType.SelectedItem.Text;
            objDAEntities.PageTabId = Convert.ToInt32(ddlPageType.SelectedValue);
            objDAEntities.PageTitle = txtPageTitle.Text.Replace("&nbsp;", "");
            objDAEntities.PageDesc = txtPageDesc.Text.Replace("&nbsp;", "");
            objDAEntities.PageKeywords = txtPageKeyword.Text.Replace("&nbsp;", "");
            objDAEntities.Content = redPageContent.Content.Replace("&nbsp;", "");

            lblMessage.Visible = true;
            if (ViewState["optype"].ToString() == "INSERT")
            {
                objDAEntities.CreatedByUserID = CommonFn.UserID;
                ds = (DataSet)objBusinessLogic.SavePage(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Page Save successfully!!!";
            }
            else if (ViewState["optype"].ToString() == "UPDATE")
            {
                objDAEntities.UpdatedByUserID = CommonFn.UserID;
                objDAEntities.optype = "UPDATE";
                ds = (DataSet)objBusinessLogic.UpdateDeletePage(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Page updated successfully!!!";
            }
            Cache.Remove(ddlPageType.SelectedValue);

            ViewState["optype"] = "INSERT";
            // BindPage(0);
            Clear();
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    public void BindPage(int pageid)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.PageTabId = pageid;
            ds = (DataSet)objBusinessLogic.GetPageDetails(objDAEntities);

            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgPage.Visible = false;
            }
            else
            {
                lblempty.Visible = false;
                dgPage.Visible = true;
                dgPage.DataSource = ds;
                dgPage.DataBind();
            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    protected void dgPage_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgPage.CurrentPageIndex = e.NewPageIndex;
        this.BindPage(0);
        lblMessage.Visible = false;
    }
    protected void ddlPageType_SelectedIndexChanged(object sender, EventArgs e)
    {
        //BindPage(pageid);
        lblMessage.Visible = false;
        DataSet ds = new DataSet();
        ds = null;
        int pageid = Convert.ToInt32(ddlPageType.SelectedValue);
        ds = (DataSet)objBusinessLogic.GetPageDescription(pageid);

        //if (ddlPageType.Items.FindByText(Convert.ToString(ds.Tables[0].Rows[0]["PageType"])) != null)
        //{
        //    ddlPageType.ClearSelection();
        //    ddlPageType.Items.FindByText(Convert.ToString(ds.Tables[0].Rows[0]["PageType"])).Selected = true;
        //}
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtPageTitle.Text = ds.Tables[0].Rows[0]["PageTitle"].ToString();
            txtPageDesc.Text = ds.Tables[0].Rows[0]["PageDescription"].ToString();
            txtPageKeyword.Text = ds.Tables[0].Rows[0]["PageKeywords"].ToString();
            redPageContent.Content = ds.Tables[0].Rows[0]["CONTENT"].ToString();
            ViewState["pageid"] = pageid;
            ViewState["optype"] = "UPDATE";
        }


    }
}