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
        Session["optype"] = "INSERT";
        ShowAdd();
    }
    protected void Upload(object sender, EventArgs e)
    {

        try
        {
            if (!string.IsNullOrEmpty(FileUpload1.PostedFile.FileName))
            {
                listofuploadedfiles.Text = SaveImage();
                hdnThumbnail.Value = FileUpload1.PostedFile.FileName;
            }
            else
            {

                listofuploadedfiles.Text = hdnImagePath.Value.TrimStart('~');
            }

            if (!string.IsNullOrEmpty(FileUpload2.PostedFile.FileName))
            {
                listofuploadedpdffiles.Text = SavePDF();
                hdnResearchPapersPDF.Value = FileUpload2.PostedFile.FileName;
            }
            else
            {

                listofuploadedpdffiles.Text = hdnPDFPath.Value.TrimStart('~');
            }

            DataSet ds = new DataSet();
            ds = null;


            objDAEntities.Id = Convert.ToInt32(Session["Id"]);

            objDAEntities.ThumbnailImage = hdnThumbnail.Value;
            objDAEntities.ResearchPaperPDF = hdnResearchPapersPDF.Value;
            objDAEntities.ThumbnailImageURL = listofuploadedfiles.Text;
            objDAEntities.ResearchPaperPDFURL = listofuploadedpdffiles.Text;
            objDAEntities.Title = txtTitle.Text;

            if (Session["optype"].ToString() == "INSERT")
            {
                objDAEntities.CreatedBy = Convert.ToString(CommonFn.UserID);
                objDAEntities.Id = 0;
                objDAEntities.optype = "INSERT";
                objBusinessLogic.AddResearchPapers(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Research Papers save successfully!!!";
            }
            else if (Session["optype"].ToString() == "UPDATE")
            {
                objDAEntities.UpdatedByUserID = CommonFn.UserID;
                objDAEntities.optype = "UPDATE";
                ds = (DataSet)objBusinessLogic.AddResearchPapers(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Research Papers updated successfully!!!";
            }


            BindResearchPapers();
            Clear();
            ShowView();
            lblMessage.Visible = true;

        }
        catch (Exception ex)
        {

        }

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
    protected void dgResearchPapers_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        int Id = Convert.ToInt32(e.CommandArgument);
        Session["Id"] = Id;
        objDAEntities.Id = Id;
        lblMessage.Visible = true;
        Session["optype"] = "UPDATE";
        if (e.CommandName == "Update")
        {
            ShowAdd();
            DataSet ds = new DataSet();

            ds = (DataSet)objBusinessLogic.GetManageResearchPapersContent(objDAEntities);

            txtTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();

            hdnImagePath.Value = ds.Tables[0].Rows[0]["ThumbnailImageURL"].ToString();
            hdnThumbnail.Value = ds.Tables[0].Rows[0]["ThumbnailImage"].ToString();
            listofuploadedfiles.Text = hdnImagePath.Value.Replace("/Content/ResearchPaper/Images/", "");


            hdnPDFPath.Value = ds.Tables[0].Rows[0]["ResearchPaperPDFURL"].ToString();
            hdnResearchPapersPDF.Value = ds.Tables[0].Rows[0]["ResearchPaperPDF"].ToString();
            listofuploadedpdffiles.Text = hdnPDFPath.Value.Replace("/Content/ResearchPaper/", "");


        }
        if (e.CommandName == "Delete")
        {
            DataSet ds = new DataSet();
            objDAEntities.Id = Convert.ToInt32(e.CommandArgument.ToString());
            ds = (DataSet)objBusinessLogic.DeleteResearchPapers(objDAEntities);



            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Research Paper deleted successfully!!!";

        }

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
