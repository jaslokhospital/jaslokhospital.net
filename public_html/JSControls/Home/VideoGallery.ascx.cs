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


public partial class JSControls_Home_VideoGallery : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindVideo();
        }
    }
    public void BindVideo()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            //objDAEntities.VideoId = AppGlobal.VideoId;
            objDAEntities.VideoId = 0;
            ds = (DataSet)objBusinessLogic.GetVideoDetails(objDAEntities);
            if (ds.Tables.Count > 0)
            {
                //imgfirst.Src = ds.Tables[0].Rows[0]["PhotoImageUrl"].ToString();

                //ds.Tables[0].Rows[0].Delete();
                //ds.AcceptChanges();
                if (ds.Tables.Count > 0)
                {
		    DataTable dt = ds.Tables[0].AsEnumerable().Take(1).CopyToDataTable();
                    rptVideogallery.DataSource = dt;
                    rptVideogallery.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    
}