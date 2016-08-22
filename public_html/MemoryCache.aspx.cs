using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Caching;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ObjectCache cache = MemoryCache.Default;
        string fileContents = cache["filecontents"] as string;

        Response.Write("Current Time: " + DateTime.Now.ToString() + "</br>");
        if (fileContents == null)
        {
            CacheItemPolicy policy = new CacheItemPolicy();
            List<string> filePaths = new List<string>();
            filePaths.Add(Server.MapPath("~/CacheFile/MemoryCache.txt"));

            policy.ChangeMonitors.Add(new HostFileChangeMonitor(filePaths));
            fileContents = DateTime.Now.ToString();
            cache.Set("filecontents", fileContents, policy);
            Response.Write("Database Call: " + fileContents);
        }
        else
        {
            Response.Write("Cache Call: " + fileContents);
        }
    }
}