using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ViewSeminarEntries : PortalModuleBase
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            BindSeminar();
        }
    }

    public void BindSeminar()
    {
        try
        {
            objDAEntities.seminarEnryId = 0;
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetSeminarEntries(objDAEntities);

            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgSeminarEntries.Visible = false;

            }
            else
            {
                lblempty.Visible = false;
                dgSeminarEntries.Visible = true;
                dgSeminarEntries.DataSource = ds;
                dgSeminarEntries.DataBind();
            }

           

        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    public void BindSeminarDtl(int id)
    {
        try
        {
            objDAEntities.seminarEnryId = id;
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetSeminarEntries(objDAEntities);

            SeminarDetailsView.DataSource = ds;
            SeminarDetailsView.DataBind();
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    protected void dgSeminarEntries_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgSeminarEntries.CurrentPageIndex = e.NewPageIndex;
        this.BindSeminar();
    }
    protected void dgSeminarEntries_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "TITLE")
        {

            int seminarid = (int)dgSeminarEntries.DataKeys[e.Item.ItemIndex];
            BindSeminarDtl(seminarid);
            ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "ViewDetail();", true);

        }
    }
}