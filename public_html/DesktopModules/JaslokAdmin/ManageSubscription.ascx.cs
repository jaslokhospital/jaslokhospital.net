using BusinessDataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ManageSubscription : System.Web.UI.UserControl
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.CssClass = "";
        lblMessage.Text = "";
        SubscriptionDoctor();
    }
    public void SubscriptionDoctor()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetJaslokTimesSubscription(txtSearch.Text.Trim());

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblempty.Visible = true;
                dgSubscription.Visible = false;
            }
            else
            {
                lblempty.Visible = false;
                dgSubscription.DataSource = ds;
                dgSubscription.DataBind();
            }


        }
        catch (Exception ex)
        {
        }
    }
    protected void dgSubscription_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        dgSubscription.CurrentPageIndex = e.NewPageIndex;
        SubscriptionDoctor();
    }
    protected void dgSubscription_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int Id = Convert.ToInt32(e.CommandArgument);
            objBusinessLogic.DeleteJaslokTimesSubscription(Id);
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Data deleted successfully!!!";
        }
        SubscriptionDoctor();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SubscriptionDoctor();
    }
}