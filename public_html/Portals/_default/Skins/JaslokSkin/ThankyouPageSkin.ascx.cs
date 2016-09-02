using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using DotNetNuke;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Portals__default_Skins_JaslokSkin_ThankyouPageSkin : DotNetNuke.UI.Skins.Skin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));

        SubRootSpan.InnerText = "Thank you";
        if (Request.QueryString["type"] == "feedback")
        {
            h3Message.InnerText = "Thank you for your feedback";
        }
        else if (Request.QueryString["type"] == "complaint")
        {
            h3Message.InnerText = "We have received your complain !!!";
        }
        else if (Request.QueryString["type"] == "quick-inquiry")
        {
            h3Message.InnerText = "We have received your inquiry, you should receive a reply or a call shortly!!!";
        }
        else if (Request.QueryString["type"] == "estimate-request")
        {
            h3Message.InnerText = "Thank you for your request, you should receive a reply or a call shortly!!!";
        }

    }
}