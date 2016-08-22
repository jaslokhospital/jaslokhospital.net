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

namespace DotNetNuke.Modules.JaslokAdmin
{
    public partial class ManageAlbum : PortalModuleBase
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
                    ViewState["albumid"] = 0;
                    ViewState["optype"] = "INSERT";
                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                //if (UploadImages.PostedFile.FileName != "")
                //{
                //    listofuploadedfiles.Text = SaveImage();
                //}   
                //else{
                //    listofuploadedfiles.Text = hdnImagePath.Value.TrimStart('~');
                //}
                    DataSet ds = new DataSet();
                    ds = null;
                    objDAEntities.AlbumID = (int)ViewState["albumid"];
                    objDAEntities.AlbumTitle = txtAlbumTitle.Text;
                    //objDAEntities.AlbumDesc = txtAlbumDesc.Content.Replace("&nbsp;", "");
                    //objDAEntities.AlbumImgAlternateText = txtAltText.Text.Replace("&nbsp;", "");
                    objDAEntities.AlbumImageUrl = null;
                    objDAEntities.AlbumType = ddlAlbumType.SelectedValue;
                    lblMessage.Visible = true;
                    if (ViewState["optype"].ToString() == "INSERT")
                    {
                        objDAEntities.CreatedByUserID = CommonFn.UserID;
                        ds = (DataSet)objBusinessLogic.SaveAlbum(objDAEntities);                        
                        lblMessage.CssClass = "successlbl";
                        lblMessage.Text = "Album added successfully!!!";
                    }
                    else if (ViewState["optype"].ToString() == "UPDATE")
                    {
                        objDAEntities.UpdatedByUserID = CommonFn.UserID;
                        objDAEntities.optype = "UPDATE";
                        ds = (DataSet)objBusinessLogic.UpdateDeleteAlbum(objDAEntities);
                        lblMessage.CssClass = "successlbl";
                        lblMessage.Text = "Album Updated successfully!!!";
                    }
                    ViewState["optype"] = "INSERT";
                    BindAlbum();
                    ShowView();
                    Clear();
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

                if (ds.Tables[0].Rows.Count == 0)
                {
                    //Bind your grid here
                    lblempty.Visible = true;
                    dgAlbum.Visible = false;

                }
                else
                {
                    lblempty.Visible = false;
                    dgAlbum.Visible = true;
                    dgAlbum.DataSource = ds;
                    dgAlbum.DataBind();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void dgAlbum_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                ShowAdd();
                lblMessage.Visible = false;
                DataSet ds = new DataSet();
                ds = (DataSet)objBusinessLogic.GetAlbumDetails();

                txtAlbumTitle.Text = Convert.ToString(ds.Tables[0].Rows[0]["AlbumTitle"]);
                //txtAlbumDesc.Content = ds.Tables[0].Rows[0]["AlbumDescription"].ToString();
               
                //ImgUpdate.Visible = true;
                //Image ImageUrl = (Image)e.Item.Cells[1].FindControl("AlbumImageUrl");
                //if (ImageUrl != null)
                //{
                //hdnImagePath.Value = Convert.ToString(ds.Tables[0].Rows[0]["AlbumImageUrl"]);
                    //ImgUpdate.ImageUrl = hdnImagePath.Value;
                //listofuploadedfiles.Text = Convert.ToString(ds.Tables[0].Rows[0]["AlbumImageUrl"]).Replace("/Content/Album/", "");
                //}


               // txtAltText.Text = ds.Tables[0].Rows[0]["AlbumImgAlternateText"].ToString();
                //ddlAlbumType.SelectedValue = e.Item.Cells[4].Text;

                if (ddlAlbumType.Items.FindByValue(Convert.ToString(ds.Tables[0].Rows[0]["AlbumType"])) != null)
                {
                    ddlAlbumType.ClearSelection();
                    ddlAlbumType.Items.FindByValue(ds.Tables[0].Rows[0]["AlbumType"].ToString()).Selected = true;
                }



                int albumid = Convert.ToInt32(e.CommandArgument);
                ViewState["albumid"] = albumid;
                ViewState["optype"] = "UPDATE";
            }
            else if (e.CommandName == "Delete")
            {
                DataSet ds = new DataSet();
                objDAEntities.optype = "DELETE";
                int albumid = Convert.ToInt32(e.CommandArgument);
                objDAEntities.AlbumID = albumid;
                ds = (DataSet)objBusinessLogic.UpdateDeleteAlbum(objDAEntities);
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Album deleted successfully!!!";
                ViewState["optype"] = "INSERT";

            }
            BindAlbum();
        }
        public void Clear()
        {
            txtAlbumTitle.Text = null;
            //txtAlbumDesc.Content = "";
            //txtAltText.Text = "";
            ddlAlbumType.ClearSelection();
            //ImgUpdate.Visible = false;
           // listofuploadedfiles.Text = null;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ShowView();
            Clear();
            lblMessage.Visible = false;
        }
        //protected string SaveImage()
        //{
        //    string strDBImagePath = string.Empty;
        //    try
        //    {
        //        if (UploadImages.PostedFile.FileName!=null)
        //        {
        //            string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
        //            string strSaveImagePath = string.Empty;
        //            string fileName = Path.GetFileName(UploadImages.PostedFile.FileName);

        //            string FileNameWEx = Path.GetFileNameWithoutExtension(fileName);

        //            FileNameWEx = objDAEntities.RemoveBadCharForFolder(FileNameWEx);

        //            String FileExtension = System.IO.Path.GetExtension(fileName);
        //            //listofuploadedfiles.Text = fileName;
        //            if ((FileExtension.ToLower() == ".jpg" || FileExtension.ToLower() == ".png" || FileExtension.ToLower() == ".jpeg" || FileExtension.ToLower() == ".tiff" || FileExtension.ToLower() == ".gif"))
        //            {

        //                string FolderName = CommonFn.AlbumFolder;
        //                if (!CommonFn.folderExists(strServerPath, FolderName))
        //                {
        //                    try
        //                    {
        //                        CommonFn.CreateFolder(strServerPath, FolderName);
        //                    }
        //                    catch { }
        //                }

        //                string strFileNameOnly = CommonFn.GetFileName(fileName);
        //                strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly;
        //                UploadImages.SaveAs(strSaveImagePath);

        //                strDBImagePath = CommonFn.DbSave + CommonFn.DbAlbumFolder;
        //                strDBImagePath = strDBImagePath + strFileNameOnly;
        //            }
        //        }
        //        else
        //        {
        //            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Images size is more than 1.035 mb!!!');", true);
        //        }
        //    }
        //    catch(Exception ex)
        //    {
        //        throw ex;
        //    }
        //    return strDBImagePath;
        //}
        protected void dgAlbum_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
        {
            dgAlbum.CurrentPageIndex = e.NewPageIndex;
            this.BindAlbum();
        }
        //protected void dgAlbum_ItemBound(object sender, DataGridItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
                
        //        Label lblsnumber = (Label)e.Item.FindControl("lblsnumber");
        //        //Image AlbumImageUrl = (Image)e.Item.FindControl("AlbumImageUrl");


        //        //lblsnumber.Text = (e.Item.ItemIndex + 1).ToString();

        //        AlbumImageUrl.ImageUrl = !string.IsNullOrEmpty(DataBinder.Eval(e.Item.DataItem, "AlbumImageUrl").ToString()) ? "~" + DataBinder.Eval(e.Item.DataItem, "AlbumImageUrl").ToString() : CommonFn.DefaultImagePath;


        //    }
        //}
        protected void btnAddJaslokTimes_Click(object sender, EventArgs e)
        {
            ShowAdd();
        }
}
}