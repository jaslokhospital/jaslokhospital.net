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
    public partial class ManageBanners : PortalModuleBase
    {
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

        public CommonFn objCommonFn = new CommonFn();
        public BusinessLogic objBusinessLogic = new BusinessLogic();
        public DataAccessLogic objDALogic = new DataAccessLogic();
        public DataAccessEntities objDAEntities = new DataAccessEntities();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBanner();
                ViewState["bannerid"] = 0;
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
                    listofuploadedfiles.Text = hdnImagePath.Value;
                }

                DataSet ds = new DataSet();
                ds = null;
                objDAEntities.BannerId = (int)ViewState["bannerid"];
                objDAEntities.BannerTitle = string.Empty;
                objDAEntities.BannerDesc = string.Empty;
                objDAEntities.AlternateText = string.Empty;
                objDAEntities.BannerLink = txtBannerLink.Text;
                objDAEntities.ImageUrl = listofuploadedfiles.Text.TrimStart('~');
                objDAEntities.BannerLink = txtBannerLink.Text;

                objDAEntities.PageTabId = 114;

                lblMessage.Visible = true;
                if (ViewState["optype"].ToString() == "INSERT")
                {
                    objDAEntities.CreatedByUserID = CommonFn.UserID;
                    ds = (DataSet)objBusinessLogic.SaveBanner(objDAEntities);
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Banner save successfully!!!";
                }
                else if (ViewState["optype"].ToString() == "UPDATE")
                {
                    objDAEntities.UpdatedByUserID = CommonFn.UserID;
                    objDAEntities.optype = "UPDATE";
                    ds = (DataSet)objBusinessLogic.UpdateDeleteBanner(objDAEntities);
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Banner updated successfully!!!";
                }
                Cache.Remove(AppGlobal.HomeBannerCache);
                ViewState["optype"] = "INSERT";
                BindBanner();
                ShowView();
            }
            catch
            {
                ;
            }
        }
        
        public void BindBanner()
        {
            try
            {
                DataSet ds = new DataSet();
                ds = null;
                objDAEntities.PageTabId = 0;

                ds = (DataSet)objBusinessLogic.GetBannerDetails(objDAEntities);

                if (ds.Tables[0].Rows.Count == 0)
                {
                    //Bind your grid here
                    lblempty.Visible = true;
                    dgBanner.Visible = false;

                }
                else
                {
                    lblempty.Visible = false;
                    dgBanner.Visible = true;
                    dgBanner.DataSource = ds;
                    dgBanner.DataBind();
                }

            }
            catch
            {
                ;
            }
        }
        protected void dgBanner_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            lblMessage.Visible = false;
            if (e.CommandName == "Update")
            {
                ShowAdd();
                DataSet ds = new DataSet();
                lblMessage.Visible = false;
                ds = (DataSet)objBusinessLogic.GetBannerDetails(objDAEntities);

                Image ImageUrl = (Image)e.Item.Cells[1].FindControl("ImageUrl");
                if (ImageUrl != null)
                {
                    hdnImagePath.Value = ImageUrl.ImageUrl;
                    listofuploadedfiles.Text = ImageUrl.ImageUrl.Replace("/Content/Banner/", "");
                }
                txtBannerLink.Text = e.Item.Cells[1].Text.Replace("&nbsp;", "");
                int bannerid = Convert.ToInt32(e.CommandArgument);
                ViewState["bannerid"] = bannerid;
                ViewState["optype"] = "UPDATE";
                rfvImgupload.Enabled = false;
            }
            else if (e.CommandName == "Delete")
            {
                DataSet ds = new DataSet();
                objDAEntities.optype = "DELETE";
                int bannerid = Convert.ToInt32(e.CommandArgument);
                objDAEntities.BannerId = bannerid;
                ds = (DataSet)objBusinessLogic.UpdateDeleteBanner(objDAEntities);
                
                ViewState["optype"] = "INSERT";
                Clear();
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Banner deleted successfully!!!";
                Cache.Remove(AppGlobal.HomeBannerCache);
            }
            BindBanner();
        }

        public void Clear()
        {
            txtBannerLink.Text = "";
            //txtBannDesc.Text = "";
            //txtAltText.Text = "";
            listofuploadedfiles.Text = "";
            lblMessage.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ShowView();
            lblMessage.Visible = false;
        }
        protected string SaveImage()
        {
            string strDBImagePath = string.Empty;
            try
            {
                string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
                string strSaveImagePath = string.Empty;
                string fileName = Path.GetFileName(UploadImages.PostedFile.FileName);

                string FolderName = CommonFn.BannerFolder;
                if (!CommonFn.folderExists(strServerPath, FolderName))
                {
                    try
                    {
                        CommonFn.CreateFolder(strServerPath, FolderName);
                    }
                    catch { }
                }
                string strFileNameOnly = CommonFn.GetFileName(fileName);

                strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly;

                UploadImages.SaveAs(strSaveImagePath);

                strDBImagePath = CommonFn.DbSave + CommonFn.DbBannerFolder;
                strDBImagePath = strDBImagePath + strFileNameOnly;
            }
            catch
            {
                ;
            }
            return strDBImagePath;
        }
        protected void dgBanner_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
        {
            dgBanner.CurrentPageIndex = e.NewPageIndex;
            BindBanner();
        }
        protected void dgBanner_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image ImageUrl = (Image)e.Item.FindControl("ImageUrl");

                ImageUrl.ImageUrl = !string.IsNullOrEmpty(DataBinder.Eval(e.Item.DataItem, "ImageUrl").ToString()) ? "~" + DataBinder.Eval(e.Item.DataItem, "ImageUrl").ToString() : CommonFn.DefaultImagePath;
            }

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ShowAdd();
        }
    }
}