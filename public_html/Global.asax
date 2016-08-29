<%@ Application Inherits="DotNetNuke.Web.Common.Internal.DotNetNukeHttpApplication" Language="C#" %>
<script RunAt="server">
    public void Application_BeginRequest(object sender, EventArgs e)
    {
        string rawURL = HttpContext.Current.Request.RawUrl.ToLower();

        string agent = Request.UserAgent.ToLower();
        int width = Request.Browser.ScreenPixelsWidth;
        int height = Request.Browser.ScreenPixelsHeight;
        
        if (agent.Contains("iphone") ||
            agent.Contains("symbianos") ||
            //agent.Contains("ipad") ||
            agent.Contains("ipod") ||
            agent.Contains("android") ||
            agent.Contains("blackberry") ||
            agent.Contains("samsung") ||
            agent.Contains("nokia") ||
            agent.Contains("windows ce") ||
            agent.Contains("sonyericsson") ||
            agent.Contains("webos") ||
            agent.Contains("wap") ||
            agent.Contains("motor") ||
            agent.Contains("symbian"))
        {
            
            if (Request.RawUrl == "/")
            {
                if (Request.Browser.IsMobileDevice && width < 720 && height < 1280)
                {
                    redirect301("/mobilehome");
                }
            }
            
        }
        else if (Request.RawUrl == "/mobilehome")
        {
            if (!Request.Browser.IsMobileDevice)
            {
                redirect301("/");
            }
        }


        Redirect301 objRedirect = Redirect301.GetRedirect(rawURL);
        if (objRedirect != null)
        {
            redirect301(objRedirect.NewUrl);
        }
    }
    private void redirect301(string path)
    {
        HttpContext.Current.Response.Status = "301 Moved Permanently";
        HttpContext.Current.Response.AddHeader("Location", path);
    }
</script>