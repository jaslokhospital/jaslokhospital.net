using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public partial class Portals__default_Skins_JaslokSkin_LoginSkin : DotNetNuke.UI.Skins.Skin
{
    protected void Page_Load(object sender, EventArgs e)
    {
        contentpaneHeader.Controls.Add(LoadControl(CommonFn.IsMobileDevice() ? "~/JSControls/Mobile/MobileHeader.ascx" : "~/JSControls/Common/Header.ascx"));
    }
}