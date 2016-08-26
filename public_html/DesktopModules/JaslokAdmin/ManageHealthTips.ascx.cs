using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ManageHealthTips : PortalModuleBase
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
            BindHealthTip();

            ViewState["HealthTipId"] = 0;
            ViewState["optype"] = "INSERT";

        }
    }

    private void BindHealthTip()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetHealthTipsDetails();


            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgHealthTip.Visible = false;

            }
            else
            {
                lblempty.Visible = false;
                dgHealthTip.Visible = true;
                dgHealthTip.DataSource = ds;
                dgHealthTip.DataBind();
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
            if (UploadImages.PostedFile.FileName != "")
            {
                listofuploadedfiles.Text = SaveImage();
                objDAEntities.HImageUrl = listofuploadedfiles.Text;
            }
            else
            {
                objDAEntities.HImageUrl = hdnImagePath.Value.TrimStart('~');
            }
           
                    DataSet ds = new DataSet();
                    ds = null;
                    objDAEntities.HealthTipId = (int)ViewState["HealthTipId"];
                    objDAEntities.HTitle = txtTitle.Text;
                    objDAEntities.HDescription = txtDesc.Content;
                    
                    objDAEntities.IsActive = chkActive.Checked;
                    lblMessage.Visible = true;
                    if (ViewState["optype"].ToString() == "INSERT")
                    {
                        objDAEntities.CreatedByUserID = CommonFn.UserID;
                        ds = (DataSet)objBusinessLogic.SaveHealthTips(objDAEntities);
                       
                        lblMessage.CssClass = "successlbl";
                        lblMessage.Text = "Health tips added successfully!!!";
                    }
                    else if (ViewState["optype"].ToString() == "UPDATE")
                    {
                        objDAEntities.UpdatedByUserID = CommonFn.UserID;
                        objDAEntities.optype = "UPDATE";
                        ds = (DataSet)objBusinessLogic.UpdateDeletHealthTips(objDAEntities);
                        lblMessage.CssClass = "successlbl";
                        lblMessage.Text = "Health tips Updated successfully!!!";
                    }

                    ViewState["optype"] = "INSERT";
                    BindHealthTip();
                    ShowView();
                    Clear();
                    lblMessage.Visible = true;
                   
            }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    public void Clear()
    {
        txtTitle.Text = "";
        txtDesc.Content = "";
        listofuploadedfiles.Text = "";
        chkActive.Checked = false;
        //hdnImagePath.Value = null;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ShowView();
        Clear();
        lblMessage.Visible = false;
    }
    protected void dgHealthTip_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        lblMessage.Visible = false;
        ShowAdd();
       
        if (e.CommandName == "Update")
        {
           
           // RfvUploadImages.Visible = false;
            DataSet ds = new DataSet();
            ds = (DataSet)objBusinessLogic.GetHealthTipsDetails();
            txtTitle.Text = Convert.ToString(ds.Tables[0].Rows[0]["Title"]);

            //listofuploadedfiles.Text = e.Item.Cells[2].Text;
            //Image ImageUrl = (Image)e.Item.Cells[1].FindControl("ImageHealthTips");
            //if (ImageUrl != null)
            //{
            hdnImagePath.Value = Convert.ToString(ds.Tables[0].Rows[0]["ImageUrl"]);
                listofuploadedfiles.Text = hdnImagePath.Value.Replace("/Content/HealthTipsGallery/", "");
            //}
            txtDesc.Content = ds.Tables[0].Rows[0]["Description"].ToString();


            chkActive.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsActive"]);


            int HealthTipId = Convert.ToInt32(e.CommandArgument);        
            ViewState["HealthTipId"] = HealthTipId;
            ViewState["optype"] = "UPDATE";
        }
        else if (e.CommandName == "Delete")
        {
            DataSet ds = new DataSet();
            objDAEntities.optype = "DELETE";
            int HealthTipId = Convert.ToInt32(e.CommandArgument); 
            objDAEntities.HealthTipId = HealthTipId;
            ds = (DataSet)objBusinessLogic.UpdateDeletHealthTips(objDAEntities);
            lblMessage.Visible = true;
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Health tips deleted successfully!!!";
            ViewState["optype"] = "INSERT";
            ShowView();
        }
        BindHealthTip();
    }
    protected string SaveImage()
    {
        string strDBImagePath = string.Empty;
        try
        {
            string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
            string strSaveImagePath = string.Empty;
            string fileName = Path.GetFileName(UploadImages.PostedFile.FileName);
            String FileExtension = System.IO.Path.GetExtension(fileName);
            string FolderName = CommonFn.HealthTipsGalleryFolder;
            if ((FileExtension.ToLower() == ".jpg" || FileExtension.ToLower() == ".png" || FileExtension.ToLower() == ".jpeg" || FileExtension.ToLower() == ".tiff" || FileExtension.ToLower() == ".gif"))
            {
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
                strDBImagePath = CommonFn.DbSave + CommonFn.DbHeailthTipsGalleryFolder;
                strDBImagePath = strDBImagePath + strFileNameOnly;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Only Image file allowed!!!');", true);
            }
        }
        catch(Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
        return strDBImagePath;
    }
    protected void dgHealthTip_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgHealthTip.CurrentPageIndex = e.NewPageIndex;
        this.BindHealthTip();
        lblMessage.Visible = false;
    }
    protected void dgHealthTip_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Image ImageHealthTips = (Image)e.Item.FindControl("ImageHealthTips");
            ImageHealthTips.ImageUrl = !string.IsNullOrEmpty(DataBinder.Eval(e.Item.DataItem, "ImageUrl").ToString()) ? "~" + DataBinder.Eval(e.Item.DataItem, "ImageUrl").ToString() : CommonFn.DefaultImagePath;
            
        }
    }
    protected void btnAddHeltip_Click(object sender, EventArgs e)
    {
        lblMessage.Visible = false;
        Clear();
        ShowAdd();
    }
}