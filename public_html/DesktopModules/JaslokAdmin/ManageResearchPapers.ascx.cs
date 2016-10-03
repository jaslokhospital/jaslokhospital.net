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
using System.Data.SqlClient;
using DotNetNuke;
using DotNetNuke.Entities.Modules;

public partial class DesktopModules_JaslokAdmin_ManageResearchPapers : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    private DataSet dsResearchPapers = new DataSet();
    string strSavePDFPath = string.Empty;
    string strSaveImagePath = string.Empty;


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
            BindResearchPapers();

    }
    public void BindResearchPapers()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            dsResearchPapers = (DataSet)objBusinessLogic.GetResearchPapersPageContentDetail();

            dgResearchPapers.DataSource = dsResearchPapers;
            dgResearchPapers.DataBind();

        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ShowAdd();
    }
    protected void Upload(object sender, EventArgs e)
    {

        try
        {
            if (FileUpload1.PostedFile.FileName != "")
            {
                listofuploadedfiles.Text = SaveImage();
                hdnThumbnail.Value = FileUpload1.PostedFile.FileName;
            }
            else
            {
                rfvFileUpload1.Visible = false;
                listofuploadedfiles.Text = hdnImagePath.Value.TrimStart('~');
            }

            if (FileUpload2.PostedFile.FileName != "")
            {
                listofuploadedpdffiles.Text = SavePDF();
                hdnResearchPapersPDF.Value = FileUpload2.PostedFile.FileName;
            }
            else
            {
                rfvFileUpload2.Visible = false;
                listofuploadedpdffiles.Text = hdnPDFPath.Value.TrimStart('~');
            }



            //objDAEntities.CreatedBy = "1";
            objDAEntities.CreatedBy = Convert.ToString(CommonFn.UserID);
            objDAEntities.ThumbnailImage = hdnThumbnail.Value;
            objDAEntities.ResearchPaperPDF = hdnResearchPapersPDF.Value;
            objDAEntities.ThumbnailImageURL = listofuploadedfiles.Text;
            objDAEntities.ResearchPaperPDFURL = listofuploadedpdffiles.Text;
            objDAEntities.Title = txtTitle.Text;



            objBusinessLogic.AddResearchPapers(objDAEntities);


        }
        catch (Exception ex)
        {

        }
        BindResearchPapers();
    }
    protected string SaveImage()
    {

        string strDBImagePath = string.Empty;
        try
        {
            if (FileUpload1.PostedFile.FileName != null)
            {
                string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
                string strSaveImagePath = string.Empty;
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                string FileNameWEx = Path.GetFileNameWithoutExtension(fileName);

                FileNameWEx = objDAEntities.RemoveBadCharForFolder(FileNameWEx);

                String FileExtension = System.IO.Path.GetExtension(fileName);

                if ((FileExtension.ToLower() == ".jpg" || FileExtension.ToLower() == ".png" || FileExtension.ToLower() == ".jpeg" || FileExtension.ToLower() == ".tiff" || FileExtension.ToLower() == ".gif"))
                {

                    string FolderName = CommonFn.ResearchPaperThumbnail;
                    if (!CommonFn.folderExists(strServerPath, FolderName))
                    {
                        try
                        {
                            CommonFn.CreateFolder(strServerPath, FolderName);
                        }
                        catch { }
                    }

                    strSaveImagePath = strServerPath + FolderName + "\\" + FileNameWEx + FileExtension;
                    FileUpload1.SaveAs(strSaveImagePath);

                    strDBImagePath = CommonFn.DbSave + CommonFn.DbResearchPaperThumbnailFolder;
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
            throw ex;
        }
        return strDBImagePath;


    }
    protected string SavePDF()
    {

        string strDBPDFPath = string.Empty;
        try
        {
            if (FileUpload2.PostedFile.FileName != null)
            {
                string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
                string strSaveImagePath = string.Empty;
                string fileName = Path.GetFileName(FileUpload2.PostedFile.FileName);

                string FileNameWEx = Path.GetFileNameWithoutExtension(fileName);

                FileNameWEx = objDAEntities.RemoveBadCharForFolder(FileNameWEx);

                String FileExtension = System.IO.Path.GetExtension(fileName);

                if ((FileExtension.ToLower() == ".pdf"))
                {

                    string FolderName = CommonFn.ResearchPaperPdf;
                    if (!CommonFn.folderExists(strServerPath, FolderName))
                    {
                        try
                        {
                            CommonFn.CreateFolder(strServerPath, FolderName);
                        }
                        catch { }
                    }

                    strSaveImagePath = strServerPath + FolderName + "\\" + FileNameWEx + FileExtension;
                    FileUpload1.SaveAs(strSaveImagePath);

                    strDBPDFPath = CommonFn.DbSave + CommonFn.DbResearchPaperPDF;
                    strDBPDFPath = strDBPDFPath + FileNameWEx + FileExtension;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('pdf size is more than 10.00 mb!!!');", true);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return strDBPDFPath;



    }
    public void Clear()
    {

        listofuploadedfiles.Text = "";
        listofuploadedpdffiles.Text = "";
        lblMessage.Visible = false;

    }
    protected void dgTesti_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        lblMessage.Visible = true;
        if (e.CommandName == "Delete")
        {
            DataSet ds = new DataSet();
            objDAEntities.optype = "DELETE";
            objDAEntities.Id = Convert.ToInt32(e.CommandArgument.ToString());
            ds = (DataSet)objBusinessLogic.DeleteResearchPapers(objDAEntities);
            ViewState["optype"] = "DELETE";


            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Research Paper deleted successfully!!!";

        }
        Cache.Remove(AppGlobal.HomeTestimonialCache);
        BindResearchPapers();
    }
    protected void dgResearchPapers_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgResearchPapers.CurrentPageIndex = e.NewPageIndex;
        this.BindResearchPapers();
    }

    protected void dgResearchPapers_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Image imgThumbnail = (Image)e.Item.FindControl("ImageUrl");
            imgThumbnail.ImageUrl = !string.IsNullOrEmpty(DataBinder.Eval(e.Item.DataItem, "ThumbnailImageURL").ToString()) ? "~" + DataBinder.Eval(e.Item.DataItem, "ThumbnailImageURL").ToString() : CommonFn.DefaultImagePath;
        }

    }

}
