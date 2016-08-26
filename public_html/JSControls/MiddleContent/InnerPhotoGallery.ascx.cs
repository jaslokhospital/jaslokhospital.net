using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_InnerPhotoGallery : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindAlbum();
         BindPhotoGallery();           
        }
    }
    public void BindAlbum()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            ds = (DataSet)objBusinessLogic.GetAlbumList();

            dlAlbumCategory.DataValueField = "AlbumId";
            dlAlbumCategory.DataTextField = "AlbumTitle";

            dlAlbumCategory.DataSource = ds;
            dlAlbumCategory.DataBind();
            dlAlbumCategory.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    public void BindPhotoGallery()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.AlbumID = Convert.ToInt32(dlAlbumCategory.SelectedValue);
            ds = (DataSet)objBusinessLogic.GetPhotoDetailsByAlbumId(objDAEntities);

            rptPHOTOGALLERY.DataSource = ds;
            rptPHOTOGALLERY.DataBind();

            lblNoRec.Visible = (rptPHOTOGALLERY.Items.Count > 0) ? false : true;

        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        BindPhotoGallery();           
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        dlAlbumCategory.ClearSelection();
        BindPhotoGallery();           
    }
}