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

public partial class DesktopModules_JaslokAdmin_ManageWhatsNew : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //GetWhatsNew();
        }
    }

    public void GetWhatsNew()
    {

        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.WhatsNewId = 0;
            objDAEntities.WhatsNewTitle = "";
            ds = (DataSet)objBusinessLogic.GetWhatsNew(objDAEntities);

            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                //lblempty.Visible = true;
                dgWhatsNew.Visible = false;

            }
            else
            {
                ////lblempty.Visible = false;
                dgWhatsNew.Visible = true;
                dgWhatsNew.DataSource = ds;
                dgWhatsNew.DataBind();
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
            if (fileUploadWNew.PostedFile.FileName != "")
            {
                lblfileName.Text = fileUploadWNew.PostedFile.FileName;

                if (fileUploadWNew.PostedFile.FileName.Length < 1035000)
                {
                    string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
                    string strSaveImagePath = string.Empty;
                    string fileName = Path.GetFileName(lblfileName.Text);

                    string FileNameWEx = Path.GetFileNameWithoutExtension(fileName);

                    string strDBImagePath;


                    FileNameWEx = objDAEntities.RemoveBadCharForFolder(FileNameWEx);

                    String FileExtension = System.IO.Path.GetExtension(fileName);
                    // listofuploadedfiles.Text = fileName;
                    string FolderName = CommonFn.WhatsNewFile;
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
                    string strFileNameOnly = CommonFn.GetFileName(FileNameWEx);
                    strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly + "_" + DateTime.Now.Ticks + FileExtension;

                    fileUploadWNew.SaveAs(strSaveImagePath);

                    objDAEntities.WhatsNewId = 0;
                    //objDAEntities.FileName = strFileNameOnly + FileExtension + "_" + DateTime.Now.Ticks;
                    objDAEntities.WhatsNewTitle = txtWhatsNewTitle.Text;
                    objDAEntities.IsActiveWhatsNew = chkFileActive.Checked;
                    objDAEntities.FilePath = strSaveImagePath;
                    objDAEntities.WNSummury = reWhatsNewSummary.Content.Replace("&nbsp;", "");
                    objDAEntities.UserId = 1;


                    strDBImagePath = CommonFn.DbSave + CommonFn.DbWhatsNew;
                    strDBImagePath = strDBImagePath + strFileNameOnly;

                    objBusinessLogic.AddWhatsNew(objDAEntities);

                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Data saved successfully!!!";
                    lblMessage.Visible = true;

                    Clear();

                    //GetWhatsNew();
                }
                else
                {
                    lblMessage.CssClass = "errorlbl";
                    lblMessage.Text = "Images size is more than 1.035 mb!!!";
                    ViewState["optype"] = "INSERT";
                    lblMessage.Visible = true;
                }

            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
        lblMessage.Visible = false;
    }

    public void Clear()
    {
        txtWhatsNewTitle.Text = "";
        chkFileActive.Checked = false;
        reWhatsNewSummary.Content = "";
        lblfileName.Text = "";

    }


    protected void dgWhatsNew_ItemCommand(object sender, DataGridCommandEventArgs e)
    {
        lblMessage.Visible = false;

        int id = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "WNDelete")
        {
            objDAEntities.WhatsNewId = Convert.ToInt32(e.CommandArgument);
            objBusinessLogic.DeleteWhatNews(objDAEntities);
            GetWhatsNew();

            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Data deleted successfully!!!";
            lblMessage.Visible = true;
        }       
    }


}