using DotNetNuke.Common.Utilities;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for Redirect301
/// </summary>
public class Redirect301
{
    public string OldUrl { get; set; }
    public string NewUrl { get; set; }

	public Redirect301()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static Redirect301 GetRedirect(string OldUrl)
    {
        return (Redirect301)CBO.FillObject(SqlHelper.ExecuteReader(ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString, "Redirect301_GetRedirect", new object[] { OldUrl }), typeof(Redirect301));
    }
}