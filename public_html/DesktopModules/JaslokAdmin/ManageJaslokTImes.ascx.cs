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

public partial class DesktopModules_JaslokAdmin_ManageJaslokTImes : PortalModuleBase
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
        lblMessage.CssClass = "";
        lblMessage.Text = "";
        if (!Page.IsPostBack)
        {
            GetJaslokTimesDetails();
        }
    }

    public void GetJaslokTimesDetails()
    {

        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.CategoryID = 0;
            objDAEntities.FileName = "";

            ds = (DataSet)objBusinessLogic.GetJaslokTimesById(0);

            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                //lblempty.Visible = true;
                dgJHTimes.Visible = false;

            }
            else
            {
                //lblempty.Visible = false;
                dgJHTimes.Visible = true;
                dgJHTimes.DataSource = ds;
                dgJHTimes.DataBind();
            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {

            objDAEntities.FileFriendlyName = txtFriendlyName.Text;
            objDAEntities.IsActiveJaslokTimes = chkFileActive.Checked;
            objDAEntities.JaslokTimesId = Convert.ToInt32(hdnid.Value);

            if (fileUploadJaslokTimes.PostedFile.FileName != "")
            {
                //lblfileName.Text = fileUploadJaslokTimes.PostedFile.FileName;
                objDAEntities.FilePath = savefile(fileUploadJaslokTimes, CommonFn.JaslokTimesImages, CommonFn.DbJaslokTimesImages);
            }
            else
            {
                objDAEntities.FileName = hdnFileName.Value;
                objDAEntities.FilePath = hdnFilePath.Value;
            }
            if (fileUploadpdf.PostedFile.FileName != "")
            {
                // lblfdfName.Text = fileUploadpdf.PostedFile.FileName;
                objDAEntities.PdfPath = savefile(fileUploadpdf, CommonFn.JaslokTimesPdf, CommonFn.DbJaslokTimesPDF);
            }
            else
            {
                objDAEntities.PdfPath = hdnPdfPath.Value;
                //objDAEntities.FilePath = hdnFilePath.Value;
            }
            if (hdnid.Value == "0")
            {
                objDAEntities.CreatedByUserID = CommonFn.UserID;
                objBusinessLogic.AddJaslokTimes(objDAEntities);
                Clear();
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Jaslok time added successfully!!!";
                GetJaslokTimesDetails();

            }
            else
            {
                objDAEntities.UpdatedByUserID = CommonFn.UserID;
                objBusinessLogic.AddJaslokTimes(objDAEntities);
                Clear();
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Jaslok time updated successfully!!!";
                GetJaslokTimesDetails();

            }
            ShowView();
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }

    private void fillControl(int id)
    {
        DataSet ds = new DataSet();
        ds = null;
        ds = (DataSet)objBusinessLogic.GetJaslokTimesById(id);
        if (ds != null)
        {
            hdnid.Value = Convert.ToString(ds.Tables[0].Rows[0]["JaslokTimesId"]);
            txtFriendlyName.Text = Convert.ToString(ds.Tables[0].Rows[0]["FileFriendlyName"]);
            hdnFilePath.Value = Convert.ToString(ds.Tables[0].Rows[0]["FilePath"]);
            lblfileName.Text = Convert.ToString(ds.Tables[0].Rows[0]["FilePath"]).Replace("/Content/JaslokTimesImages/", "");
            hdnFileName.Value = Convert.ToString(ds.Tables[0].Rows[0]["FileName"]);
            lblfdfName.Text = Convert.ToString(ds.Tables[0].Rows[0]["PdfPath"]).Replace("/Content/JaslokTimesPDF/", "");
            hdnPdfPath.Value = Convert.ToString(ds.Tables[0].Rows[0]["PdfPath"]);
            chkFileActive.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsActiveJaslokTimes"]);
            rfvFileName.Enabled = false;
            rfvfileUploadpdf.Visible = false;
        }
    }

    protected void dgJHTimes_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "JTDelete")
        {
            objDAEntities.JaslokTimesId = Convert.ToInt32(e.CommandArgument);
            objBusinessLogic.DeleteJaslokTimes(objDAEntities);
            GetJaslokTimesDetails();
            Clear();
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Jaslok time deleted successfully!!!";

        }
        else if (e.CommandName == "JTEdit")
        {
            ShowAdd();
            fillControl(id);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ShowView();
        Clear();
    }

    public void Clear()
    {
        txtFriendlyName.Text = null;
        chkFileActive.Checked = false;
        lblfileName.Text = null;
        lblfdfName.Text = null;
        hdnid.Value = "0";
        hdnFilePath.Value = null;
        hdnFileName.Value = null;
        hdnPdfPath.Value = null;
        rfvFileName.Enabled = true;
        rfvfileUploadpdf.Visible = true;
    }

    protected void btnAddJaslokTimes_Click(object sender, EventArgs e)
    {
        ShowAdd();
    }
    public string savefile(FileUpload Uploadedfile, string folderName, string dbPath)
    {
        string rtnPath = null;
        if (Uploadedfile.HasFile)
        {
            string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
            string strSaveImagePath = string.Empty;
            string fileName = Path.GetFileName(Uploadedfile.PostedFile.FileName);
            string FileNameWEx = Path.GetFileNameWithoutExtension(fileName);
            string strDBImagePath;
            FileNameWEx = objDAEntities.RemoveBadCharForFolder(FileNameWEx);
            String FileExtension = System.IO.Path.GetExtension(fileName);
            // listofuploadedfiles.Text = fileName;
            // string FolderName = folderName;
            string strFileNameOnly = CommonFn.GetFileName(FileNameWEx);

            strSaveImagePath = strServerPath + folderName + "\\" + strFileNameOnly + FileExtension;
            Uploadedfile.SaveAs(strSaveImagePath);

            objDAEntities.UserId = 1;
            if (Uploadedfile.UniqueID == fileUploadJaslokTimes.UniqueID)
                objDAEntities.FileName = strFileNameOnly + FileExtension;
            // objDAEntities.FilePath = strSaveImagePath;

            strDBImagePath = CommonFn.DbSave + dbPath;
            rtnPath = strDBImagePath + "/" + strFileNameOnly + FileExtension;

        }
        else
        {
            lblMessage.CssClass = "errorlbl";
            lblMessage.Text = "Images size is more than 1.035 mb!!!";
            ViewState["optype"] = "INSERT";

        }
        return rtnPath;
    }
}