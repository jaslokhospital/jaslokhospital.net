using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ManageHeaderTop : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindGrid();
    }
    protected void BindGrid()
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();

        ds.ReadXml(Server.MapPath("~/EmailTemlates/ManageHeaderTop.xml"));
        if (ds != null && ds.HasChanges())
        {
            gvContent.DataSource = ds;
            gvContent.DataBind();
        }
        else
        {
            gvContent.DataBind();
        }
    }

    protected void gvContent_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvContent.EditIndex = e.NewEditIndex;
        BindGrid();
    }
    protected void gvContent_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        BindGrid();
        DataSet ds = gvContent.DataSource as DataSet;
        ds.Tables[0].Rows[gvContent.Rows[e.RowIndex].DataItemIndex].Delete();
        ds.WriteXml(Server.MapPath("~/EmailTemlates/ManageHeaderTop.xml"));
        BindGrid();
    }
    protected void gvContent_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)gvContent.Rows[e.RowIndex];

        int i = gvContent.EditIndex;
        TextBox key = row.FindControl("txtkey") as TextBox;
        TextBox value = row.FindControl("txtvalue") as TextBox;

        gvContent.EditIndex = -1;
        BindGrid();

        DataSet ds = (DataSet)gvContent.DataSource;
        ds.Tables[0].Rows[i]["key"] = key.Text;
        ds.Tables[0].Rows[i]["value"] = value.Text;


        ds.WriteXml(Server.MapPath("~/EmailTemlates/ManageHeaderTop.xml"));
        BindGrid();
    }
    protected void gvContent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvContent.EditIndex = -1;
        BindGrid();
    }
    protected void gvContent_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvContent.PageIndex = e.NewPageIndex;
        BindGrid();
    }
}