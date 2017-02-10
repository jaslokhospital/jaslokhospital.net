using BusinessDataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DesktopModules_JaslokAdmin_ViewPaymentDetails : System.Web.UI.UserControl
{
    public CommonFn objCommonFn = new CommonFn();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    int Pram=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
            BindPaymentDetails(Pram);
        //}
    }

    public void BindPaymentDetails(int param)
    {
        try
        {
            DataSet ds = new DataSet();
            ds = null;
            objDAEntities.PageTabId = 0;

            ds = (DataSet)objBusinessLogic.GetpaymentDetails(param);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblempty.Visible = false;
                dgPaymentDetails.DataSource = ds;
                dgPaymentDetails.DataBind();
            }
        }
        catch(Exception ex)
        {
            
        }
    }
    protected void drpType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpType.SelectedItem.Text == "All Transaction")
        {
            Pram =0;
            BindPaymentDetails(Pram);
        }
        else
        {
            Pram = 1;
            BindPaymentDetails(Pram);
        }
   

    }

    protected void dgPaymentDetails_PageIndexChanging(object source, DataGridPageChangedEventArgs e)
    {
        dgPaymentDetails.CurrentPageIndex = e.NewPageIndex;
        BindPaymentDetails(Pram);
    }
}