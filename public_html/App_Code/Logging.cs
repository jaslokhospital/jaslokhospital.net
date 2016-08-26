using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DotNetNuke.Services.Log;
using DotNetNuke.Services.Log.EventLog;
using DotNetNuke.Entities.Portals;
using System.Configuration;


/// <summary>
/// Summary description for Logging
/// </summary>
public class Logging
{
    public Logging()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    LogController dnnLogging = new LogController();
    PortalSettings objps = new PortalSettings();
    //Common.cmEmail cme = new Common.cmEmail();
    EventLogController elc = new EventLogController();


    public void LogError(Exception objmsg)
    {

        //DotNetNuke.Services.Exceptions.Exceptions.ProcessPageLoadException(objmsg);
        //
        string productVer = System.Reflection.Assembly.GetExecutingAssembly().GetName(false).Version.ToString();

        LogInfo logEntry = new LogInfo();
        logEntry.LogTypeKey = "GENERAL_EXCEPTION";
        logEntry.LogPortalID = Convert.ToInt32(objps.PortalId.ToString());
        logEntry.LogPortalName = objps.PortalName;
        logEntry.AddProperty("Custom_Exception", objmsg.ToString());
        logEntry.AddProperty("Portal Id", DotNetNuke.Entities.Portals.PortalSettings.Current.PortalAlias.PortalID.ToString());
        logEntry.AddProperty("Tab Id", DotNetNuke.Entities.Portals.PortalSettings.Current.ActiveTab.TabID.ToString());
        //log the exception details
        logEntry.AddProperty("Exception Type", objmsg.GetType().ToString());
        logEntry.AddProperty("Message", objmsg.Message);
        logEntry.AddProperty("Stack Trace", objmsg.StackTrace);
        if (objmsg.InnerException != null)
        {
            logEntry.AddProperty("Inner Exception Message", objmsg.InnerException.Message);
            logEntry.AddProperty("Inner Exception Stacktrace", objmsg.InnerException.StackTrace);
        }
        elc.AddLog(logEntry);
        /*cme.strEmailTo = ConfigurationManager.AppSettings["ErrorEmailTo"].ToString();
        cme.strEmailFrom = ConfigurationManager.AppSettings["ErrorEmailFrom"].ToString();
        string[] strSubject_And_Body = cme.createMailSubjectAndBodyforError("ErrorNotification.xml", objmsg);
        cme.strSubject = strSubject_And_Body[0];
        cme.strBody = strSubject_And_Body[1];
        cme.SendHTMLEmail();*/

        //HttpContext.Current.Response.Write(objmsg.Message);
    }

    public void clearEventLog()
    {
        elc.ClearLog();
    }


}