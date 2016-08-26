﻿using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_InnerTrustees : PortalModuleBase
{

    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindInnerTrustees();           
        }
    }
    public void BindInnerTrustees()
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.optype = "Trustees";
            ds = (DataSet)objBusinessLogic.GetUserTypeAllDetails(objDAEntities);

            rptInnerTrustees.DataSource = ds;
            rptInnerTrustees.DataBind();

        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
        }
    }
   
}