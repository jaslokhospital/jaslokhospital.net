using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Users;

public partial class Portals__default_Skins_JaslokSkin_Redirect : DotNetNuke.UI.Skins.Skin
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (UserController.GetUserByName(HttpContext.Current.User.Identity.Name).IsInRole("JaslokAdmin"))
		{
			Response.Redirect("/jaslokadmin/home");
		}
		else
		{
			Response.Redirect("/");
		}
    }
}