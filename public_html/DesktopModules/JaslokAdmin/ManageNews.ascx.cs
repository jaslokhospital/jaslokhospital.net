using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ManageNews : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    public void ShowAdd()
    {
        plcView.Visible = false;
        plcAdd.Visible = true;
        Clear();
    }
    public void ShowView()
    {
        plcView.Visible = true;
        plcAdd.Visible = false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindNews(objDAEntities);
            ViewState["Newsid"] = 0;
            ViewState["optype"] = "INSERT";
            //objDAEntities.NewId = (int)ViewState["Newsid"];
           
        }

    }
    protected void dgNews_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        lblMessage.Visible = false;

            DataSet ds = new DataSet();
            ds = null;
            if (e.CommandName == "Update")
            {
                ShowAdd();
                int newsid = Convert.ToInt32(e.CommandArgument);
                objDAEntities.NewId = newsid;
                ds = (DataSet)objBusinessLogic.GetNewsDetails(objDAEntities);

                txtNewsTitle.Text = Convert.ToString(ds.Tables[0].Rows[0]["NewsTitle"]);
                txtNewsDate.SelectedDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["NewsDate"]);

                //if (Convert.ToString(ds.Tables[0].Rows[0]["isActive"]) == "True")
                //{
                
                //}
                //else
                //{
                //    chkActive.Checked = false;
                //}
                chkActive.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["isActive"]);
                //txtNewsContent.Content = Convert.ToString(ds.Tables[0].Rows[0]["NewsContent"]);
                hdnThumbnail.Value = Convert.ToString(ds.Tables[0].Rows[0]["Thumbnail"]);
                listofuploadedfiles.Text = Convert.ToString(ds.Tables[0].Rows[0]["Thumbnail"]).Replace("/Content/JaslokNews/", "");
                ViewState["Newsid"] = newsid;
                ViewState["optype"] = "UPDATE";
                 btnSubmit.Text = "Update";
                 lblMessage.Visible = true;
                 lblMessage.CssClass = "successlbl";
                 lblMessage.Text = "News updated successfully!!!";

         }
        else if (e.CommandName == "Delete")
        {
            objDAEntities.optype = "DELETE";
            int newsid = Convert.ToInt32(e.CommandArgument);
            ViewState["Newsid"] = newsid;
            objDAEntities.NewId = newsid;

            objBusinessLogic.AddEditDeleteNews(objDAEntities);
            Cache.Remove(AppGlobal.HomePressReleaseCache);
            ViewState["optype"] = "DELETE";
            
            ViewState["optype"] = "INSERT";
            Clear();
            lblMessage.Visible = true;
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "News deleted successfully!!!";
        }
        BindNews(objDAEntities);

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            objDAEntities.optype = ViewState["optype"].ToString();
            objDAEntities.NewId = (int)ViewState["Newsid"];
            objDAEntities.NewsTitle = txtNewsTitle.Text;
            objDAEntities.NewsDate = DateTime.Parse(txtNewsDate.SelectedDate.ToString());
            //objDAEntities.NewsContent = txtNewsContent.Content.Replace("&nbsp;", "");
            objDAEntities.CreatedBy = "1";

            //if (UploadImages.PostedFile.FileName != "" || UploadImages.PostedFile.FileName != null)
            if (!string.IsNullOrEmpty(UploadImages.PostedFile.FileName))
            {
                if(string.IsNullOrEmpty(hdnThumbnail.Value))
                {
                hdnThumbnail.Value = SaveImage(UploadImages);
                }
            }
            

            if (chkActive.Checked == true)
            {
                objDAEntities.NewsIsActive = true;
            }
            else
            {
                objDAEntities.NewsIsActive = false;
            }
            lblMessage.Visible = true;

            objDAEntities.Thumbnail = hdnThumbnail.Value;

            if (ViewState["optype"].ToString() == "INSERT")
            {
                objDAEntities.CreatedByUserID = CommonFn.UserID;
                objBusinessLogic.AddEditDeleteNews(objDAEntities);

                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "News added successfully!!!";
            }
            else if (ViewState["optype"].ToString() == "UPDATE")
            {
                objDAEntities.UpdatedByUserID = CommonFn.UserID;
                objDAEntities.optype = "UPDATE";
                objBusinessLogic.AddEditDeleteNews(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "News updated successfully!!!";
            }

            Cache.Remove(AppGlobal.HomePressReleaseCache);

            ViewState["optype"] = "INSERT";
            BindNews(objDAEntities);
            ShowView();
            Clear();

            btnSubmit.Text = "Save";
        }
        catch (Exception ex)
        {
         // Response.Write(ex.Message.ToString()+ex.StackTrace.ToString());
        }
    }
    protected string SaveImage(FileUpload fUpload)
    {
        string strDBImagePath = string.Empty;
        try
        {
            string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
            string strSaveImagePath = string.Empty;
            string fileName = fUpload.PostedFile.FileName;

            string FolderName = CommonFn.JaslokNews;

            string strFileNameOnly = CommonFn.GetFileName(fileName);

            strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly;

            fUpload.SaveAs(strSaveImagePath);

            strDBImagePath = CommonFn.DbSave + CommonFn.DbJaslokNewsFolder;
            strDBImagePath = strDBImagePath + strFileNameOnly;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return strDBImagePath;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ShowView();
        Clear();
        lblMessage.Visible = false;
        chkActive.Checked = false;
    }
    public void Clear()
    {
        txtNewsTitle.Text = "";
        txtNewsDate.SelectedDate = null;
       // txtNewsContent.Content = null;
        chkActive.Checked = false;
        hdnThumbnail.Value = null;
        listofuploadedfiles.Text = null;
    }
    public void BindNews(DataAccessEntities Slist)
    {
        try
        {
            objDAEntities.NewId = 0;
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetNewsDetails(objDAEntities);


            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgNews.Visible = false;

            }
            else
            {
                lblempty.Visible = false;
                dgNews.Visible = true;
                dgNews.DataSource = ds;
                dgNews.DataBind();
            }
            
        }
        catch (Exception ex)
        {

        }
    }
    //protected void dgNews_ItemDataBound(object sender, DataGridItemEventArgs e)   
    //{
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
    //    {
    //        if (e.Item.Cells[3].Text == "True")
    //        {
    //            e.Item.Cells[3].Text = "Yes";
    //        }
    //        else
    //        {
    //            e.Item.Cells[3].Text = "No";
    //        }
    //    }
    //}
    protected void dgNews_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgNews.CurrentPageIndex = e.NewPageIndex;
        this.BindNews(objDAEntities);
    }
    protected void btnAddHeltip_Click(object sender, EventArgs e)
    {
        ShowAdd();
    }
}