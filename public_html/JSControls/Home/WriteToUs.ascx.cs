using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_Home_WriteToUs : PortalModuleBase
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkbtn_Click(object sender, EventArgs e)
    {
        if (radioWTU.SelectedValue == "feedback")
        {
            Response.Redirect("~/Feedback.aspx?Name=" + txtname.Text.Trim() + "&EmailId=" + txtemail.Text.Trim());
        }
        else
        {
            Response.Redirect("~/complaint.aspx?Name=" + txtname.Text.Trim() + "&EmailId=" + txtemail.Text.Trim());

        }
    }
    protected void df_SelectedIndexChanged(object sender, EventArgs e)
    {
        int iSelectedIndex = radioWTU.SelectedIndex;
        if (iSelectedIndex == -1)
            return;
        for (int iIndex = 0; iIndex < radioWTU.Items.Count; iIndex++)
            radioWTU.Items[iIndex].Selected = false;
        radioWTU.Items[iSelectedIndex].Selected = true;
    }
    protected void radioWTU_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}