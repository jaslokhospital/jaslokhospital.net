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
    public partial class ManageHomeSlider : PortalModuleBase
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
                BindHomeSlider(0);
                ViewState["SliderId"] = 0;
                ViewState["optype"] = "INSERT";

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (UploadImages.PostedFile.FileName != "")
                {
                    hdnUploadImg.Value = SaveImage();
                }

                if (!string.IsNullOrEmpty(hdnUploadImg.Value))
                {
                    DataSet ds = new DataSet();
                    ds = null;
                    objDAEntities.SliderId = (int)ViewState["SliderId"];
                    objDAEntities.ImageUrl = hdnUploadImg.Value;
                    objDAEntities.Description = string.Empty;
                    objDAEntities.Title = txtImageTitle.Text;
                    objDAEntities.RedirectLink = txtRedirectLink.Text.Replace("&nbsp;", "");
                    objDAEntities.IsApproved = ckbIsActive.Checked;
                    lblMessage.Visible = true;
                    if (ViewState["optype"].ToString() == "INSERT")
                    {
                        objDAEntities.CreatedByUserID = CommonFn.UserID;
                        objDAEntities.SliderId = 0;
                        objDAEntities.optype = "INSERT";
                        string msg = objBusinessLogic.SaveUpdateHomeSlider(objDAEntities);
                        lblMessage.CssClass = "successlbl";
                        lblMessage.Text = "Home slider added successfully!!!";
                    }
                    else if (ViewState["optype"].ToString() == "UPDATE")
                    {
                        objDAEntities.UpdatedByUserID = CommonFn.UserID;
                        objDAEntities.optype = "UPDATE";
                        string msg = objBusinessLogic.SaveUpdateHomeSlider(objDAEntities);
                        lblMessage.CssClass = "successlbl";
                        lblMessage.Text = "Home slider Updated successfully!!!";
                    }
                    ViewState["optype"] = "INSERT";
                    BindHomeSlider(0);
                    ShowView();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Image already exists!!!');", true);
                }
            }
            catch
            {
                ;
            }
        }


        public void BindHomeSlider(int id)
        {
            try
            {
                DataSet ds = new DataSet();
                ds = null;
                ds = (DataSet)objBusinessLogic.GetHomeSliderDetails(id);


                if (ds.Tables[0].Rows.Count == 0)
                {
                    //Bind your grid here
                    lblempty.Visible = true;
                    dgHomeSlider.Visible = false;

                }
                else
                {
                    lblempty.Visible = false;
                    dgHomeSlider.Visible = true;
                    dgHomeSlider.DataSource = ds;
                    dgHomeSlider.DataBind();
                }

            }
            catch 
            {
                ;
            }
        }

        protected void dgHomeSlider_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            int SliderId = Convert.ToInt32(e.CommandArgument);
            ViewState["SliderId"] = SliderId;
            objDAEntities.SliderId = SliderId;
            lblMessage.Visible = false;
            if (e.CommandName == "Update")
            {
                ShowAdd();
                DataSet ds = new DataSet();
                ds = null;
                ds = (DataSet)objBusinessLogic.GetHomeSliderDetails(SliderId);

                hdnUploadImg.Value = ds.Tables[0].Rows[0]["ImageUrl"].ToString();
                // ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('sf!!');", false);
                listofuploadedfiles.Text = ds.Tables[0].Rows[0]["ImageUrl"].ToString().Replace("/Content/HomeSliderGallery/", "");
                txtImageTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                txtRedirectLink.Text = ds.Tables[0].Rows[0]["RedirectLink"].ToString();

                if (ds.Tables[0].Rows[0]["IsActive"].ToString() == "True")
                {
                    ckbIsActive.Checked = true;
                }
                ViewState["optype"] = "UPDATE";
                objDAEntities.optype = "UPDATE";
                btnSubmit.Text = "Update";
                if (hdnUploadImg.Value != "" || hdnUploadImg.Value != null)
                {
                    rfvImgupload.Visible = false;

                }
                //Imguploaded.ImageUrl=listofuploadedfiles.Text);
            }
            else if (e.CommandName == "Delete")
            {
                DataSet ds = new DataSet();
                objDAEntities.optype = "DELETE";
                objBusinessLogic.DeleteHomeSlider(objDAEntities);
                lblMessage.Visible = true;
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Home slider deleted successfully!!!";
                ViewState["optype"] = "INSERT";

            }
            BindHomeSlider(0);
        }
        public void Clear()
        {
            txtRedirectLink.Text = "";
            txtImageTitle.Text = "";
            hdnUploadImg.Value = "";
            listofuploadedfiles.Text = "";
            btnSubmit.Text = "Save";
            ckbIsActive.Checked = false;
            //UploadImgEdit.Visible = false;
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
                if (UploadImages.PostedFile.ContentLength > 0)
                {
                    string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
                    string strSaveImagePath = string.Empty;
                    string fileName = Path.GetFileName(UploadImages.PostedFile.FileName);

                    string FileNameWEx = Path.GetFileNameWithoutExtension(fileName);

                    FileNameWEx = objDAEntities.RemoveBadCharForFolder(FileNameWEx);
                    String FileExtension = System.IO.Path.GetExtension(fileName);

                    string FolderName = CommonFn.HomeSliderGalleryFolder;



                    string strFileNameOnly = FileNameWEx + FileExtension;
                    strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly;

                    if (!File.Exists(strSaveImagePath))
                    {
                        UploadImages.SaveAs(strSaveImagePath);
                        strDBImagePath = CommonFn.DbSave + CommonFn.DbHomeSliderGalleryFolder;
                        strDBImagePath = strDBImagePath + strFileNameOnly;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Images size too small!!!');", false);
                }
            }
            catch
            {
                ;
            }
            return strDBImagePath;
        }
        protected void dgHomeSlider_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
        {
            dgHomeSlider.CurrentPageIndex = e.NewPageIndex;
            BindHomeSlider(0);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ShowAdd();
        }
    }
}