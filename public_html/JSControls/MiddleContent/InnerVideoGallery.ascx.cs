using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class JSControls_MiddleContent_InnerVideoGallery : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindVideo(0);          
        }
    }
    
    public void BindVideo(int id)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.AlbumID = id;
            ds = (DataSet)objBusinessLogic.GetVideoDetailByAlbumId(objDAEntities);

            rptVideoGALLERY.DataSource = ds;
            rptVideoGALLERY.DataBind();

            rptinnerVideoGALLERY.DataSource = ds;
            rptinnerVideoGALLERY.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
}