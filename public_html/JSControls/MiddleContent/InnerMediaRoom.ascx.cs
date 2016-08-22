using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_InnerMediaRoom : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindInnerMediaRoom();           
        }
    }
    public void BindInnerMediaRoom()
    {
        try
        {
            //DataSet ds = new DataSet();
            //ds = null;
            //objDAEntities.optype = "Management";
            //ds = (DataSet)objBusinessLogic.GetUserTypeAllDetails(objDAEntities);

            //rptInnerManagement.DataSource = ds;
            //rptInnerManagement.DataBind();

        }
        catch (Exception ex)
        {

        }
    }
   
}