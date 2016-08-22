using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cross.DNN.Common.Utility;
using Cross.DNN.Common.Utility.TreeHelper;
using Cross.Modules.Article.Business;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Services.FileSystem;
using DotNetNuke.Services.Localization;
using Cross.DNN.Common.License;
using System.Collections;
namespace Cross.Modules.Article.View
{

    public partial class UserArticleManage : ArticleModuleBase
    {
        private int recordCount = 0;
        private int pageSize = 15;

        public int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] != null)
                {
                    return Convert.ToInt32(ViewState["CurrentPage"]);
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        public List<AttachmentInfo> AttachmentList
        {
            get
            {
                if (ViewState["AttachmentList"] != null)
                {
                    return (List<AttachmentInfo>)ViewState["AttachmentList"];
                }
                else
                {
                    return new List<AttachmentInfo>();
                }
            }
            set
            {
                ViewState["AttachmentList"] = value;
            }
        }

        public int ArticleId
        {
            get
            {
                if (ViewState["ArticleId"] != null)
                {
                    return Convert.ToInt32(ViewState["ArticleId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["ArticleId"] = value;
            }
        }

        public int CategoryId
        {
            get
            {
                if (ViewState["CategoryId"] != null)
                {
                    return Convert.ToInt32(ViewState["CategoryId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["CategoryId"] = value;
            }
        }
        public string SearchTerm
        {
            get
            {
                if (ViewState["SearchTerm"] != null)
                {
                    return Convert.ToString(ViewState["SearchTerm"]);
                }
                else
                {
                    return "";
                }
            }
            set
            {
                ViewState["SearchTerm"] = value;
            }
        }
        public bool UnAuthed
        {
            get
            {
                if (ViewState["UnAuthed"] != null)
                {
                    return Convert.ToBoolean(ViewState["UnAuthed"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                ViewState["UnAuthed"] = value;
            }
        }
        public bool Featured
        {
            get
            {
                if (ViewState["Featured"] != null)
                {
                    return Convert.ToBoolean(ViewState["Featured"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                ViewState["Featured"] = value;
            }
        }

        public bool UnActive
        {
            get
            {
                if (ViewState["UnActive"] != null)
                {
                    return Convert.ToBoolean(ViewState["UnActive"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                ViewState["UnActive"] = value;
            }
        }
        public bool Draft
        {
            get
            {
                if (ViewState["Draft"] != null)
                {
                    return Convert.ToBoolean(ViewState["Draft"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                ViewState["Draft"] = value;
            }
        }

        public bool Expired
        {
            get
            {
                if (ViewState["Expired"] != null)
                {
                    return Convert.ToBoolean(ViewState["Expired"]);
                }
                else
                {
                    return false;
                }
            }
            set
            {
                ViewState["Expired"] = value;
            }
        }
        public bool HasManagePermission
        {
            get
            {
                return UserInfo.IsInRole(PortalSettings.AdministratorRoleName) || Cross.DNN.Common.Utility.Utils.HasRolePermission(ArticlePortalSettings.General.Portal_ArticleManageRoles);
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            CheckSecurity();
            DotNetNuke.Framework.jQuery.RequestRegistration();
      //      Page.ClientScript.RegisterClientScriptInclude("CrossArticle", FullDomainName + "/DesktopModules/CrossArticle/Js/CrossArticle.js");
            //this needs to execute always to the client script code is registred in InvokePopupCal
            lbtnCalendar.NavigateUrl = DotNetNuke.Common.Utilities.Calendar.InvokePopupCal(txtPublishDate);
            lbtnCalendarExpire.NavigateUrl = DotNetNuke.Common.Utilities.Calendar.InvokePopupCal(txtExpireDate);
            if (!IsPostBack)
            {
                //首先判断目录是否设置，如无目录，转到相应的设置界面
                if (PortalCategoryList.Count < 1)
                {
                    lblNoCategory.Text = Localization.GetString("lblNoCategory.Text", LocalResourceFile);
                    lblNoCategory.Visible = true;
                    tblButton.Visible = false;
                    tblList.Visible = false;
                    return;
                }            
                ArticleId = -1;
                BindControl();             
                LoadCategories();
                BindTag();
                BindArticleList();
                SetButtonStatus("Normal");      
            }

        }
        //设定控件的初始状态
        private void BindControl()
        {
            ctlPagingControl.ResourceFile = LocalUtils.SharedResourcesFile;//绑定资源文件

            if (UserInfo.IsInRole(PortalSettings.AdministratorRoleName))
            {
                ctlImage.Visible = true;
                ctlAttachment.Visible = true;

                ctlUserImage.Visible = false;
                ctlUserAttachment.Visible = false;
                ctlUserImage.LoadData = false;
                ctlUserAttachment.LoadData = false;
            }
            else
            {
                ctlImage.Visible = false;
                ctlAttachment.Visible = false;

                ctlUserImage.Visible = true;
                ctlUserAttachment.Visible = true;
                ctlUserImage.LoadData = true;
                ctlUserAttachment.LoadData = true;

                ctlUserImage.UserFolderRootPrefix = LocalUtils.UserFolderRootPrefix;
                ctlUserImage.UserDiskQuote = ArticlePortalSettings.General.Portal_ArticleUserDiskQuote;

                ctlUserAttachment.UserFolderRootPrefix = LocalUtils.UserFolderRootPrefix;
                ctlUserAttachment.UserDiskQuote = ArticlePortalSettings.General.Portal_ArticleUserDiskQuote;
            }
            trArticleStatus.Visible = HasManagePermission;
            lblPortalDisableComment.Visible = !ArticlePortalSettings.Comment.Portal_ArticleAllowComment;
            lblPortalDisableRating.Visible = !ArticlePortalSettings.Rating.Portal_ArticleAllowRating;
            lblPortalDisableRecommend.Visible = !ArticlePortalSettings.Recommend.Portal_ArticleAllowRecommend;
            lbtnDelete.Attributes.Add("onClick", "javascript:return confirm('" + Localization.GetString("DeleteItem") + "');");
            lblInvalidCategory.Text = string.Format(Localization.GetString("Category.ErrorMessage", LocalResourceFile), ArticlePortalSettings.General.Portal_ArticleCategorySelectCount.ToString());

            txtPinOrder.Text = "100";

            txtPublishDate.Text = DateTime.Now.ToShortDateString();
            chkAuthed.Checked = !ArticlePortalSettings.General.Portal_ArticleRequireApproval;

            //ViewRoles
            cblViewRoles = Utils.FillRolesCheckBox(cblViewRoles, ArticlePortalSettings.General.Portal_ArticleViewRoles, PortalSettings.AdministratorRoleId, PortalId);

            //Rating value
            chkAllowRating.Checked = ArticlePortalSettings.Rating.Portal_ArticleAllowRating;
            cblRatingRoles = Utils.FillRolesCheckBox(cblRatingRoles, ArticlePortalSettings.Rating.Portal_ArticleRatingRoles, PortalSettings.AdministratorRoleId, PortalId);

            //Recommend
            chkAllowRecommend.Checked = ArticlePortalSettings.Recommend.Portal_ArticleAllowRecommend;
            cblRecommendRoles = Utils.FillRolesCheckBox(cblRecommendRoles, ArticlePortalSettings.Recommend.Portal_ArticleRecommendRoles, PortalSettings.AdministratorRoleId, PortalId);
            //Comment value
            chkAllowComment.Checked = ArticlePortalSettings.Comment.Portal_ArticleAllowComment;
            chkAutoAuthComment.Checked = ArticlePortalSettings.Comment.Portal_ArticleAutoAuthComment;
            cblCommentRoles = Utils.FillRolesCheckBox(cblCommentRoles, ArticlePortalSettings.Comment.Portal_ArticleCommentRoles, PortalSettings.AdministratorRoleId, PortalId);

            cblDownloadRoles = Utils.FillRolesCheckBox(cblDownloadRoles, ArticlePortalSettings.Download.Portal_ArticleDownloadRoles, PortalSettings.AdministratorRoleId, PortalId);
        }
        private void BindTag()
        {
            txtTag2.Visible = ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 1;
            txtTag3.Visible = ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 2;
            txtTag4.Visible = ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 3;
            txtTag5.Visible = ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 4;
            txtTag6.Visible = ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 5;
            txtTag7.Visible = ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 6;
            txtTag8.Visible = ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 7;
            txtTag9.Visible = ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 8;
            txtTag10.Visible = ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 9;

            List<TagInfo> tagList = TagController.ListByPortals(PortalId);
            var popularList = from p in tagList orderby p.ArticleCounts descending select new { Tag = p.Tag };
            ddlPopularTag.DataSource = popularList.Take(45);
            ddlPopularTag.DataBind();

        }

        private void CheckSecurity()
        {
            bool isTrial = true;
            if (License.LicenseExists(Request.MapPath(this.ControlPath+LocalUtils.LicenseFileName),LocalUtils.LicenseFileLength))
            {
                isTrial=false;
            }
            
            if (isTrial)
            {              
                if (!(Request.Url.ToString().ToLower().IndexOf("localhost") > 0))
                {
                    Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId), true);
                }
            }
            if (UserId == -1)//当前没有登录，则直接返回
            {
                Response.Redirect(DotNetNuke.Common.Globals.NavigateURL("Access Denied"), true);
            }
            if (UserInfo.IsInRole(PortalSettings.AdministratorRoleName))
            {
                return;
            }
            if (Utils.HasRolePermission(ArticlePortalSettings.General.Portal_ArticleEditRoles))
            {
                return;
            }

            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL("Access Denied"), true);
        }

        #region TreeView

        private void LoadCategories()
        {

            //转换目录信息列表至树形节点列表
            List<RecursiveCategoryData> listRecursive = LocalUtils.ConvertCategoryListToRecursiveList(PortalCategoryList);
            RecursiveCategoryItem m_recursiveCategoryRoot;
            m_recursiveCategoryRoot = RecursiveHelper.ConvertListToRecursiveItem(listRecursive);

            RecursiveHelper.ConvertRecursiveItemToAspNetTree(ref tvCategory, m_recursiveCategoryRoot);

            List<CategoryInfo> list = CategoryController.ListByPortals(PortalId);


            for (int i = 0; i < list.Count; i++)
            {
                list[i].Name = Utils.FormatLevelName(list[i].Name, list[i].Level, "..");
            }

            List<RecursiveCategoryData> listRecursiveData = new List<RecursiveCategoryData>();
            listRecursiveData = LocalUtils.ConvertCategoryListToRecursiveList(list);


            RecursiveCategoryItem orderedItems = RecursiveHelper.ConvertListToRecursiveItem(listRecursiveData);

            ArrayList listCategory = orderedItems.GetListOrdered();
            RecursiveCategoryItem a = new RecursiveCategoryItem();
            a.Id = -1;
            a.Name = Localization.GetString("SelectCategory.Text", this.LocalResourceFile);
            listCategory.Add(a);
            ddlCategory.DataSource = listCategory;
            ddlCategory.DataBind();
            ddlCategory.SelectedValue = "-1";
        }



        #endregion


        private void BindArticle(int articleId)
        {
            lblInvalidCategory.Visible=false;
            ArticleInfo objArticle =  ArticleController.Get(articleId);
            if (objArticle == null)
            {
                return;
            }


            txtTitle.Text = objArticle.Title;
            txtAuthor.Text = objArticle.Author;
            txtSource.Text = objArticle.Source;
            chkQuote.Checked = objArticle.Quote;
            txtPinOrder.Text = Convert.ToString(objArticle.PinOrder);
            chkDraft.Checked = objArticle.Draft;

            ctlLinkUrl.Url = objArticle.LinkUrl;
            chkFeatured.Checked = objArticle.Featured;
            chkAuthed.Checked = objArticle.Authed;
            chkActive.Checked = objArticle.Active;

            //Image

            if (UserInfo.IsInRole(PortalSettings.AdministratorRoleName))
            {
                ctlImage.Url = objArticle.Image;
            }
            else
            {
                ctlUserImage.Url = objArticle.Image;
            }
            txtImageDescription.Text = objArticle.ImageDescription;
            RecursiveHelper.FillAspNetTreeCheckBox(ref tvCategory, objArticle.Categories, true);

            List<ArticleToTagInfo> tags = (from t in ArticleToTagController.ListByArticle(articleId) select t).ToList();

            txtTag1.Text = tags.Count > 0 ? tags[0].Tag : "";
            txtTag2.Text = tags.Count > 1 ? tags[1].Tag : "";
            txtTag3.Text = tags.Count > 2 ? tags[2].Tag : "";
            txtTag4.Text = tags.Count > 3 ? tags[3].Tag : "";
            txtTag5.Text = tags.Count > 4 ? tags[4].Tag : "";
            txtTag6.Text = tags.Count > 5 ? tags[5].Tag : "";
            txtTag7.Text = tags.Count > 6 ? tags[6].Tag : "";
            txtTag8.Text = tags.Count > 7 ? tags[7].Tag : "";
            txtTag9.Text = tags.Count > 8 ? tags[8].Tag : "";
            txtTag10.Text = tags.Count > 9 ? tags[9].Tag : "";

            //Date
            if (!Null.IsNull(objArticle.PublishDate)) txtPublishDate.Text = objArticle.PublishDate.ToShortDateString();
            if (!Null.IsNull(objArticle.ExpireDate)) txtExpireDate.Text = objArticle.ExpireDate.ToShortDateString();

            cblViewRoles = Utils.FillRolesCheckBox(cblViewRoles, objArticle.ViewRoles, PortalSettings.AdministratorRoleId, PortalId);

            //rating 
            chkAllowRating.Checked = objArticle.AllowRating;
            cblRatingRoles = Utils.FillRolesCheckBox(cblRatingRoles, objArticle.RatingRoles, PortalSettings.AdministratorRoleId, PortalId);

            //Comment value
            chkAllowComment.Checked = objArticle.AllowComment;
            chkAutoAuthComment.Checked = objArticle.AutoAuthComment;
            cblCommentRoles = Utils.FillRolesCheckBox(cblCommentRoles, objArticle.CommentRoles, PortalSettings.AdministratorRoleId, PortalId);

            //
            chkAllowRecommend.Checked = objArticle.AllowRecommend;
            cblRecommendRoles = Utils.FillRolesCheckBox(cblRecommendRoles, objArticle.RecommendRoles, PortalSettings.AdministratorRoleId, PortalId);

            cblDownloadRoles = Utils.FillRolesCheckBox(cblDownloadRoles, objArticle.DownloadRoles, PortalSettings.AdministratorRoleId, PortalId);



            txtSummary.Text = objArticle.Summary;
            txtDetail.Text = Server.HtmlDecode(objArticle.Article);

            AttachmentList = new List<AttachmentInfo>();
            List<AttachmentInfo> aiList = AttachmentController.ListByArticle(articleId);
            for (int i = 0; i < aiList.Count; i++)
            {
                AttachmentInfo ai = new AttachmentInfo();
                ai.Id = i;
                ai.ArticleId = articleId;
                ai.FilePath = aiList[i].FilePath;
                AttachmentList.Add(ai);
            }

            gvAttachment.DataSource = AttachmentList;
            gvAttachment.DataBind();

        }

        protected void lbtnAdd_Click(object sender, EventArgs e)
        {
            //Set Button Status
            SetButtonStatus("Add");           
            ArticleId = -1;
            txtTitle.Text = "";
            txtTitle.Focus(); 
            AttachmentList = new List<AttachmentInfo>();
        }
        

        private void UpdateArticle()
        {
            ArticleInfo objArticle = new ArticleInfo();

            objArticle.Id = ArticleId;
            objArticle.PortalId = PortalId;

            //Normal 
            objArticle.Title = txtTitle.Text;
            objArticle.Author = txtAuthor.Text;
            objArticle.Source = txtSource.Text;
            objArticle.Quote = chkQuote.Checked;
            objArticle.Draft = chkDraft.Checked;

            objArticle.LinkUrl = ctlLinkUrl.Url;
            objArticle.PinOrder = Convert.ToInt32(txtPinOrder.Text);
            //other
            if (ArticlePortalSettings.General.Portal_ArticleRequireApproval == true)
            {
                objArticle.Authed = chkAuthed.Checked;
            }
            else
            {
                objArticle.Authed = true;
            }
            objArticle.Featured = chkFeatured.Checked;
            objArticle.Active = chkActive.Checked;

            objArticle.Thumbnail = "";
            objArticle.Image=UserInfo.IsInRole(PortalSettings.AdministratorRoleName)?ctlImage.Url : ctlUserImage.Url;
            objArticle.ImageDescription = txtImageDescription.Text;
       
           
            if (objArticle.Image.StartsWith("FileID="))
            {
                FileController fc = new FileController();
                DotNetNuke.Services.FileSystem.FileInfo fi = new DotNetNuke.Services.FileSystem.FileInfo();
                DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);

                fi = GetFileInfoById(objArticle.Image);
                if (fi != null && System.IO.File.Exists(fi.PhysicalPath))
                {
                    objArticle.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + fi.FileName;
                    System.IO.FileInfo physicalFile = new System.IO.FileInfo(fi.PhysicalPath);

                    if (!fi.FileName.ToLower().StartsWith("thumb_"))//文件没有以"thumb_"开头，则先查找是否存在以thumb_ 开头的同名图片
                    {
                        if (System.IO.File.Exists(physicalFile.DirectoryName + "\\" + "thumb_" + physicalFile.Name))//存在该文件，则自动指向
                        {
                            objArticle.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + "thumb_" + fi.FileName;
                        }
                        else//不存在，则生成该文件，然后指向
                        {
                            if (ArticlePortalSettings.General.Portal_ArticleGenerateThumb)
                            {
                                Utils.ResizeImage(fi.PhysicalPath, ArticlePortalSettings.General.Portal_ArticleThumbnailSize, physicalFile.DirectoryName + "\\" + "thumb_" + physicalFile.Name);
                                objArticle.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + "thumb_" + fi.FileName;
                            }
                        }
                    }
                }
            }
            //Add Categories
            objArticle.Categories = RecursiveHelper.GetAspNetTreeCheckList(tvCategory);

            //Add Tags
            objArticle.Tags = "";
            TagInfo objTag = new TagInfo();
            List<int> tagList = new List<int>();
            if (txtTag1.Text.Trim() != "")
            {
                objTag = TagController.GetByTag(txtTag1.Text.Trim());
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag1.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag2.Text.Trim() != "" && ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 1)
            {
                objTag = TagController.GetByTag(txtTag2.Text.Trim());
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag2.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag3.Text.Trim() != "" && ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 2)
            {
                objTag = TagController.GetByTag(txtTag3.Text.Trim());
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag3.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag4.Text.Trim() != "" && ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 3)
            {
                objTag = TagController.GetByTag(txtTag4.Text.Trim());
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag4.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag5.Text.Trim() != "" && ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 4)
            {
                objTag = TagController.GetByTag(txtTag5.Text.Trim());
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag5.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag6.Text.Trim() != "" && ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 5)
            {
                objTag = TagController.GetByTag(txtTag6.Text.Trim());
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag6.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag7.Text.Trim() != "" && ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 6)
            {
                objTag = TagController.GetByTag(txtTag7.Text.Trim());
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag7.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag8.Text.Trim() != "" && ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 7)
            {
                objTag = TagController.GetByTag(txtTag8.Text.Trim());
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag8.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag9.Text.Trim() != "" && ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 8)
            {
                objTag = TagController.GetByTag(txtTag9.Text.Trim());
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag9.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag10.Text.Trim() != "" && ArticlePortalSettings.General.Portal_ArticleTagSelectCount > 9)
            {
                objTag = TagController.GetByTag(txtTag10.Text.Trim());
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag10.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            var newTaglist = (from p in tagList select p).Distinct();//remove the  repeated tag item.

            foreach (int item in newTaglist)
            {
                objArticle.Tags += item.ToString() + ",";
            }
            objArticle.Tags = Utils.RemoveSeperator(objArticle.Tags, ",");
            //Tags end

            //date
            if ((txtPublishDate.Text != null) && (txtPublishDate.Text != ""))
            {
                objArticle.PublishDate = Convert.ToDateTime(txtPublishDate.Text);
            }
            else
            {
                objArticle.PublishDate = DateTime.Now;
            }
            if (txtExpireDate.Text != "")
            {
                objArticle.ExpireDate = Convert.ToDateTime(txtExpireDate.Text);
            }

            objArticle.ViewRoles = Utils.GetCheckedItems(cblViewRoles, PortalSettings.AdministratorRoleId);
            //Rating
            objArticle.AllowRating = chkAllowRating.Checked;
            objArticle.RatingRoles = Utils.GetCheckedItems(cblRatingRoles, PortalSettings.AdministratorRoleId);

            //Recommend
            objArticle.AllowRecommend = chkAllowRecommend.Checked;
            objArticle.RecommendRoles = Utils.GetCheckedItems(cblRecommendRoles, PortalSettings.AdministratorRoleId);


            //Comment
            objArticle.AllowComment = chkAllowComment.Checked;
            objArticle.CommentRoles = Utils.GetCheckedItems(cblCommentRoles, PortalSettings.AdministratorRoleId);
            objArticle.AutoAuthComment = chkAutoAuthComment.Checked;
            //Download roles
            objArticle.DownloadRoles = Utils.GetCheckedItems(cblDownloadRoles, PortalSettings.AdministratorRoleId);

            objArticle.Summary = LocalUtils.RemoveAllHtmlTags(txtSummary.Text);
            objArticle.Article = txtDetail.Text;
            objArticle.UserId = UserId;
            //Now processing attachment
            int newArticleId = -1;
            if (ArticleId == -1)
            {
               newArticleId = ArticleController.Add(objArticle);
            }
            else
            {
                ArticleController.Update(objArticle);
                newArticleId = ArticleId;
                AttachmentController.DeleteByArticle(ArticleId); //delete attachment first.
            }
            AttachmentInfo ai = new AttachmentInfo();
            foreach (AttachmentInfo item in AttachmentList)
            {
                ai.ArticleId = newArticleId;
                ai.FilePath = item.FilePath;
                AttachmentController.Add(ai);
            }
            //Reset all 
            ArticleId = -1;
            AttachmentList = new List<AttachmentInfo>();
            gvAttachment.DataSource = AttachmentList;
            gvAttachment.DataBind();
        }

        private void BindArticleList()
        {
            int totalRecords = 0;

            List<ArticleInfo> list = ArticleController.ListByPortals(PortalId, CategoryId, UserId, UnAuthed, Featured, UnActive, Draft, Expired, SearchTerm,pageSize, CurrentPage, ref totalRecords);

            recordCount = totalRecords;
            gvList.DataSource = list;
            gvList.DataBind();

            ctlPagingControl.RecordCount = recordCount;
            ctlPagingControl.PageSize = pageSize;
            ctlPagingControl.CurrentPage = CurrentPage;
            ctlPagingControl.Span = 5;
        }




        protected void lbtnReturn_Click(object sender, EventArgs e)
        {
            ArticleId = -1;
            SetButtonStatus("Return");
        }
        protected void lbtnDelete_Click(object sender, EventArgs e)
        {
            if (ArticleId == -1)
            {
                return;
            }
            else
            {
                ArticleController.Delete(ArticleId);
                ArticleId = -1;
                BindArticleList();
                SetButtonStatus("Delete");
            }
        }

        private void SetButtonStatus(string command)
        {
            tdArticleSelect.Visible = false;
            switch (command)
            {
                case "Add":

                    trDetail.Visible = true;
                    trGrid.Visible = false;
                    trSearch.Visible = false;
                    tdArticleSelect.Visible = false;

                    imgAdd.Visible = false;
                    lbtnAdd.Visible = false;

                    imgUpdateReturn.Visible = true;
                    lbtnUpdateReturn.Visible = true;

                    imgUpdateReturn1.Visible = true;
                    lbtnUpdateReturn1.Visible = true;

                    imgUpdateContinue.Visible = true;
                    lbtnUpdateContinue.Visible = true;

                    imgUpdateContinue1.Visible = true;
                    lbtnUpdateContinue1.Visible = true;

                    imgReturn.Visible = true;
                    lbtnReturn.Visible = true;

                    imgReturn1.Visible = true;
                    lbtnReturn1.Visible = true;

                    imgDelete.Visible = false;
                    lbtnDelete.Visible = false;

                    imgDelete1.Visible = false;
                    lbtnDelete1.Visible = false;
                    break;
                case "Select":

                    trDetail.Visible = true;
                    trGrid.Visible = false;
                    trSearch.Visible = false;
                    tdArticleSelect.Visible = false;

                    imgAdd.Visible = false;
                    lbtnAdd.Visible = false;

                    imgUpdateReturn.Visible = true;
                    lbtnUpdateReturn.Visible = true;

                    imgUpdateReturn1.Visible = true;
                    lbtnUpdateReturn1.Visible = true;

                    imgUpdateContinue.Visible = false;
                    lbtnUpdateContinue.Visible = false;

                    imgUpdateContinue1.Visible = false;
                    lbtnUpdateContinue1.Visible = false;

                    imgReturn.Visible = true;
                    lbtnReturn.Visible = true;

                    imgReturn1.Visible = true;
                    lbtnReturn1.Visible = true;


                    imgDelete.Visible = true;
                    lbtnDelete.Visible = true;

                    imgDelete1.Visible = true;
                    lbtnDelete1.Visible = true;
                    break;


                default:

                    trDetail.Visible = false;
                    trGrid.Visible = true;
                    trSearch.Visible = true;
                    tdArticleSelect.Visible = true;

                    imgAdd.Visible = true;
                    lbtnAdd.Visible = true;

                    imgUpdateReturn.Visible = false;
                    lbtnUpdateReturn.Visible = false;

                    imgUpdateReturn1.Visible = false;
                    lbtnUpdateReturn1.Visible = false;

                    imgUpdateContinue.Visible = false;
                    lbtnUpdateContinue.Visible = false;

                    imgUpdateContinue1.Visible = false;
                    lbtnUpdateContinue1.Visible = false;

                    imgReturn.Visible = false;
                    lbtnReturn.Visible = false;

                    imgReturn1.Visible = false;
                    lbtnReturn1.Visible = false;

                    imgDelete.Visible = false;
                    lbtnDelete.Visible = false;

                    imgDelete1.Visible = false;
                    lbtnDelete1.Visible = false;

                    break;


            }

        }


      
        protected void lbtnUpdateReturn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == false)
            {
                return;
            }
            lblInvalidCategory.Visible = false;
            string category = RecursiveHelper.GetAspNetTreeCheckList(tvCategory);

            if (category == "" || category == null || category.Split(',').Length > ArticlePortalSettings.General.Portal_ArticleCategorySelectCount)
            {
                lblInvalidCategory.Visible = true;
                return;
            }

            UpdateArticle();         
            BindArticleList();
            SetButtonStatus("Return");
        }
        protected void lbtnUpdateContinue_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == false)
            {
                return;
            }
            lblInvalidCategory.Visible = false;
            string category = RecursiveHelper.GetAspNetTreeCheckList(tvCategory);

            if (category == "" || category == null || category.Split(',').Length > ArticlePortalSettings.General.Portal_ArticleCategorySelectCount)
            {
                lblInvalidCategory.Visible = true;
                return;
            }

            UpdateArticle();
            txtTitle.Text = "";
            txtTitle.Focus();
        }
        protected void lbtnSearch_Click(object sender, EventArgs e)
        {
            UnActive = false;
            Featured = false;
            UnAuthed = false;
            Draft = false;
            Expired = false;
            CurrentPage = 0;
            CategoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            SearchTerm = txtSearch.Text.Trim();
            BindArticleList();
        }
        protected void lbtnClear_Click(object sender, EventArgs e)
        {
            UnActive = false;
            Featured = false;
            UnAuthed = false;
            Draft = false;
            Expired = false;
            CurrentPage = 0;
            ddlCategory.SelectedValue = "-1";
            txtSearch.Text = "";
            CategoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            SearchTerm = txtSearch.Text.Trim();
            BindArticleList();
        }
        protected void lbtnDeleteSelected_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow item in gvList.Rows)
            {
                CheckBox chkItem = (CheckBox)item.FindControl("chkItem");
                if (chkItem.Checked == true)
                {
                    Label lblId = (Label)item.FindControl("lblId");
                    ArticleController.Delete(Convert.ToInt32(lblId.Text));
                }
            }
            BindArticleList();
        }
       
        protected void ctlPagingControl_PageChanged(object sender, EventArgs e)
        {
            CurrentPage = ctlPagingControl.CurrentPage;
            BindArticleList();
        }
        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ArticleId = Convert.ToInt32(e.CommandArgument);
            ArticleInfo objArticle = ArticleController.Get(ArticleId);
            switch (e.CommandName)
            {
                case "Select":
                    BindArticle(ArticleId);
                    SetButtonStatus("Select");
                    break;
                case "Copy":
                    ArticleInfo objNewArticle = objArticle;
                    objNewArticle.UserId = UserId;
                    ArticleId = ArticleController.Add(objNewArticle);
                    BindArticleList();
                    BindArticle(ArticleId);
                    SetButtonStatus("Select");
                    break;
                case "Del":
                    ArticleController.Delete(ArticleId);
                    ArticleId = -1;
                    BindArticleList();
                    break;
                case "Auth":
                    ArticleController.UpdateAuthed(ArticleId, !objArticle.Authed);
                    BindArticleList();
                    break;
                case "Active":
                    ArticleController.UpdateActive(ArticleId, !objArticle.Active);
                    BindArticleList();
                    break;
                case "Featured":
                    ArticleController.UpdateFeatured(ArticleId, !objArticle.Featured);
                    BindArticleList();
                    break;
                case "Draft":
                    ArticleController.UpdateDraft(ArticleId, !objArticle.Draft);
                    BindArticleList();
                    break;
                default:
                    break;
            }
        }

        protected void gvAttachment_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {

            int id = Convert.ToInt32(e.CommandArgument);
            AttachmentInfo ai = new AttachmentInfo();

            List<AttachmentInfo> list = AttachmentList;

            switch (e.CommandName)
            {
                case "DeleteItem":
                    list.RemoveAt(id);
                    //Minus 1
                    for (int i = id; i < list.Count; i++)
                    {
                        list[i].Id = list[i].Id - 1;
                    }

                    AttachmentList = list;
                    gvAttachment.DataSource = AttachmentList;
                    gvAttachment.DataBind();
                    break;
                default:
                    break;
            }


        }
        protected void lbtnAll_Click(object sender, EventArgs e)
        {
            CategoryId = -1;
            UnActive = false;
            Featured = false;
            UnAuthed = false;
            Draft = false;
            Expired = false;
            SearchTerm = "";
            CurrentPage = 0;
            BindArticleList();


        }
        protected void lbtnUnAuthed_Click(object sender, EventArgs e)
        {
            CategoryId = -1;
            UnActive = false;
            Featured = false;
            UnAuthed = true;
            Draft = false;
            Expired = false;
            SearchTerm = "";
            CurrentPage = 0;
            BindArticleList();
        }
        protected void lbtnUnActive_Click(object sender, EventArgs e)
        {
            CategoryId = -1;
            UnActive = true;
            Featured = false;
            UnAuthed = false;
            Draft = false;
            Expired = false;
            SearchTerm = "";
            CurrentPage = 0;
            BindArticleList();
        }
        protected void lbtnFeatured_Click(object sender, EventArgs e)
        {
            CategoryId = -1;
            UnActive = false;
            Featured = true;
            UnAuthed = false;
            Draft = false;
            Expired = false;
            SearchTerm = "";
            CurrentPage = 0;
            BindArticleList();
        }
        protected void lbtnDraft_Click(object sender, EventArgs e)
        {
            CategoryId = -1;
            UnActive = false;
            Featured = false;
            UnAuthed = false;
            Draft = true;
            Expired = false;
            SearchTerm = "";
            CurrentPage = 0;
            BindArticleList();
        }
        protected void lbtnExpired_Click(object sender, EventArgs e)
        {
            CategoryId = -1;
            UnActive = false;
            Featured = false;
            UnAuthed = false;
            Draft = false;
            Expired = true;
            SearchTerm = "";
            CurrentPage = 0;
            BindArticleList();
        }
        protected void lbtnAdminHome_Click(object sender, EventArgs e)
        {
            Response.Redirect(Globals.NavigateURL(TabId), true);
        }
        protected void btnAddAttachment_Click(object sender, EventArgs e)
        {
            
            string url = UserInfo.IsInRole(PortalSettings.AdministratorRoleName) ? ctlAttachment.Url : ctlUserAttachment.Url;

            if (url == "")//当前没有选择任何文件，直接返回
            {
                return;
            }
            FileController fc = new FileController();
            DotNetNuke.Services.FileSystem.FileInfo fi = new DotNetNuke.Services.FileSystem.FileInfo();
            DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
            DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);

            AttachmentInfo ai = new AttachmentInfo();

            if (url.StartsWith("FileID="))
            {
                fi = GetFileInfoById(url);

                if (fi != null && System.IO.File.Exists(fi.PhysicalPath))
                {
                    ai.FilePath = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + fi.FileName;

                }
            }
            List<AttachmentInfo> list = AttachmentList;
            if (list == null)
            {
                list = new List<AttachmentInfo>();

            }
            ai.Id = list.Count;//累加Id

            list.Add(ai);
            AttachmentList = list;
            gvAttachment.DataSource = AttachmentList;
            gvAttachment.DataBind();
        }

       
    }
}



