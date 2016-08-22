using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Users;
using DotNetNuke.Security;
using DotNetNuke.Security.Membership;
using DotNetNuke.Security.Roles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Portals__default_Skins_JaslokSkin_JaslokWhatsNew : DotNetNuke.UI.Skins.Skin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string currentUrl = Request.RawUrl;

        if (currentUrl.Contains("jaslokadmin/home"))
        {
            // FooterSection.Visible = true;
            Footer.Visible = false;
        }
        if (currentUrl.Contains("jaslokadmin/manageenquiry"))
        {
            // Footer.Visible = false;
        }
    }
}