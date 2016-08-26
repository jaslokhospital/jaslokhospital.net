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

public partial class DesktopModules_JaslokAdmin_ManageUsers : PortalModuleBase
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
            BindUserType();
            BindUsers(0);
            ViewState["UserId"] = 0;
            ViewState["optype"] = "INSERT";
            btnSubmit.Text = "Save";
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (UploadImages.PostedFile.FileName != "")
            {
                listofuploadedfiles.Value = SaveImage();
            }
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.UserId = (int)ViewState["UserId"];
            objDAEntities.UName = txtName.Text;
            objDAEntities.UTitle = string.Empty;
            objDAEntities.UDesignation = txtDesignation.Text;
            objDAEntities.UDescription = reUser.Text;
            objDAEntities.UTypeId = Convert.ToInt32(ddlUserType.SelectedValue);
            objDAEntities.UContactNo = string.Empty;
            objDAEntities.UEmail = string.Empty;
            objDAEntities.UIsActive = ckbIsActive.Checked;
            objDAEntities.UImageUrl = listofuploadedfiles.Value;
            lblMessage.Visible = true;
            if (ViewState["optype"].ToString() == "INSERT")
            {
                objDAEntities.CreatedByUserID = CommonFn.UserID;
                objBusinessLogic.SaveUser(objDAEntities);
                //if (msg != "")
                //{
                //    lblMessage.CssClass = "errorlbl";
                //    lblMessage.Text = "Email Id already exists!!!";
                //}
                //else
                //{
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "User Added Successfully!!!";
                //}
            }
            else if (ViewState["optype"].ToString() == "UPDATE")
            {
                objDAEntities.UpdatedByUserID = CommonFn.UserID;
                objDAEntities.optype = "UPDATE";
                ds = (DataSet)objBusinessLogic.UpdateDeleteUser(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "User Updated Successfully!!!";
            }
            BindUsers(0);
            ViewState["optype"] = "INSERT";
            ShowView();
            //}
            //else
            //{
            //    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please select and upload  file!!!');", true);
            //}
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    public DataSet BindUsers(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.UserId = id;
            ds = (DataSet)objBusinessLogic.GetUserDetails(objDAEntities);

            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgUsers.Visible = false;

            }
            else
            {
                lblempty.Visible = false;
                dgUsers.Visible = true;
                dgUsers.DataSource = ds;
                dgUsers.DataBind();
            }

            return ds;
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    protected void dgUsers_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        objDAEntities.UserId = Convert.ToInt32(e.CommandArgument);
        ViewState["UserId"] = objDAEntities.UserId;
        lblMessage.Visible = false;
        if (e.CommandName == "Update")
        {
            ShowAdd();
            DataSet ds = new DataSet();
            txtName.Text = e.Item.Cells[1].Text;
            if (ddlUserType.Items.FindByText(e.Item.Cells[2].Text) != null)
            {
                ddlUserType.ClearSelection();
                ddlUserType.Items.FindByText(e.Item.Cells[2].Text).Selected = true;
            }
            txtDesignation.Text = e.Item.Cells[3].Text.Replace("&nbsp;", "");
            ckbIsActive.Checked = ((e.Item.FindControl("ltStatus") as Literal).Text == "Yes") ? true : false;
            //reUser.Content = e.Item.Cells[9].Text;

            ds = (DataSet)objBusinessLogic.GetUserDetails(objDAEntities);

            //ds = BindUsersDescription(objDAEntities.UserId);
            listofuploadedfiles.Value = Convert.ToString(ds.Tables[0].Rows[0]["ImageUrl"]);
            listofuploadedfilesp.Text = listofuploadedfiles.Value.Replace("/Content/UsersGallery/", "");
            reUser.Text = Convert.ToString(ds.Tables[0].Rows[0]["Description"]);

            //hdnImagePath.Value = listofuploadedfiles.Text;


            ViewState["optype"] = "UPDATE";
            btnSubmit.Text = "Update";
        }
        else if (e.CommandName == "Delete")
        {
            DataSet ds = new DataSet();
            objDAEntities.optype = "DELETE";
            objBusinessLogic.UpdateDeleteUser(objDAEntities);
            
            ViewState["optype"] = "INSERT";
            Clear();
            lblMessage.Visible = true;
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Data deleted successfully!!!";
        }
        BindUsers(0);
    }
    public void Clear()
    {
        txtName.Text = "";
        txtDesignation.Text = "";
        reUser.Text = "";
        ckbIsActive.Checked = false;
        ddlUserType.ClearSelection();
        listofuploadedfiles.Value = "";
        listofuploadedfilesp.Text = "";
        btnSubmit.Text = "Save";
    }

    protected void BindUserType()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetUserType();

            ddlUserType.DataValueField = "UserTypeId";
            ddlUserType.DataTextField = "UserType";


            ddlUserType.DataSource = ds;
            ddlUserType.DataBind();
            ddlUserType.Items.Insert(0, new ListItem("-Select-", "0"));

        }
        catch(Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
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
            if (UploadImages.PostedFile.ContentLength < 1035000)
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

                    string FolderName = CommonFn.UserGalleryFolder;
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

                    string strFileNameOnly = CommonFn.GetFileName(fileName);
                    strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly;
                    UploadImages.SaveAs(strSaveImagePath);

                    strDBImagePath = CommonFn.DbSave + CommonFn.DbUserGalleryFolder;
                    strDBImagePath = strDBImagePath + strFileNameOnly;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Images size is more than 1.035 mb!!!');", true);
            }
        }
        catch(Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something worng!!!');", true);
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
        return strDBImagePath;
    }
    protected void dgUsers_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgUsers.CurrentPageIndex = e.NewPageIndex;
        this.BindUsers(0);
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ShowAdd();
    }
}