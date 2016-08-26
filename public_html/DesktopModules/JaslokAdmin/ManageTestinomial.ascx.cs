using BusinessDataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Modules;
using System.Configuration;


public partial class DesktopModules_JaslokAdmin_ManageTestinomial : PortalModuleBase
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
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    private DataSet dsTestimonials = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindTestinomial();
            //BindSpecialty();
            ViewState["TestimonialId"] = 0;
            ViewState["optype"] = "INSERT";
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(UploadImages.PostedFile.FileName))
            {
                listofuploadedfiles.Text = SaveImage(UploadImages);
            }
            else
            {
                listofuploadedfiles.Text = hdnImagePath.Value.TrimStart('~');
            }
            if (!string.IsNullOrEmpty(ProfileImg.PostedFile.FileName))
            {
                listofuploadedfilesP.Text = SaveImage(ProfileImg);
            }
            else
            {
                listofuploadedfilesP.Text = hdnImagePathP.Value.TrimStart('~');
            }
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.TestimonialId = (int)ViewState["TestimonialId"];
            objDAEntities.tName = txtName.Text;

            objDAEntities.tMobileNo = txtMob.Text;
            objDAEntities.EmailId = txtEmail.Text;

            objDAEntities.Comment = txtComment.Text;

            objDAEntities.tImageUrl = listofuploadedfiles.Text;
            objDAEntities.ProfileImageUrl = listofuploadedfilesP.Text;

            objDAEntities.IsApproved = chkApprove.Checked;
            lblMessage.Visible = true;
            if (ViewState["optype"].ToString() == "INSERT")
            {
                objDAEntities.CreatedByUserID = CommonFn.UserID;
                objDAEntities.TestimonialId = 0;
                objDAEntities.optype = "INSERT";
                ds = (DataSet)objBusinessLogic.SaveTestinomial(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Testimonial save successfully!!!";
            }
            else if (ViewState["optype"].ToString() == "UPDATE")
            {
                objDAEntities.UpdatedByUserID = CommonFn.UserID;
                objDAEntities.optype = "UPDATE";
                ds = (DataSet)objBusinessLogic.SaveTestinomial(objDAEntities);
                lblMessage.CssClass = "successlbl";
                lblMessage.Text = "Testimonial updated successfully!!!";
            }

            Cache.Remove(AppGlobal.HomeTestimonialCache);

            ViewState["optype"] = "INSERT";
            BindTestinomial();
            Clear();
            ShowView();
            lblMessage.Visible = true;
        }

        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }

    /*public void BindSpecialty()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetSpeciality();

            lbSpecialty.DataValueField = "SpecialtyId";
            lbSpecialty.DataTextField = "SpecialtyName";

            lbSpecialty.DataSource = ds;
            lbSpecialty.DataBind();
        }
        catch (Exception ex)
        {

        }
    }*/

    public void BindTestinomial()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            dsTestimonials = (DataSet)objBusinessLogic.GetTestinomialMapDetails();

            dgTestinomial.DataSource = dsTestimonials;
            dgTestinomial.DataBind();
            ViewState["dsTestimonials"] = dsTestimonials;
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    protected void dgTesti_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        int TestimonialId = Convert.ToInt32(e.CommandArgument);
        ViewState["TestimonialId"] = TestimonialId;
        objDAEntities.TestimonialId = TestimonialId;
        lblMessage.Visible = true;
        if (e.CommandName == "Update")
        {
            ShowAdd();
            dsTestimonials = (DataSet)objBusinessLogic.GetTestinomialDetails(objDAEntities);

            txtName.Text = dsTestimonials.Tables[0].Rows[0]["NAME"].ToString();
            txtMob.Text = dsTestimonials.Tables[0].Rows[0]["MobileNo"].ToString();
            txtEmail.Text = dsTestimonials.Tables[0].Rows[0]["EmailId"].ToString();
            txtComment.Text = dsTestimonials.Tables[0].Rows[0]["Comment"].ToString();

            hdnImagePath.Value = dsTestimonials.Tables[0].Rows[0]["ImageUrl"].ToString();
            listofuploadedfiles.Text = hdnImagePath.Value.Replace("/Content/Testimonial/", "");
            hdnImagePathP.Value = dsTestimonials.Tables[0].Rows[0]["ProfileImageUrl"].ToString();
            listofuploadedfilesP.Text = hdnImagePathP.Value.Replace("/Content/Testimonial/", "");


            if (dsTestimonials.Tables[0].Rows[0]["IsApproved"].ToString() == "True")
            {
                chkApprove.Checked = true;
            }

            ViewState["optype"] = "UPDATE";
        }
        else if (e.CommandName == "Delete")
        {
            DataSet ds = new DataSet();
            objDAEntities.optype = "DELETE";
            ds = (DataSet)objBusinessLogic.DeleteTestinomial(objDAEntities);
            ViewState["optype"] = "DELETE";
           
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Record deleted successfully!!!');", true);
            lblMessage.CssClass = "successlbl";
            lblMessage.Text = "Testimonial deleted successfully!!!";
            ViewState["optype"] = "INSERT";
        }
         Cache.Remove(AppGlobal.HomeTestimonialCache);
        BindTestinomial();
    }

    public void Clear()
    {
        txtName.Text = "";
        txtMob.Text = "";
        txtEmail.Text = "";
        txtComment.Text = "";
        chkApprove.Checked = false;
        listofuploadedfiles.Text = "";
        listofuploadedfilesP.Text = "";
        lblMessage.Visible = false;

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ShowView();
    }
    protected string SaveImage(FileUpload fUpload)
    {
        string strDBImagePath = string.Empty;
        try
        {
            string strServerPath = Server.MapPath(CommonFn.Image_Save_Path);
            string strSaveImagePath = string.Empty;
            string fileName = fUpload.PostedFile.FileName;

            string FolderName = CommonFn.TestimonialFolder;

            string strFileNameOnly = CommonFn.GetFileName(fileName);

            strSaveImagePath = strServerPath + FolderName + "\\" + strFileNameOnly;

            fUpload.SaveAs(strSaveImagePath);

            strDBImagePath = CommonFn.DbSave + CommonFn.DbTestimonialFolder;
            strDBImagePath = strDBImagePath + strFileNameOnly;
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
        return strDBImagePath;
    }
    protected void dgTestinomial_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgTestinomial.CurrentPageIndex = e.NewPageIndex;
        this.BindTestinomial();
    }

    protected void dgTestinomial_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Image ImageUrl = (Image)e.Item.FindControl("ImageUrl");
            ImageUrl.ImageUrl = !string.IsNullOrEmpty(DataBinder.Eval(e.Item.DataItem, "ProfileImageUrl").ToString()) ? "~" + DataBinder.Eval(e.Item.DataItem, "ProfileImageUrl").ToString() : CommonFn.DefaultImagePath;
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        ShowAdd();
    }
}