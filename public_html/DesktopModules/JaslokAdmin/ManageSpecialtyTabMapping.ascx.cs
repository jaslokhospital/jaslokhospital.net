using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class DesktopModules_JaslokAdmin_ManageSpecialtyTabMapping : PortalModuleBase
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSpeciltyCategory();
            BindTabs();
            BindPage();
            ViewState["Specialtyid"] = 0;
            ViewState["optype"] = "UpdateTabs";
            btnSubmit.Text = "Save";
        }
        objDAEntities.SelectTabId = "";
    }
    protected void BindSpeciltyCategory()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetSpecialtyCategoryDetails();

            drpspecialCategory.DataValueField = "CategoryId";
            drpspecialCategory.DataTextField = "CategoryName";


            drpspecialCategory.DataSource = ds;
            drpspecialCategory.DataBind();
            drpspecialCategory.Items.Insert(0, new ListItem("-Select-", "0"));

        }
        catch
        {
        }
    }
    protected void BindTabs()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetTabsDetails();

            lbSpecialtytabs.DataValueField = "TabId";
            lbSpecialtytabs.DataTextField = "TabName";


            lbSpecialtytabs.DataSource = ds;
            lbSpecialtytabs.DataBind();
            lbSpecialtytabs.Items.Insert(0, new ListItem("-Select-", "0"));

        }
        catch
        {
        }
    }

    private void bindSpecialty()
    {
        DataSet ds = new DataSet();
        ds = null;
        objDAEntities.CategoryId = Convert.ToInt32(drpspecialCategory.SelectedValue);
        ds = (DataSet)objBusinessLogic.GetSpecialtiesById(objDAEntities);

        drpSpecilty.DataValueField = "SpecialtyId";
        drpSpecilty.DataTextField = "SpecialtyName";

        drpSpecilty.DataSource = ds;
        drpSpecilty.DataBind();
        drpSpecilty.Items.Insert(0, new ListItem("-Select-", "0"));
    }

    protected void drpspecialCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        drpSpecilty.Enabled = true;
        drpSpecilty.Items.Clear();
        try
        {
            bindSpecialty();
        }
        catch (Exception ex)
        {
        }
    }
    public void Clear()
    {
        drpspecialCategory.ClearSelection();
        drpSpecilty.ClearSelection();
        lbSpecialtytabs.ClearSelection();
        drpspecialCategory.Enabled = true;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt32(lbSpecialtytabs.SelectedValue) > 0)
            {
                foreach (ListItem li in lbSpecialtytabs.Items)
                {
                    if (li.Selected)
                    {
                        objDAEntities.SelectTabId = objDAEntities.SelectTabId + li.Value + ",";
                    }
                }
                DataSet ds = new DataSet();
                ds = null;
                objDAEntities.SpecialtyId = Convert.ToInt32(drpSpecilty.SelectedValue);
                objDAEntities.CategoryId = Convert.ToInt32(drpspecialCategory.SelectedValue);

                if (ViewState["optype"].ToString() == "UpdateTabs")
                {
                    objDAEntities.optype = "UpdateTabs";
                    objBusinessLogic.UpdateDeleteSpecialties(objDAEntities);
                    drpSpecilty.Enabled = false;
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Data saved successfully!!!');", true);
                }

                BindPage();
                Clear();
                btnSubmit.Text = "Save";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please select tabs first!!!');", true);
            }
        }
        catch (Exception ex)
        {
          ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something went wrong!!!');", true);
        }
    }
    protected void dgSpecialtyTab_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            btnSubmit.Text = "Update";
            drpSpecilty.Enabled = true;
            if (drpspecialCategory.Items.FindByText(e.Item.Cells[1].Text) != null)
            {
                drpspecialCategory.ClearSelection();
                drpspecialCategory.Items.FindByText(e.Item.Cells[1].Text).Selected = true;
            }
            bindSpecialty();
            if (drpSpecilty.Items.FindByText(e.Item.Cells[2].Text) != null)
            {
                drpSpecilty.ClearSelection();
                drpSpecilty.Items.FindByText(e.Item.Cells[2].Text).Selected = true;
            }
            drpspecialCategory.Enabled = false;
            drpSpecilty.Enabled = false;
            string TabName = e.Item.Cells[3].Text;

            string[] TabArray = TabName.Split(',');
            foreach (object obj in TabArray)
            {
                if (lbSpecialtytabs.Items.FindByText(Convert.ToString(obj).Trim()) != null)
                    lbSpecialtytabs.Items.FindByText(Convert.ToString(obj).Trim()).Selected = true;
            }

            int Specialtyid = Convert.ToInt32(e.CommandArgument);
            ViewState["Specialtyid"] = Specialtyid;
            ViewState["optype"] = "UpdateTabs";
        }
        else if (e.CommandName == "Delete")
        {
            objDAEntities.optype = "DELETE";
            int Specialtyid = Convert.ToInt32(e.CommandArgument);
            ViewState["Specialtyid"] = Specialtyid;
            objDAEntities.SpecialtyId = Specialtyid;

            objBusinessLogic.UpdateDeleteSpecialties(objDAEntities);
            ViewState["optype"] = "DELETE";
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record deleted successfully!!!');", true);
            ViewState["optype"] = "INSERT";
        }
        BindPage();

    }
    public void BindPage()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetSpecialtyTabMapDetails();

            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgSpecialtyTabs.Visible = false;

            }
            else
            {
                lblempty.Visible = false;
                dgSpecialtyTabs.Visible = true;
                dgSpecialtyTabs.DataSource = ds;
                dgSpecialtyTabs.DataBind();
            }
           
        }
        catch (Exception ex)
        {

        }
    }
    protected void dgSpecialtyTabs_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgSpecialtyTabs.CurrentPageIndex = e.NewPageIndex;
        this.BindPage();
    }

}