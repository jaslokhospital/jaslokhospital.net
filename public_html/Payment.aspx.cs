using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke;
using DotNetNuke.Entities.Users;
using BusinessDataLayer;
using System.Security.Cryptography;
using System.IO;


public partial class Payment : System.Web.UI.Page
{
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    public string formPostUrl, vanityUrl, merchantTxnId, orderAmount, currency, UserName, returnUrl, notifyUrl, securitySignature = string.Empty, secret_key;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Need to replace the last part of URL("your-vanityUrlPart") with your Testing/Live URL

        //formPostUrl = "/comingsoon";
        //formPostUrl = "https://sandbox.citruspay.com/sslperf/jaslokhospital";
        //formPostUrl = "https://www.citruspay.com/jaslokhospital";

        string host = HttpContext.Current.Request.Url.GetComponents(UriComponents.HostAndPort, UriFormat.Unescaped);
        string _httpProtocol = host.StartsWith("www.") ? "https://" : "http://";
        if (host.StartsWith("www."))
        {
            formPostUrl = System.Configuration.ConfigurationManager.AppSettings["fromPostUrl"];

             secret_key = System.Configuration.ConfigurationManager.AppSettings["secretkey_fromPostUrl"];
        }
        else
        {
            formPostUrl = System.Configuration.ConfigurationManager.AppSettings["fromSandBoxPostUrl"];
            secret_key = System.Configuration.ConfigurationManager.AppSettings["secretkey_fromSandBoxPostUrl"];
        }

        vanityUrl = System.Configuration.ConfigurationManager.AppSettings["VanityUrl"];

        merchantTxnId = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");

        //Should be unique for every transaction
        UserInfo user = UserController.Instance.GetCurrentUserInfo();
        if (Request.QueryString["reg"] != null)
        {
            objDAEntities.FacilityName = "PermenantRegistration";
            objDAEntities.BookinDateTime = Convert.ToDateTime(DateTime.Now.ToString());
            objDAEntities.Amount = 100;
            orderAmount = Convert.ToString(objDAEntities.Amount);
            objDAEntities.Guid = System.Guid.NewGuid().ToString();
            objDAEntities.UserId = user.UserID;
            Session["Guid"] = "Reg-" + objDAEntities.Guid;
            objBusinessLogic.SaveInfoGuid(objDAEntities);
        }
       
        if (Request.QueryString["amount"] != null)
        {
            orderAmount = Request.QueryString["amount"];
            orderAmount = objBusinessLogic.Decrypt(HttpUtility.UrlDecode(orderAmount));
        }
       
        currency = "INR";
        string data = vanityUrl + orderAmount + merchantTxnId + currency;
        System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
        System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
        securitySignature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();
        
        UserName = user.Username;

        returnUrl = _httpProtocol + Request.ServerVariables["SERVER_NAME"] + "/PaymentResponse.aspx";
        
        notifyUrl = returnUrl;
    }
}