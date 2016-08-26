using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ManageDoctor : PortalModuleBase
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    ArrayList arraylist1 = new ArrayList();
    ArrayList arraylist2 = new ArrayList();
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
            BindDoctor(objDAEntities);
            bindSpecialtyName();
            ViewState["DoctorId"] = 0;
            ViewState["optype"] = "INSERT";
        }
    }
    private void bindSpecialtyName()
    {
        DataSet ds = new DataSet();
        ds = null;
        ds = (DataSet)objBusinessLogic.GetSpeciality();
        listspecialityAvl.DataValueField = "SpecialtyId";
        listspecialityAvl.DataTextField = "SpecialtyName";
        listspecialityAvl.DataSource = ds;
        listspecialityAvl.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (UploadImages.PostedFile.FileName != "")
            {
                listofuploadedfiles.Text = SaveImage();
                objDAEntities.dImageUrl = listofuploadedfiles.Text;
            }
            else
            {
                objDAEntities.dImageUrl = hdnImagePath.Value.TrimStart('~');
            }

            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.DoctorId = (int)ViewState["DoctorId"];
            objDAEntities.dName = txtName.Text;
            objDAEntities.dTitle = "";
            objDAEntities.Designation = txtDesignation.Text.Trim();
            objDAEntities.AreaExpertise = redoctor.Content.Trim();
            objDAEntities.Briefwrite = redBriefWriteUp.Content.Trim();
            objDAEntities.Awards = redAwards.Content.Trim();
            objDAEntities.Specialization = "";
            objDAEntities.dMobileNo = txtMob.Text;
            objDAEntities.dPhno = txtPhn.Text;
            objDAEntities.dEmailId = txtEmail.Text;
            objDAEntities.ConsultingCharge = Convert.ToInt32(txtConsultingCharge.Text);
            objDAEntities.FollowUpCharge = Convert.ToInt32(txtFollowupCharge.Text);

            for (int i = 0; i < listspecialitySel.Items.Count; i++)
            {
                objDAEntities.SelectTabId = objDAEntities.SelectTabId + "," + listspecialitySel.Items[i].Value;
            }

            lblMessage.Visible = true;
            if (ViewState["optype"].ToString() == "INSERT")
            {
                objDAEntities.CreatedByUserID = CommonFn.UserID;
                ds = (DataSet)objBusinessLogic.SaveDoctor(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Doctor added successfully!!!";
            }
            else if (ViewState["optype"].ToString() == "UPDATE")
            {
                objDAEntities.UpdatedByUserID = CommonFn.UserID;
                objDAEntities.optype = "UPDATE";
                ds = (DataSet)objBusinessLogic.UpdateDeleteDoctor(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Doctor updated successfully!!!";
            }
            Cache.Remove(AppGlobal.SpecialityDoctorCache);
            Cache.Remove(AppGlobal.DoctorsNameCache);

            ViewState["optype"] = "INSERT";
            BindDoctor(objDAEntities);
            ShowView();
            Clear();

        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    static DataSet ds = new DataSet();
    public void BindDoctor(DataAccessEntities Slist)
    {
        try
        {


            ds = null;
            objDAEntities.DoctorId = 0;
            ds = (DataSet)objBusinessLogic.GetDoctorDetails(objDAEntities.DoctorId);

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblempty.Visible = true;
                dgDoctor.Visible = false;
            }
            else
            {
                lblempty.Visible = false;
                dgDoctor.Visible = true;
                dgDoctor.DataSource = ds;
                dgDoctor.DataBind();
            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    protected void dgDoctor_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            ShowAdd();
            lblMessage.Visible = false;
            int DoctorId = Convert.ToInt32(e.CommandArgument);
            objDAEntities.DoctorId = DoctorId;
            ViewState["DoctorId"] = DoctorId;
            ViewState["optype"] = "UPDATE";
            DataSet ds = new DataSet();
            ds = (DataSet)objBusinessLogic.GetDoctorDetailsForPage(objDAEntities);
            txtName.Text = Convert.ToString(ds.Tables[0].Rows[0]["Name"]);
            txtMob.Text = Convert.ToString(ds.Tables[0].Rows[0]["MobileNo"]);
            txtPhn.Text = Convert.ToString(ds.Tables[0].Rows[0]["PhoneNo"]);
            txtEmail.Text = Convert.ToString(ds.Tables[0].Rows[0]["EmailId"]);
            //txtTitle.Text = Convert.ToString(ds.Tables[0].Rows[0]["Title"]);
            txtDesignation.Text = Convert.ToString(ds.Tables[0].Rows[0]["Designation"]);
            //txtSpecialization.Text = Convert.ToString(ds.Tables[0].Rows[0]["Specialization"]);
            redoctor.Content = Convert.ToString(ds.Tables[0].Rows[0]["Description"]);
            redBriefWriteUp.Content = Convert.ToString(ds.Tables[0].Rows[0]["BriefWriteUp"]);
            redAwards.Content = Convert.ToString(ds.Tables[0].Rows[0]["Awards"]);
            hdnImagePath.Value = Convert.ToString(ds.Tables[0].Rows[0]["ImageUrl"]);
            listofuploadedfiles.Text = hdnImagePath.Value.Replace("/Content/Doctor/", "");
            txtConsultingCharge.Text = Convert.ToString(ds.Tables[0].Rows[0]["ConsultingCharge"]);	
            txtFollowupCharge.Text = Convert.ToString(ds.Tables[0].Rows[0]["FollowUpCharge"]);

            listspecialitySel.DataSource = ds.Tables[2];
            listspecialitySel.DataValueField = "SpecialityId";
            listspecialitySel.DataTextField = "SpecialtyName";

            listspecialitySel.DataBind();

            if (listspecialitySel.Items.Count > 0)
            {
                for (int i = 0; i < listspecialitySel.Items.Count; i++)
                {
                    listspecialityAvl.Items.Remove(listspecialitySel.Items[i]);
                }
            }


        }
        else if (e.CommandName == "Delete")
        {
            DataSet ds = new DataSet();
            objDAEntities.optype = "DELETE";
            int DoctorId = Convert.ToInt32(e.CommandArgument);
            objDAEntities.DoctorId = DoctorId;
            ds = (DataSet)objBusinessLogic.UpdateDeleteDoctor(objDAEntities);
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Doctor deleted successfully!!!";
            ViewState["optype"] = "INSERT";
            listspecialitySel.ClearSelection();
            Clear();
            Cache.Remove(AppGlobal.SpecialityDoctorCache);
            Cache.Remove(AppGlobal.DoctorsNameCache);

        }
        BindDoctor(objDAEntities);
    }
    public void Clear()
    {
        txtName.Text = "";
        txtDesignation.Text = "";
        redoctor.Content = "";
        redAwards.Content = "";
        redBriefWriteUp.Content = "";
        //txtSpecialization.Text = "";
        txtPhn.Text = "";
        txtMob.Text = "";
        txtEmail.Text = "";
        //txtTitle.Text = "";
        listofuploadedfiles.Text = "";
        listspecialityAvl.ClearSelection();
        listspecialitySel.Items.Clear();
        hdnImagePath.Value = null;
        txtConsultingCharge.Text = null;	
        txtFollowupCharge.Text = null;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ShowView();
        Clear();
        lblMessage.Visible = false;
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
            string FolderName = CommonFn.DoctorFolder;
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
                strDBImagePath = CommonFn.DbSave + CommonFn.DbDoctorFolder;
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
    protected void dgDoctor_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgDoctor.CurrentPageIndex = e.NewPageIndex;
        this.BindDoctor(objDAEntities);
    }
    protected void btnAddSpecialty_Click(object sender, EventArgs e)
    {
        if (listspecialityAvl.SelectedIndex >= 0)
        {
            for (int i = 0; i < listspecialityAvl.Items.Count; i++)
            {
                if (listspecialityAvl.Items[i].Selected)
                {
                    listspecialitySel.Items.Add(listspecialityAvl.Items[i]);
                    listspecialityAvl.Items.Remove(listspecialityAvl.Items[i]);
                    i = i - 1;
                }
            }
        }
    }
    protected void btnAddAll_Click(object sender, EventArgs e)
    {
        while (listspecialityAvl.Items.Count != 0)
        {
            for (int i = 0; i < listspecialityAvl.Items.Count; i++)
            {
                listspecialitySel.Items.Add(listspecialityAvl.Items[i]);
                listspecialityAvl.Items.Remove(listspecialityAvl.Items[i]);
            }
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        lbselectedSpecialtyRemove();

    }
    public void lbselectedSpecialtyRemove()
    {
        try
        {
            if (listspecialitySel.SelectedIndex >= 0)
            {
                for (int i = 0; i < listspecialitySel.Items.Count; i++)
                {
                    if (listspecialitySel.Items[i].Selected)
                    {
                        if (!arraylist1.Contains(listspecialitySel.Items[i]))
                        {
                            arraylist1.Add(listspecialitySel.Items[i]);
                        }
                    }
                }
                for (int i = 0; i < arraylist1.Count; i++)
                {
                    if (!listspecialityAvl.Items.Contains(((ListItem)arraylist1[i])))
                    {
                        listspecialityAvl.Items.Add(((ListItem)arraylist1[i]));
                    }
                    listspecialitySel.Items.Remove(((ListItem)arraylist1[i]));
                }
                listspecialityAvl.SelectedIndex = -1;
            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    protected void btnRemoveAll_Click(object sender, EventArgs e)
    {
        try
        {
            while (listspecialitySel.Items.Count != 0)
            {
                for (int i = 0; i < listspecialitySel.Items.Count; i++)
                {
                    listspecialityAvl.Items.Add(listspecialitySel.Items[i]);
                    listspecialitySel.Items.Remove(listspecialitySel.Items[i]);
                }
            }
        }

        catch(Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            DataRow[] rowArray = ds.Tables[0].Select("Name like '%" + txtSearchDoctor.Text + "%'");
            if (rowArray.Count() > 0)
            {
                DataTable dt = rowArray.CopyToDataTable();
                dgDoctor.DataSource = dt;
                dgDoctor.DataBind();
            }
            else
            {
                dgDoctor.DataSource = null;
                dgDoctor.DataBind();
            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    protected void btnAddJaslokTimes_Click(object sender, EventArgs e)
    {
        ShowAdd();
    }
}