using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ManagePhotoGallery : PortalModuleBase
{
    
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
                BindAlbum();
                BindPhoto(0);
              
                ViewState["photoid"] = 0;
                ViewState["optype"] = "INSERT";               
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (UploadImages.PostedFile.FileName != "")
                {
                    listofuploadedfiles.Text = SaveImage();
                }
                else
                {
                    rfvImgupload.Visible = false;
                    listofuploadedfiles.Text = hdnImagePath.Value.TrimStart('~');
                }
                DataSet ds = new DataSet();
                ds = null;
                objDAEntities.PhotoID = (int)ViewState["photoid"];
                objDAEntities.PhotoTitle = "";
                objDAEntities.PhotoDesc = txtImageDescription.Text.Trim();
                //objDAEntities.PhotoImgAlternateText = txtAltText.Text.Replace("&nbsp;", "");
                objDAEntities.PhotoImageUrl = listofuploadedfiles.Text;
                objDAEntities.AlbumID = Convert.ToInt32(ddlAlbum.SelectedValue);
               
                if (ViewState["optype"].ToString() == "INSERT")
                {
                    objDAEntities.CreatedByUserID = CommonFn.UserID;
                    ds = (DataSet)objBusinessLogic.SavePhoto(objDAEntities);
                    Clear();
                    lblMessage.Visible = true;
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Photo added successfully!!!";
                }
                else if (ViewState["optype"].ToString() == "UPDATE")
                { Clear();
                    objDAEntities.optype = "UPDATE";
                    objDAEntities.UpdatedByUserID = CommonFn.UserID;
                    ds = (DataSet)objBusinessLogic.UpdateDeletPhoto(objDAEntities);
                    Clear();
                    lblMessage.Visible = true;
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Photo updated successfully!!!";
                }

                ViewState["optype"] = "INSERT";
                BindPhoto(0);
                ShowView();
               
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
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

                drpSelectPhotoAlbum.DataValueField = "AlbumId";
                drpSelectPhotoAlbum.DataTextField = "AlbumTitle";

                drpSelectPhotoAlbum.DataSource = ds;
                drpSelectPhotoAlbum.DataBind();
                //drpSelectPhotoAlbum.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
            }
        }
        public void BindPhoto(int id)
        {
            try
            {
                DataSet ds = new DataSet();
                ds = null;

                if (id == 0)
                {
                    objDAEntities.AlbumID = Convert.ToInt32(drpSelectPhotoAlbum.SelectedValue);
                    ds = (DataSet)objBusinessLogic.GetPhotoDetailsByAlbumId(objDAEntities);
                }

               // dgPhoto.Columns[4].Visible = true;
                //DataSet ds = new DataSet();
                //ds = null;
                else
                {
                    objDAEntities.PhotoID = id;
                    ds = (DataSet)objBusinessLogic.GetPhotoDetailByPhotoId(objDAEntities);
                }
                if (ds.Tables[0].Rows.Count == 0)
                {
                    //Bind your grid here
                    lblempty.Visible = true;
                    dgPhoto.Visible = false;

                }
                else
                {
                    lblempty.Visible = false;
                    dgPhoto.Visible = true;
                    dgPhoto.DataSource = ds;
                    dgPhoto.DataBind();
                }
                
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
            }
        }

        protected void dgPhoto_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                ShowAdd();
                rfvImgupload.Visible = false;
                lblMessage.Visible = false;
                DataSet ds = new DataSet();
                int photoid = Convert.ToInt32(e.CommandArgument);
                objDAEntities.PhotoID = photoid;
                ds = (DataSet)objBusinessLogic.GetPhotoDetailByPhotoId(objDAEntities);
                //txtPhotoTitle.Text = ds.Tables[0].Rows[0]["PhotoTitle"].ToString();

                txtImageDescription.Text = Convert.ToString(ds.Tables[0].Rows[0]["PhotoDescription"]).Trim();
                hdnImagePath.Value = Convert.ToString(ds.Tables[0].Rows[0]["PhotoImageUrl"]);
                listofuploadedfiles.Text = ds.Tables[0].Rows[0]["PhotoImageUrl"].ToString().Replace("/Content/PhotoGallery/", "");
                //Image ImageUrl = (Image)e.Item.Cells[5].FindControl("PhotoImageUrl");
                //if (ImageUrl != null)
                //{
                //    = ImageUrl.ImageUrl;
                //    //ImgUpdate.ImageUrl = hdnImagePath.Value;
                //}
               //txtAltText.Text = e.Item.Cells[2].Text.Replace("&nbsp;", "");
               // txtAltText.Text = ds.Tables[0].Rows[0]["PhotoImgAlternateText"].ToString();
                if (ddlAlbum.Items.FindByValue(ds.Tables[0].Rows[0]["AlbumID"].ToString()) != null)
                 {
                     ddlAlbum.ClearSelection();
                     ddlAlbum.Items.FindByValue(ds.Tables[0].Rows[0]["AlbumID"].ToString()).Selected = true;
                    // ddlAlbum.SelectedValue = ds.Tables[0].Rows[0]["AlbumID"].ToString();
                 }
                               
                ViewState["photoid"] = photoid;
                ViewState["optype"] = "UPDATE";
            }
            else if (e.CommandName == "Delete")
            {
                DataSet ds = new DataSet();
                objDAEntities.optype = "DELETE";
                int photoid = Convert.ToInt32(e.CommandArgument); 
                objDAEntities.PhotoID = photoid;
                ds = (DataSet)objBusinessLogic.UpdateDeletPhoto(objDAEntities);
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Photo deleted successfully!!!";
                ViewState["optype"] = "INSERT";

            }
            BindPhoto(0);
        }
        public void Clear()
        {
            //txtPhotoTitle.Text = "";
            //txtPhotoDesc.Content = "";
            txtImageDescription.Text = string.Empty;
            ddlAlbum.ClearSelection();
            listofuploadedfiles.Text = null;
           rfvImgupload.Visible = true;
            //ImgUpdate.Visible = false;
           lblMessage.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ShowView();
            Clear();
            lblMessage.Visible = false;
        }

        protected string SaveImage()
        {
            string strDBImagePath = string.Empty;
            try
            {
                if (UploadImages.PostedFile.FileName!=null)
                {
                    string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
                    string strSaveImagePath = string.Empty;
                    string fileName = Path.GetFileName(UploadImages.PostedFile.FileName);

                    string FileNameWEx = Path.GetFileNameWithoutExtension(fileName);

                    FileNameWEx = objDAEntities.RemoveBadCharForFolder(FileNameWEx);

                    String FileExtension = System.IO.Path.GetExtension(fileName);
                    //listofuploadedfiles.Text = fileName;
                    if ((FileExtension.ToLower() == ".jpg" || FileExtension.ToLower() == ".png" || FileExtension.ToLower() == ".jpeg" || FileExtension.ToLower() == ".tiff" || FileExtension.ToLower() == ".gif"))
                    {

                        string FolderName = CommonFn.PhotoGalleryFolder;
                        if (!CommonFn.folderExists(strServerPath, FolderName))
                        {
                            try
                            {
                                CommonFn.CreateFolder(strServerPath, FolderName);
                            }
                            catch(Exception ex)
                            {
                                Logging objlog = new Logging();
                                objlog.LogError(ex);
                            }
                        }

                        //string strFileNameOnly = CommonFn.GetFileName(fileName);
                        strSaveImagePath = strServerPath + FolderName + "\\" + FileNameWEx + FileExtension;
                        UploadImages.SaveAs(strSaveImagePath);

                        strDBImagePath = CommonFn.DbSave + CommonFn.DbPhotoGalleryFolder;
                        strDBImagePath = strDBImagePath + FileNameWEx + FileExtension;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Images size is more than 1.035 mb!!!');", true);
                }
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
            }
            return strDBImagePath;
        }
        protected void dgPhoto_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
        {
            dgPhoto.CurrentPageIndex = e.NewPageIndex;
            this.BindPhoto(0);
        }
        protected void btnAddJaslokTimes_Click(object sender, EventArgs e)
        {
            ShowAdd();
        }
        
        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Clear();
            BindPhoto(0);
        }
}
