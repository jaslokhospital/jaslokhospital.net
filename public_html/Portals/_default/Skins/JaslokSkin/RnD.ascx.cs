using BusinessDataLayer;
using DotNetNuke.Entities.Modules;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Portals__default_Skins_JaslokSkin_RnD : DotNetNuke.UI.Skins.Skin
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Cache["Something"] == null)
		{
			Cache["Something"] = "Text Set";
			Response.Write("From Database: " + Cache["Something"]);
			
		}
		else
		{
			Response.Write("From Cache: " + Cache["Something"]);
		}
    }
}