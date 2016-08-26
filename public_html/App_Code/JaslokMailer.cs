using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Web;
using System.Xml;

/// <summary>
/// Summary description for JaslokMailer
/// </summary>
public class JaslokMailer
{
    public String Body;
    public String FromEmailAddress;
    public String ToEmailAddress;
    public String Subject;
    public String FileName;

	public JaslokMailer()
	{
		
	}

    public string SendEmail(string FileName, List<EmailParaMeters> lstParameters, string fsEmailAddress, string CcMailId = "")
    {
        try
        {
            EmailBody(FileName, lstParameters);
            MailMessage msg = new MailMessage();
            msg.To.Add(fsEmailAddress);
            if (!string.IsNullOrEmpty(CcMailId))
                msg.CC.Add(CcMailId);
            
            msg.Subject = this.Subject;
            msg.Body = this.Body;
            msg.IsBodyHtml = true;
            msg.Priority = MailPriority.High;
            msg.From = new MailAddress(this.FromEmailAddress);
            SmtpClient smtp = new SmtpClient("smtp.jaslokhospital.net", 25);
            smtp.Credentials = new System.Net.NetworkCredential("online@jaslokhospital.net", "jIKe%W*cK8");
         
            smtp.EnableSsl = false;
            //smtp.EnableSsl = true;
          //tls
           smtp.Send(msg);
           return "";
        }
        catch (Exception ex)
        {
            Logging objlog = new Logging();
            objlog.LogError(ex);
            return null;          
        }
        
    }

    public void EmailBody(string FileName, List<EmailParaMeters> lstParameters)
    {
        XmlDocument doc = new XmlDocument();
        doc.Load(System.Web.HttpContext.Current.Server.MapPath("~/EmailTemlates/" + FileName + ".xml"));
        XmlNode Subjectnode = doc.DocumentElement.SelectSingleNode("/emailcontent/subject");
        this.Subject = Subjectnode.InnerText.Trim();

        XmlNode BodyNode = doc.DocumentElement.SelectSingleNode("/emailcontent/content");
        this.Body = BodyNode.InnerText.Trim();

        XmlNode FromNode = doc.DocumentElement.SelectSingleNode("/emailcontent/from");
        this.FromEmailAddress = FromNode.InnerText.Trim();

        if (lstParameters.Count > 0)
        {
            foreach(EmailParaMeters objParameters in lstParameters)
            {
                this.Body = this.Body.Replace("[" + objParameters.ShortCodeName + "]", objParameters.ShortCodeValue);
            }
        }
    }
}

public class EmailParaMeters
{
    public string ShortCodeName { get; set; }
    public string ShortCodeValue { get; set; }
}