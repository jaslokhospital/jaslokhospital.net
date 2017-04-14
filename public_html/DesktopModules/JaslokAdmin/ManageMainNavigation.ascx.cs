using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessDataLayer;
using System.Data;

public partial class DesktopModules_JaslokAdmin_ManageMainNavigation : PortalModuleBase
{
    BusinessLogic objBusinessLogic = new BusinessLogic();
    List<MenuItems> lstMenuItem = new List<MenuItems>();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindMenuItem();
            BindPage();
        }
            //
        //}
    }

    public void BindMenuItem()
    {
        lstMenuItem = new List<MenuItems>();
        lstMenuItem = objBusinessLogic.GetAllMenuItems().Where(Q => Q.ParentId == 0).ToList();
        ddlParentMenuItem.DataSource = lstMenuItem;
        ddlParentMenuItem.DataValueField = "Id";
        drpParentItem.DataTextField = ddlParentMenuItem.DataTextField = "Name";
        ddlParentMenuItem.DataBind();
    }

    public void BindPage()
    {
        lstMenuItem = new List<MenuItems>();
        lstMenuItem = objBusinessLogic.GetAllMenuItems().Where(Q => Q.ParentId == Convert.ToInt32(ddlParentMenuItem.SelectedValue)).ToList();
        rptMenuItems.DataSource = lstMenuItem;
        rptMenuItems.DataBind();
    }
    protected void ddlParentMenuItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindPage();
        lblMessage.Visible = false;
    }
    protected void btnAddNewPage_Click(object sender, EventArgs e)
    {
        btnAdd.Text = "Add Page";
        ParentPageItem();
        pnlItemListing.Visible = false;
        pnlEditItem.Visible = true;
        lblMessage.Visible = false;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            MenuItems objMenuItem = new MenuItems();
            int ItemId = 0;
            int tabId = 0;
            int.TryParse(hdnPageId.Value, out ItemId);
            int.TryParse(hdnTabId.Value, out tabId);

            objMenuItem.Id = ItemId;
            objMenuItem.ParentId = Convert.ToInt32(drpParentItem.SelectedValue);
            objMenuItem.Name = txtPageName.Text.Trim();
            objMenuItem.Url = txtPageUrl.Text.Trim();
            objMenuItem.Published = chkPublished.Checked;
            if (ItemId > 0)
            {
                if (tabId > 0)
                {
                    objBusinessLogic.UpdateTabs(tabId, objMenuItem.Name, objMenuItem.Url);
                }
                objBusinessLogic.ManageMenuItem(objMenuItem);
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Page Data updated successfully";
            }
            else
            {
                objBusinessLogic.CreateTabWithModule(txtPageName.Text, txtPageUrl.Text);
                objBusinessLogic.ManageMenuItem(objMenuItem);
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "New Page Created Successfully";

            }
            Cache.Remove("MenuItemCache");
            Cache.Remove(AppGlobal.Cache_HeaderMenu);
            ddlParentMenuItem.SelectedValue = drpParentItem.SelectedValue;
            ClearContent();
        }
        catch (Exception ex)
        {
            lblMessage.Visible = true;
            lblMessage.CssClass = "errorlbl";
            lblMessage.Text = "Page with same name already exists!!";
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearContent();
        lblMessage.Visible = false;
    }
    protected void rptMenuItems_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.ToLower() == "editpage")
        {
            pnlItemListing.Visible = false;
            pnlEditItem.Visible = true;
            hdnPageId.Value = e.CommandArgument.ToString();
            ParentPageItem();
            BindPageData();
        }
        else if (e.CommandName.ToLower() == "deletepage")
        {
            int PageId = Convert.ToInt32(e.CommandArgument.ToString());
            MenuItems objItem = new MenuItems();
            objItem = objBusinessLogic.GetAllMenuItems().FirstOrDefault(Q => Q.Id == PageId);
            int TabId = objBusinessLogic.GetTabId(objItem.Name);
            if (TabId > 0)
            {
                objBusinessLogic.DeleteTab(TabId);
            }
            objBusinessLogic.DeleteMenuItem(PageId);
            lblMessage.Visible = true;
            Cache.Remove("MenuItemCache");
            Cache.Remove(AppGlobal.Cache_HeaderMenu);
            //BindMenuItem();
            BindPage();
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Page Deleted Successfully";
        }
    }

    public void BindPageData()
    {
        MenuItems objItem = new MenuItems();
        objItem = objBusinessLogic.GetAllMenuItems().FirstOrDefault(Q => Q.Id == Convert.ToInt32(hdnPageId.Value));
        if (objItem != null)
        {
            hdnTabId.Value = objBusinessLogic.GetTabId(objItem.Name).ToString();
            drpParentItem.SelectedValue = objItem.ParentId.ToString();
            txtPageName.Text = objItem.Name;
            txtPageUrl.Text = objItem.Url;
            chkPublished.Checked = objItem.Published;
            btnAdd.Text = "Update Page";
        }
    }

    public void ParentPageItem()
    {
        lstMenuItem = new List<MenuItems>();
        lstMenuItem = objBusinessLogic.GetAllMenuItems().Where(Q => Q.ParentId == 0).ToList();
        drpParentItem.DataSource = lstMenuItem;
        drpParentItem.DataValueField = "Id";
        drpParentItem.DataTextField = "Name";
        drpParentItem.DataBind();

        drpParentItem.SelectedValue = ddlParentMenuItem.SelectedValue;
    }

    public void ClearContent()
    {
        pnlItemListing.Visible = true;
        pnlEditItem.Visible = false;
        txtPageName.Text = string.Empty;
        txtPageUrl.Text = string.Empty;
        hdnPageId.Value = string.Empty;
        hdnPageId.Value = string.Empty;
        BindPage();
    }
}