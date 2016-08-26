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

public partial class DesktopModules_JaslokAdmin_ManageSeminars : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             BindSeminars();
            ViewState["SeminarId"] = 0;
            ViewState["optype"] = "INSERT";
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (UploadImages.PostedFile.FileName != "")
            {
                listofuploadedfiles.Text = SaveImage(UploadImages.PostedFile.FileName, 1);
            }
            if (FileUploadTOPIC.PostedFile.FileName != "")
            {
                listofuploadedTimeTOPIC.Text = SaveImage(FileUploadTOPIC.PostedFile.FileName, 2);
            }
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.SeminarId = (int)ViewState["SeminarId"];
            objDAEntities.Title = txtTitle.Text;
            objDAEntities.Day = txtDateOfSeminar.Text;
            objDAEntities.Time = txtTimings.Text;
            objDAEntities.Location = txtVenue.Text;
            objDAEntities.Name = txtOfficerInCharge.Text;
            objDAEntities.dPhno = txtContact.Text;
            objDAEntities.Email = txtEmail.Text;
            objDAEntities.Brochure = listofuploadedfiles.Text;
            objDAEntities.TimeTOPIC = listofuploadedTimeTOPIC.Text;

            objDAEntities.ExpiryDate = Convert.ToString(datetimepick.SelectedDate);
            lblMessage.Visible = true;
            if (ViewState["optype"].ToString() == "INSERT")
            {
                string msg = objBusinessLogic.SaveUpdateSeminars(objDAEntities);
                if (msg != "")
                {  
                    lblMessage.CssClass = "errorlbl";
                    lblMessage.Text = "Email Id already exists";
                }
                else
                {
                    lblMessage.CssClass = "successlbl";
                    lblMessage.Text = "Data Save successfully!!!";
                }
            }
            if (ViewState["optype"].ToString() == "UPDATE")
            {
                objDAEntities.optype = "UPDATE";
                string msg = objBusinessLogic.SaveUpdateSeminars(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Data Updated successfully!!!";
            }
            BindSeminars();
            ViewState["optype"] = "INSERT";
            Clear();
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    public DataSet BindSeminars()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.SeminarId = 0;
            ds = (DataSet)objBusinessLogic.GetSeminarsDetails(objDAEntities.SeminarId);

            if (ds.Tables[0].Rows.Count == 0)
            {
                //Bind your grid here
                lblempty.Visible = true;
                dgSeminars.Visible = false;

            }
            else
            {
                lblempty.Visible = false;
                dgSeminars.Visible = true;
                dgSeminars.DataSource = ds;
                dgSeminars.DataBind();
            }
           
            return ds;
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
            return null;
        }
    }
    //public void BindSeminarDetails(int id)
    //{
    //    try
    //    {
    //        objDAEntities.CareerAppId = id;
    //        DataSet ds = new DataSet();
    //        ds = null;
    //        ds = (DataSet)objBusinessLogic.GetSeminarsDetails(objDAEntities);

    //        SeminarDetailsView.DataSource = ds;
    //        SeminarDetailsView.DataBind();
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}
    protected void dgSeminars_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        objDAEntities.SeminarId = Convert.ToInt32(e.CommandArgument);
        ViewState["SeminarId"] = objDAEntities.SeminarId;
        lblMessage.Visible = true;
        lblMessage.Text = "";
        lblMessage.CssClass = "";
        if (e.CommandName == "Update")
        {
            DataSet ds = new DataSet();
            ds = (DataSet)objBusinessLogic.GetSeminarsDetails(objDAEntities.SeminarId);

           // Label title = (Label)e.Item.Cells[1].FindControl("TITLE");
           // txtTitle.Text = e.Item.Cells[1].Text;
            txtTitle.Text = Convert.ToString(ds.Tables[0].Rows[0]["Title"]);
            txtDateOfSeminar.Text = Convert.ToString(ds.Tables[0].Rows[0]["DateOfSeminar"]);
            txtTimings.Text = Convert.ToString(ds.Tables[0].Rows[0]["Timings"]);
            txtVenue.Text = Convert.ToString(ds.Tables[0].Rows[0]["Venue"]);
            txtOfficerInCharge.Text = Convert.ToString(ds.Tables[0].Rows[0]["OfficerInCharge"]);
            txtContact.Text = Convert.ToString(ds.Tables[0].Rows[0]["Contact"]);
            txtEmail.Text = Convert.ToString(ds.Tables[0].Rows[0]["Email"]);
           

           

            listofuploadedfiles.Text = Convert.ToString(ds.Tables[0].Rows[0]["Brochure"]);
            listofuploadedTimeTOPIC.Text = Convert.ToString(ds.Tables[0].Rows[0]["TimeTOPIC"]);
            if (Convert.ToDateTime(ds.Tables[0].Rows[0]["ExpiryDate"]) > datetimepick.MinDate)
            {
                datetimepick.SelectedDate = Convert.ToDateTime(ds.Tables[0].Rows[0]["ExpiryDate"]);
                ViewState["optype"] = "UPDATE";
                btnSubmit.Text = "Update";
            }
        }
        if (e.CommandName == "Delete")
        {
            objDAEntities.optype = "DELETE";
            objBusinessLogic.DeleteSeminars(objDAEntities);           
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Record deleted successfully!!!";
            ViewState["optype"] = "INSERT";

        }
        //if (e.CommandName == "TITLE")
        //{

        //    int semid = (int)dgSeminars.DataKeys[e.Item.ItemIndex];
        //    BindSeminarDetails(semid);
        //    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "ViewDetail();", true);

        //}
        BindSeminars();
    }
    public void Clear()
    {
       txtTitle.Text="";
       txtDateOfSeminar.Text="";
       txtTimings.Text = "";
       txtVenue.Text = "";
       txtOfficerInCharge.Text = "";
       txtContact.Text = "";
       txtEmail.Text = "";
       datetimepick.SelectedDate = null;
       listofuploadedfiles.Text = "";
       listofuploadedTimeTOPIC.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected string SaveImage(string UpFileName, int flcontrolId)
    {
        string strDBImagePath = string.Empty;
        try
        {
            if (UpFileName.Length < 1035000)
            {
                string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
                string strSaveImagePath = string.Empty;
                string fileName = Path.GetFileName(UpFileName);

                string FileNameWEx = Path.GetFileNameWithoutExtension(fileName);

                FileNameWEx = objDAEntities.RemoveBadCharForFolder(FileNameWEx);

                String FileExtension = System.IO.Path.GetExtension(fileName);
               // listofuploadedfiles.Text = fileName;
                string FolderName = CommonFn.SeminarGalleryFolder;
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
                strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly + FileExtension;

                if (flcontrolId == 1)
                {
                    UploadImages.SaveAs(strSaveImagePath);
                }
                else
                {
                    FileUploadTOPIC.SaveAs(strSaveImagePath);
                }
                strDBImagePath = CommonFn.DbSave + CommonFn.DbSeminarGalleryFolder;
                strDBImagePath = strDBImagePath + strFileNameOnly;
            }
            else
            {
                lblMessage.CssClass = "errorlbl";
                lblMessage.Text = "Images size is more than 1.035 mb!!!";
                ViewState["optype"] = "INSERT";
            }
        }
        catch(Exception ex)
        {
            lblMessage.CssClass = "errorlbl";
            lblMessage.Text = "Something worng!!!!";
            ViewState["optype"] = "INSERT";
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
        return strDBImagePath;
    }
    protected void dgSeminars_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgSeminars.CurrentPageIndex = e.NewPageIndex;
        this.BindSeminars();
    }

    //public void UploadFile(FileUpload UploadImages, string fileName, string type, string path)
    //{

    //    string Image_Save_Path = ConfigurationManager.AppSettings[type];
    //    String FileExtension = System.IO.Path.GetExtension(fileName);
    //    if (FileExtension.ToLower() == ".jpg" || FileExtension.ToLower() == ".png" || FileExtension.ToLower() == ".jpeg")
    //    {
    //        if (!System.IO.Directory.Exists(path + Image_Save_Path))
    //        {
    //            DirectoryInfo di = Directory.CreateDirectory(path + Image_Save_Path);
    //        }
    //        else
    //        {
    //            int count = 0;
    //            if (File.Exists(fileName))
    //            {
    //                fileName = fileName + "(" + count.ToString() + ").txt";
    //                count++;

    //            }
    //            DirectoryInfo di = Directory.CreateDirectory(path + Image_Save_Path);
    //            UploadImages.PostedFile.SaveAs(path + Image_Save_Path + "/" + fileName);
    //        }
    //    }
    //    else
    //    {
    //    }
    //}
    //protected void tbnFormSubmit_Click(object sender, EventArgs e)
    //{
    //    DataSet ds = new DataSet();
    //    ds = null;
    //    objDAEntities.SeminarId = 1;
    //    objDAEntities.Name = txtName.Text;
    //    objDAEntities.Designation = txtConsultant.Text;
    //    objDAEntities.FunctionName = txtInstitution.Text;
    //    objDAEntities.Location = txtAddress.Text;
    //    objDAEntities.PhoneNo = txtPhone.Text;
    //    objDAEntities.MobileNo = txtMobile.Text;
    //    objDAEntities.FaxNo = txtfax.Text;
    //    objDAEntities.Email = txtFormEmail.Text;

    //    string msg = objBusinessLogic.SaveSeminarForm(objDAEntities);
    //    if (msg == "Semimar does not exists")
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Seminar does not exists');", true);
    //    }
    //    else
    //    {
    //        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Data Save successfully!!!');", true);            
    //    }
        

    //}
    //protected void btnFormReset_Click(object sender, EventArgs e)
    //{

    //}
}