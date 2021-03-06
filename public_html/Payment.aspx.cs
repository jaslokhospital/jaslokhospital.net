﻿using System;
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

       //Need to change with your Secret Key
       // string secret_key = "66fc8c3cca181b8954338bb5d5bd0cbb18b99b6d";
       // string secret_key = "ed70df7a017654499542ff0a5515812824b74142";
       //Need to change with your Vanity URL Key from the citrus panel
        
        //Should be unique for every transaction
     
        if (Request.QueryString["reg"] != null)
        {
            objDAEntities.FacilityName = "PermenantRegistration";
            objDAEntities.BookinDateTime = Convert.ToDateTime(DateTime.Now.ToString());
            //Session["permenantRegistration"] = objDAEntities;
            //Session["Amount"] = 100;
            objDAEntities.Amount = 100;
            orderAmount = Convert.ToString(objDAEntities.Amount);
            objDAEntities.Guid = System.Guid.NewGuid().ToString();
            Session["Guid"] = "Reg-"+objDAEntities.Guid;
            objBusinessLogic.SaveInfoGuid(objDAEntities);
        }
       
        if (Request.QueryString["amount"] != null)
        {
            orderAmount = Request.QueryString["amount"];
            orderAmount = objBusinessLogic.Decrypt(HttpUtility.UrlDecode(orderAmount));
        }
        //orderAmount = Session["Amount"].ToString();
        //Need to change with your Order Amount
       
        currency = "INR";
        string data = vanityUrl + orderAmount + merchantTxnId + currency;
        System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
        System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
        securitySignature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();
        UserInfo user = UserController.Instance.GetCurrentUserInfo();
        UserName = user.Username;
        //Session["Amount"] = null;

        returnUrl = _httpProtocol + Request.ServerVariables["SERVER_NAME"] + "/PaymentResponse.aspx";
        

        notifyUrl = returnUrl;
        //Response.Redirect("/PaymentResponse.aspx");
        //Response.Write("txm:" + merchantTxnId + "  " + securitySignature);
    }

}