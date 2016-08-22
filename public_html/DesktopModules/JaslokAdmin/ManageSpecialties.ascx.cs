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

public partial class DesktopModules_JaslokAdmin_ManageSpecialties : PortalModuleBase
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
        if (!IsPostBack)
        {
            BindSpeciltyCategory();
            BindSpecialty(0);
            ViewState["Specialtyid"] = 0;
            ViewState["optype"] = "INSERT";           
        }
        objDAEntities.SelectTabId = "";
    }
    protected void BindSpeciltyCategory()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetSpecialtyCategoryDetails();

            drpspecialCategory.DataValueField = "CategoryId";
            drpspecialCategory.DataTextField = "CategoryName";


            drpspecialCategory.DataSource = ds;
            drpspecialCategory.DataBind();
            drpspecialCategory.Items.Insert(0, new ListItem("-Select-", "0"));

        }
        catch
        {
        }
    }
    protected void dgSpecialty_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        lblMessage.Visible = false;

        int Specialtyid = Convert.ToInt32(e.CommandArgument);
        ViewState["Specialtyid"] = Specialtyid;
        objDAEntities.SpecialtyId = Specialtyid;

        if (e.CommandName == "Update")
        {
            ShowAdd();
            DataSet ds = new DataSet();
            ds = (DataSet)objBusinessLogic.GetSpecialtiesDescription(Specialtyid);


            if (drpspecialCategory.Items.FindByText(Convert.ToString(ds.Tables[0].Rows[0]["CategoryName"])) != null)
            {
                drpspecialCategory.ClearSelection();
                drpspecialCategory.Items.FindByText(Convert.ToString(ds.Tables[0].Rows[0]["CategoryName"])).Selected = true;
            }

            txtSpecialtyName.Text = Convert.ToString(ds.Tables[0].Rows[0]["SpecialtyName"]);



            
            listofuploadedfiles.Value = Convert.ToString(ds.Tables[0].Rows[0]["ImageUrl"]);
            listofuploadedfilesp.Text = Convert.ToString(ds.Tables[0].Rows[0]["ImageUrl"]).Replace("/Content/SpecialtiesGallery/", "");
            //txtimageTitle.Text = ds.Tables[0].Rows[0]["ImageTitle"].ToString();
            //txtImageAltTag.Text = ds.Tables[0].Rows[0]["ImageAlt"].ToString();

            txtSpecialtyDesc.Content = Convert.ToString(ds.Tables[0].Rows[0]["About"]);
            txtFacilitiesServices.Content = Convert.ToString(ds.Tables[0].Rows[0]["Facilities"]);

            ViewState["optype"] = "UPDATE";
            btnSubmit.Text = "Update";
            //lblMessage.Visible = true;
        }
        else if (e.CommandName == "Delete")
        {
            DataSet ds = new DataSet();
            objDAEntities.optype = "DELETE";
            objBusinessLogic.UpdateDeleteSpecialties(objDAEntities);
           
            ds = (DataSet)objBusinessLogic.GetSpecialtiesDescription(Specialtyid);
            Clear();
            lblMessage.Visible = true;
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Specialty deleted successfully!!!";
            ViewState["optype"] = "INSERT";
           
            Cache.Remove(AppGlobal.SpecialityCache);
            Cache.Remove(AppGlobal.SpecialtyPage_BindSpecialtiesCache);
            Cache.Remove(AppGlobal.SpecialtyPage_BindPageDetailCache);
        }
        BindSpecialty(0);
    }

    public void Clear()
    {
        drpspecialCategory.ClearSelection();
        //txtImageAltTag.Text = "";
        //txtimageTitle.Text = "";
        listofuploadedfiles.Value = "";
        txtSpecialtyName.Text = "";
        txtSpecialtyDesc.Content = "";
        txtFacilitiesServices.Content = "";
        btnSubmit.Text = "Save";
        listofuploadedfilesp.Text = "";
        txtSearchSpecialty.Text = null;
        
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ShowView();
        Clear();
        lblMessage.Visible = false;
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
            objDAEntities.SpecialtyId = (int)ViewState["Specialtyid"];
            objDAEntities.CategoryId = Convert.ToInt32(drpspecialCategory.SelectedValue);
            objDAEntities.SpecialtyName = txtSpecialtyName.Text;
            objDAEntities.ImageUrl = listofuploadedfiles.Value;
            //objDAEntities.PhotoTitle = txtimageTitle.Text;
            //objDAEntities.AlternateText = txtImageAltTag.Text;
            objDAEntities.About = txtSpecialtyDesc.Content.Replace("&nbsp;", "");
            objDAEntities.Facilities = txtFacilitiesServices.Content.Replace("&nbsp;", "");

            lblMessage.Visible = true;
            if (ViewState["optype"].ToString() == "INSERT")
            {
                objDAEntities.CreatedByUserID = CommonFn.UserID;
                ds = (DataSet)objBusinessLogic.SaveSpecialties(objDAEntities);

                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Specialty added successfully!!!";
            }
            else if (ViewState["optype"].ToString() == "UPDATE")
            {
                objDAEntities.UpdatedByUserID = CommonFn.UserID;
                objDAEntities.optype = "UPDATE";
                objBusinessLogic.UpdateDeleteSpecialties(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Specialty updated successfully!!!";
            }
            Cache.Remove(AppGlobal.SpecialityCache);
            Cache.Remove(AppGlobal.SpecialtyPage_BindSpecialtiesCache);
            Cache.Remove(AppGlobal.SpecialtyPage_BindPageDetailCache);
            ViewState["optype"] = "INSERT";
            BindSpecialty(0);
            ShowView();
            Clear();
            lblMessage.Visible = true;
            btnSubmit.Text = "Save";
        }
        catch (Exception ex)
        {

        }
    }
    static DataSet ds = new DataSet();
    public void BindSpecialty(int Categoryid)
    {
        try
        {
            ds = null;
            ds = (DataSet)objBusinessLogic.GetSpecialtiesDetails(Categoryid);

            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgSpecialty.Visible = false;
            }
            else
            {
                lblempty.Visible = false;
                dgSpecialty.Visible = true;
                dgSpecialty.DataSource = ds;
                dgSpecialty.DataBind();
            }           
        }
        catch (Exception ex)
        {

        }
    }
    protected void drpspecialCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        int Cid =Convert.ToInt32(drpspecialCategory.SelectedValue);
        BindSpecialty(Cid);
        lblMessage.Visible = false;
    }
    //protected void dgSpecialty_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    //{
    //   
    //}
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
                //listofuploadedfiles.Text = fileName;
                if ((FileExtension.ToLower() == ".jpg" || FileExtension.ToLower() == ".png" || FileExtension.ToLower() == ".jpeg" || FileExtension.ToLower() == ".tiff" || FileExtension.ToLower() == ".gif"))
                {

                    string FolderName = CommonFn.SpecialtiesFolder;
                    string strFileNameOnly = CommonFn.GetFileName(fileName);
                    strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly;
                    UploadImages.SaveAs(strSaveImagePath);

                    strDBImagePath = CommonFn.DbSave + CommonFn.DbSpecialtiesFolder;
                    strDBImagePath = strDBImagePath + "/" + strFileNameOnly;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Images size is more than 1.03 mb=1035000!!!');", true);
            }
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Something worng!!!');", true);
        }
        return strDBImagePath;

    }
    protected void dgSpecialty_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
    {
        dgSpecialty.CurrentPageIndex = e.NewPageIndex;
       this.BindSpecialty(0);
       lblMessage.Visible = false;
    }
    protected void btnAddJaslokTimes_Click(object sender, EventArgs e)
    {
        ShowAdd();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
			DataSet ds1 = (DataSet)objBusinessLogic.GetSpecialtiesDetails(0);
            DataRow[] rowArray = ds1.Tables[0].Select("SpecialtyName like '%" + txtSearchSpecialty.Text + "%'");
            if (rowArray.Count() > 0)
            {
                DataTable dt = rowArray.CopyToDataTable();
                dgSpecialty.DataSource = dt;
                dgSpecialty.DataBind();
            }
            else
            {
                dgSpecialty.DataSource = null;
                dgSpecialty.DataBind();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}