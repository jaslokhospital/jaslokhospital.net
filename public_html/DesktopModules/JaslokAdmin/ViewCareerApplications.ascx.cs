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

public partial class DesktopModules_JaslokAdmin_ViewCareerApplications : PortalModuleBase
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            BindApp();
        }

    }

    public void BindApp()
    {
        try
        {
            
            objDAEntities.JobId = 0;
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetCareerApplicationDetails(objDAEntities);


            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgApplication.Visible = false;

            }
            else
            {
                lblempty.Visible = false;
                dgApplication.Visible = true;
                dgApplication.DataSource = ds;
                dgApplication.DataBind();
            }
            dgApplication.Columns[9].Visible = true;
           
            dgApplication.Columns[9].Visible = false;
        }
        catch (Exception ex)
        {

        }
    }
    public void BindAppDT(int id)
    {
        try
        {
            objDAEntities.CareerAppId = id;
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetCareerApplicationDetails(objDAEntities);

            //dtvApp.DataSource = ds;
            //dtvApp.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    protected void dgApplication_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {

            int appid = (int)dgApplication.DataKeys[e.Item.ItemIndex];
            //BindAppDT(appid);
            ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "showpopup();", true);

        }
        else if (e.CommandName == "Resume")
        {
            
            if (e.Item.Cells[9].Text.Trim() != "")
            {
                string Resume_Path = ConfigurationManager.AppSettings["PathResume"].ToString();
                string strpth = Server.MapPath(Resume_Path + "//" + e.Item.Cells[9].Text.Trim());


                System.IO.FileInfo file = new System.IO.FileInfo(strpth);

                if (file.Exists)
                {

                    Response.Clear();

                    Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);

                    Response.AddHeader("Content-Length", file.Length.ToString());

                    Response.ContentType = "application/octet-stream";

                    Response.WriteFile(file.FullName);

                    Response.End();

                }

                else
                {

                    Response.Write("This file does not exist.");

                }

            }
        }
    }
    protected void dgApplication_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgApplication.CurrentPageIndex = e.NewPageIndex;
        this.BindApp();
    }
}