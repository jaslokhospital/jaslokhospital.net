using BusinessDataLayer;
using DotNetNuke.Entities.Users;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JSControls_MiddleContent_OutStandingBillPayment : System.Web.UI.UserControl
{
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    UserInfo user = UserController.Instance.GetCurrentUserInfo();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    // user = UserController.GetUserByName(user.Username);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            DataSet dsMrNumberexist = objBusinessLogic.IsExistMRNumber(user.Username);

            if (dsMrNumberexist.Tables[0].Rows.Count <= 0 && user.Username != "host")
            {
                ContentPane.Visible = false;
                PlaceHolder1.Visible = true;
            }
            else
            {
                ContentPane.Visible = true;
                PlaceHolder1.Visible = false;
                lblPatientName.Text = user.FirstName;
                lblLastName.Text = user.LastName;
                lblMrNumber.Text = user.Username;
                lblAddress.Text = user.Profile.GetPropertyValue("Address");
                lblCountry.Text = "India";
                lblGender.Text = user.Profile.GetPropertyValue("Gender");
                lblEmail.Text = user.Email;
                lblMobile.Text = user.Profile.GetPropertyValue("PhoneNumber");

            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
           
            objDAEntities.FacilityName = "OutStanding";
            objDAEntities.MRNumber = user.Username;
            objDAEntities.BookinDateTime = Convert.ToDateTime(DateTime.Now.ToString());
            string amount = Convert.ToString(txtAmount.Value);

            Regex rgx = new Regex("[^a-zA-Z0-9 -]");

            amount = rgx.Replace(amount, "");
            amount = amount.Replace(" ", String.Empty);

            Session["Amount"] = amount;


            Session["Amount"] = amount;
            // Session["Amount"] = 10;
         

            Session["OutstandingBillPayment"] = objDAEntities;

            if (CommonFn.UserID <= 0)
            {
                
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$(document).ready(function(){showPopupWindow();});", true);

            }
            else
            {
                //Response.Redirect("/Payment.aspx",false);
                string pageurl = "/Payment.aspx";
                Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
            }

        }

        catch (Exception ex)
        {
            throw ex;
        }
    }
}