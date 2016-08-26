using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class JSControls_Home_PhotoGallery : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();

    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPhoto();
        }
    }
    public void BindPhoto()
    {
        try
        {
           
            DataSet ds = new DataSet();
            ds = null;
            //objDAEntities.PhotoID = AppGlobal.PhotoID;
            ds = (DataSet)objBusinessLogic.GetPhotoDetailByPhotoId(objDAEntities);

            if (ds.Tables.Count > 0)
            {
                //imgfirst.Src = ds.Tables[0].Rows[0]["PhotoImageUrl"].ToString();

                //ds.Tables[0].Rows[0].Delete();
                //ds.AcceptChanges();
		if (ds.Tables[0].Rows.Count > 0)
                {
		    DataTable dt = ds.Tables[0].AsEnumerable().Take(5).CopyToDataTable();
                    rptPhotogallery.DataSource = dt;
                    rptPhotogallery.DataBind();
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
