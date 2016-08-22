using DotNetNuke.Entities.Modules;
using BusinessDataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class DesktopModules_JaslokAdmin_ManageVideoGallery : PortalModuleBase
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
            BindVideo(0);
            BindAlbum();
            ViewState["videoid"] = 0;
            ViewState["optype"] = "INSERT";
        }
    }
    byte[] buffer;
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (UploadVideo.HasFile && UploadVideo.PostedFile != null && UploadVideo.PostedFile.FileName != "")
            {
                listofuploadedfiles.Text = SaveVideo();
            }
            else
            {
                listofuploadedfiles.Text = hdnImagePath.Value.TrimStart('~');
            }

            if (UploadVideoThumbnail.HasFile && UploadVideoThumbnail.PostedFile != null && UploadVideoThumbnail.PostedFile.FileName != "")
            {
                lblUploadThumbnail.Text = SaveImage(UploadVideoThumbnail);
            }
            else
            {
                lblUploadThumbnail.Text = hdnThumbnailPath.Value.TrimStart('~');
            }
            objDAEntities.VideoUrl = listofuploadedfiles.Text;
            objDAEntities.ImageUrl = lblUploadThumbnail.Text;


            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.VideoId = (int)ViewState["videoid"];
            objDAEntities.VideoTitle = "";
            //objDAEntities.VideoDesc = txtVideoDesc.Content;
            //objDAEntities.VideoUrl = hdnImagePath.Value;
            objDAEntities.AlbumID = Convert.ToInt32(ddlAlbum.SelectedValue);
           
            if (ViewState["optype"].ToString() == "INSERT")
            {
                objDAEntities.CreatedByUserID = CommonFn.UserID;
                ds = (DataSet)objBusinessLogic.SaveVideo(objDAEntities);
                Clear();
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Video added successfully!!!";
            }
            else if (ViewState["optype"].ToString() == "UPDATE")
            {
                objDAEntities.UpdatedByUserID = CommonFn.UserID;
                objDAEntities.optype = "UPDATE";
                ds = (DataSet)objBusinessLogic.UpdateDeleteVideo(objDAEntities);
                Clear();
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Video updated successfully!!!";
            }
            ViewState["optype"] = "INSERT";
            BindVideo(0);
            ShowView();
          
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



    public void BindAlbum()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetAlbumDetails();

            ddlAlbum.DataValueField = "AlbumId";
            ddlAlbum.DataTextField = "AlbumTitle";

            ddlAlbum.DataSource = ds;
            ddlAlbum.DataBind();
            ddlAlbum.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        catch (Exception ex)
        {

        }
    }
    public void BindVideo(int id)
    {
        try
        {

            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.VideoId = id;
            ds = (DataSet)objBusinessLogic.GetVideoDetails(objDAEntities);

            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgVideo.Visible = false;

            }
            else
            {
                lblempty.Visible = false;
                dgVideo.Visible = true;
                dgVideo.DataSource = ds;
                dgVideo.DataBind();
            }


        }
        catch (Exception ex)
        {

        }
    }

    protected void dgVideo_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        lblMessage.Visible = false;
        if (e.CommandName == "Update")
        {
            ShowAdd();
            DataSet ds = new DataSet();
            int videoid = Convert.ToInt32(e.CommandArgument);
            objDAEntities.VideoId = videoid;
            ds = (DataSet)objBusinessLogic.GetVideoDetails(objDAEntities);

            //txtVideoTitle.Text = ds.Tables[0].Rows[0]["VideoTitle"].ToString();
            //txtVideoDesc.Content = ds.Tables[0].Rows[0]["VideoDescription"].ToString();

            if (ddlAlbum.Items.FindByValue(ds.Tables[0].Rows[0]["AlbumID"].ToString()) != null)
            {
                ddlAlbum.ClearSelection();
                ddlAlbum.Items.FindByValue(ds.Tables[0].Rows[0]["AlbumID"].ToString()).Selected = true;
            }


            hdnImagePath.Value = ds.Tables[0].Rows[0]["VideoUrl"].ToString();
            listofuploadedfiles.Text = ds.Tables[0].Rows[0]["VideoUrl"].ToString().Replace("/Content/VideoGallery/", "");
            hdnThumbnailPath.Value = ds.Tables[0].Rows[0]["VideoThumbnail"].ToString();
            lblUploadThumbnail.Text = ds.Tables[0].Rows[0]["VideoThumbnail"].ToString().Replace("/Content/VideoThumbnailGallery/", "");


            reqVideo.Visible = false;
            rfvImgupload.Visible = false;
            ViewState["videoid"] = videoid;
            ViewState["optype"] = "UPDATE";
        }
        else if (e.CommandName == "Delete")
        {
            DataSet ds = new DataSet();
            objDAEntities.optype = "DELETE";
            int videoid = Convert.ToInt32(e.CommandArgument);
            objDAEntities.VideoId = videoid;
            ds = (DataSet)objBusinessLogic.UpdateDeleteVideo(objDAEntities);
            lblMessage.Visible = true;
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Video deleted successfully!!!";
            ViewState["optype"] = "INSERT";

        }

        BindVideo(0);

    }
    public void Clear()
    {
        //txtVideoTitle.Text = "";
        //txtVideoDesc.Content = "";
        ddlAlbum.ClearSelection();
        listofuploadedfiles.Text = "";
        lblUploadThumbnail.Text = "";
        //listofuploadedfiles.Text = "No file selected";
        hdnImagePath.Value = null;
        hdnThumbnailPath.Value = null;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ShowView();
        Clear();
        lblMessage.Visible = false;
    }
    protected string SaveVideo()
    {
        string strDBImagePath = string.Empty;
        try
        {
            if (UploadVideo.HasFile && UploadVideo.PostedFile != null && UploadVideo.PostedFile.FileName != "")
            {
                HttpPostedFile file = UploadVideo.PostedFile;
                buffer = new byte[file.ContentLength];

                int bytesReaded = file.InputStream.Read(buffer, 0, UploadVideo.PostedFile.ContentLength);
                if (bytesReaded > 0)
                {

                    string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
                    string strSaveImagePath = string.Empty;
                    string fileName = Path.GetFileName(UploadVideo.PostedFile.FileName);

                    string FileNameWEx = Path.GetFileNameWithoutExtension(fileName);

                    FileNameWEx = objDAEntities.RemoveBadCharForFolder(FileNameWEx);

                    String FileExtension = System.IO.Path.GetExtension(fileName);
                    //listofuploadedfiles.Text = fileName;


                    string FolderName = CommonFn.VideoGalleryFolder;

                    // string strFileNameOnly = CommonFn.GetFileName(fileName);
                    strSaveImagePath = strServerPath + FolderName + "\\" + FileNameWEx + FileExtension;
                    UploadVideo.SaveAs(strSaveImagePath);

                    strDBImagePath = CommonFn.DbSave + CommonFn.DbVideoGalleryFolder;
                    strDBImagePath = strDBImagePath + FileNameWEx + FileExtension;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Images size is more than 820Kb=839948 !!!');", true);
                }
            }

            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Images size is more than 1.035 mb!!!');", true);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return strDBImagePath;
    }


    protected string SaveImage(FileUpload fUpload)
    {
        string strDBImagePath = string.Empty;
        try
        {
            string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
            string strSaveImagePath = string.Empty;
            string fileName = fUpload.PostedFile.FileName;

            string FileNameWEx = Path.GetFileNameWithoutExtension(fileName);
            FileNameWEx = objDAEntities.RemoveBadCharForFolder(FileNameWEx);
            String FileExtension = System.IO.Path.GetExtension(fileName);

            // string strFileNameOnly = FileNameWEx + FileExtension;

            string FolderName = CommonFn.VideoThumbnailFolder;

            string strFileNameOnly = FileNameWEx + FileExtension;

            strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly;

            fUpload.SaveAs(strSaveImagePath);

            strDBImagePath = CommonFn.DbSave + CommonFn.DbVideoThumbnailFolder;
            strDBImagePath = strDBImagePath + "/" + strFileNameOnly;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return strDBImagePath;
    }


    protected void dgVideo_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgVideo.CurrentPageIndex = e.NewPageIndex;
        this.BindVideo(0);
    }
    protected void btnAddJaslokTimes_Click(object sender, EventArgs e)
    {
        ShowAdd();

    }
}