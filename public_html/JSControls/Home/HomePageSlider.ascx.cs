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



public partial class JSControls_Home_HomePageSlider : System.Web.UI.UserControl
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindHomeSlider();
    }
    public void BindHomeSlider()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            int id = 0;
            ds = (DataSet)objBusinessLogic.GetHomeSliderDetails(id);


            rptHomeSlide.DataSource = ds;
            rptHomeSlide.DataBind();

        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
    
}