using DotNetNuke.Entities.Users;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

public static class Extensions
{
    public static string FullDayNames(this string day)
    {
        string _fullDayName = string.Empty;
        switch (day)
        {
            case "Mon" :
                _fullDayName = "Monday";
                break;
            case "Tue":
                _fullDayName = "Tuesday";
                break;
            case "Wed":
                _fullDayName = "Wednesday";
                break;
            case "Thu":
                _fullDayName = "Thursday";
                break;
            case "Fri":
                _fullDayName = "Friday";
                break;
            case "Sat":
                _fullDayName = "Saturday";
                break;
            case "Sun":
                _fullDayName = "Sunday";
                break;
        }
        return _fullDayName;
    }
}

public class CommonFn
{
    private const string ImageSaveKey = "Image_Save_Path";
   
    //public static string DB_Image_Save_Path = ConfigurationManager.AppSettings["DB_Image_Save_Path"].ToString();
    public static string Image_Save_Path = ConfigurationManager.AppSettings[ImageSaveKey].ToString();

    public static string domainName = "http://" + HttpContext.Current.Request.Url.Host.ToString();

    public int PassPageId;
    public const string DefaultImagePath = "/images/no_avatar.gif";
    public const string DefaultInnerpageBanner = "/images/inner-slider1.png";
    public const string BannerFolder = "\\Banner";
    public const string TestimonialFolder = "\\Testimonial";
    public const string JaslokNews = "\\JaslokNews";
    public const string AlbumFolder = "\\Album";
    public const string PhotoGalleryFolder = "\\PhotoGallery";
    public const string VideoGalleryFolder = "\\VideoGallery";
    public const string DoctorFolder = "\\Doctor";
    public const string UserGalleryFolder = "\\UsersGallery";
    public const string HealthTipsGalleryFolder = "\\HealthTipsGallery";
    public const string SeminarGalleryFolder = "\\SeminarGallery";
    public const string HomeSliderGalleryFolder = "\\HomeSliderGallery";
    public const string SpecialtiesFolder = "\\SpecialtiesGallery";
    public const string JaslokTimesImages = "\\JaslokTimesImages";
    public const string WhatsNewFile = "\\WhatsNewFile";
    public const string VideoThumbnailFolder = "\\VideoThumbnailGallery";
    public const string UploadedResumeFolder = "\\uploadedresume";
    public const string JaslokTimesPdf = "\\JaslokTimesPDF";

    public const string DbBannerFolder = "/Banner/";
    public const string DbTestimonialFolder = "/Testimonial/";
    public const string DbJaslokNewsFolder = "/JaslokNews/";
    public const string DbAlbumFolder = "/Album/";
    public const string DbPhotoGalleryFolder = "/PhotoGallery/";
    public const string DbVideoGalleryFolder = "/VideoGallery/";
    public const string DbDoctorFolder = "/Doctor/";
    public const string DbUserGalleryFolder = "/UsersGallery/";
    public const string DbHeailthTipsGalleryFolder = "/HealthTipsGallery/";
    public const string DbSeminarGalleryFolder = "/SeminarGallery/";
    public const string DbHomeSliderGalleryFolder = "/HomeSliderGallery/";
    public const string DbSpecialtiesFolder = "/SpecialtiesGallery";
    public const string DbVideoThumbnailFolder = "/VideoThumbnailGallery";
    public const string DbJaslokTimesImages = "/JaslokTimesImages";
    public const string DbSave = "/Content";
    public const string DbWhatsNew = "/WhatsNew";
    public const string DbUploadedResume = "/uploadedresume";
    public const string DbJaslokTimesPDF = "/JaslokTimesPDF";
    

    public static bool folderExists(string FolderPath, string FolderName)
    {
        if (Directory.Exists((FolderPath + FolderName).Replace("@", "")))
        {
            return true;

        }
        return false;

    }
    public static string RemoveBadCharForFolder(string f)
    {
        f = f.Replace("\"", "_");
        f = f.Replace("/", "_");
        f = f.Replace("\\", "_");
        f = f.Replace(":", "_");
        f = f.Replace("*", "_");
        f = f.Replace("?", "_");
        f = f.Replace("<", "_");
        f = f.Replace(">", "_");
        f = f.Replace("|", "_");
        f = f.Replace(" ", "-");
        f = f.Replace(".", "_");
        f = f.Replace("'", "");
        f = f.Replace("%20", "_");
        f = f.Replace("@", "");
        f = f.ToLower();
        return f.ToLower();
    }
    public static String RemoveSpecialCharacters(String Value)
    {
        char[] removeSpecialChars = "$%#@!*?;:~`+=([]{}|\\'<>,^&\".".ToCharArray();
        String _returnValue = Value;
        for (int specialCharsInt = 0; specialCharsInt <= removeSpecialChars.Length - 1; specialCharsInt++)
        {
            if (Value.Contains(removeSpecialChars.GetValue(specialCharsInt).ToString()))
            {
                _returnValue = Value.Replace(removeSpecialChars.GetValue(specialCharsInt).ToString(), "-").ToString();
            }
        }
        //char[] MyChar = { 'r', 'm', '-',' ' };
        //_returnValue = _returnValue.ToLower().TrimStart(MyChar);
       
       
        _returnValue = _returnValue.ToLower().Replace(" ", "-").Replace(":", "").Replace("'", "").Replace("--", "-").Replace("(", "-").Replace("/", "-").Replace(",", "-").Replace(")", "").Replace(".", "-");
        _returnValue = _returnValue.ToLower().Replace("mr-", "").Replace("mrs-", "").Replace("dr-", "");
        return _returnValue.ToLower().Replace("--","-");
    }

    public static void CreateFolder(string strFinalPath, string ImagesPath)
    {
        try
        {
            Directory.CreateDirectory((strFinalPath + ImagesPath).Replace("@", ""));
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    //public static class MyExtensions
    //{
    //    public static string AppendTimeStamp(this string fileName)
    //    {
    //        return string.Concat(
    //            Path.GetFileNameWithoutExtension(fileName),
    //            DateTime.Now.ToString("yyyyMMddHHmmssfff"),
    //            Path.GetExtension(fileName)
    //            );
    //    }
    //}

    public static string GetFileName(string fileName)
    {
            return string.Concat(
                RemoveBadCharForFolder(Path.GetFileNameWithoutExtension(fileName)), "-",
                DateTime.Now.ToString("yyyyMMddHHmmssfff"),
                Path.GetExtension(fileName)
                );
    }
    public static string Exists(string strSaveImagePath)
    {

        if (File.Exists(strSaveImagePath))
        {
            String filename = Path.GetFileName(strSaveImagePath);
            String path = strSaveImagePath.Substring(0, strSaveImagePath.Length - filename.Length);
            String filenameWOExt = Path.GetFileNameWithoutExtension(strSaveImagePath);
            String ext = Path.GetExtension(strSaveImagePath);
            int n = 1;
            do
            {
                strSaveImagePath = Path.Combine(path, String.Format("{0} ({1}){2}", filenameWOExt, (n++), ext));
            }
            while (File.Exists(strSaveImagePath));
        }

        return strSaveImagePath;


    }
    public static string ExistsProfileImg(string strSaveImagePathP)
    {

        if (File.Exists(strSaveImagePathP))
        {
            String filename = Path.GetFileName(strSaveImagePathP);
            String path = strSaveImagePathP.Substring(0, strSaveImagePathP.Length - filename.Length);
            String filenameWOExt = Path.GetFileNameWithoutExtension(strSaveImagePathP);
            String ext = Path.GetExtension(strSaveImagePathP);
            int n = 1;
            do
            {
                strSaveImagePathP = Path.Combine(path, String.Format("{0} ({1}){2}", filenameWOExt, (n++), ext));
            }
            while (File.Exists(strSaveImagePathP));
        }

        return strSaveImagePathP;
    }
    public static string StripHTML(string input)
    {
        return Regex.Replace(input, "<.*?>", String.Empty);
    }
    public static string TrimString(string str, int Len)
    {
        str = str.Trim();
        if (str.Length > Len + 1)
        {
            str = str.Substring(0, Len + 1);
            int cnt = str.LastIndexOf(' ');
            str = (str.Length > cnt) ? (str.Substring(0, cnt) + "...") : str;
        }
        return str;
    }
    public static string SendSMS(string contact, string message)
    {
        WebClient client = new WebClient();
        string baseurl = "http://smsapi.cellapps.com/api/v3/?method=sms&api_key=A316202f45dd36422fdbd773f33a3a44e&to=" + contact + "&sender=Jaslok&message=" + message;
        Stream data = client.OpenRead(baseurl);
        StreamReader reader = new StreamReader(data);
        string s = reader.ReadToEnd();
        data.Close();
        reader.Close();
        return s;
    }
    public static int UserID
    {
        get
        {
            int _userid = -1;
            UserInfo user = UserController.Instance.GetCurrentUserInfo();
            if (user.UserID != -1)
            {
                _userid = user.UserID;
            }
            return _userid;
        }
    }

    public static bool IsMobileDevice()
    {
        bool _isMobile = false;
        var agent = HttpContext.Current.Request.UserAgent.ToLower();
        if (agent.Contains("iphone") ||
            agent.Contains("symbianos") ||
            agent.Contains("ipad") ||
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
            int width = HttpContext.Current.Request.Browser.ScreenPixelsWidth;
            int height = HttpContext.Current.Request.Browser.ScreenPixelsHeight;

            if (HttpContext.Current.Request.Browser.IsMobileDevice && width < 720 && height < 1280)
            {
                _isMobile = true;
            }
        }
        return _isMobile;
    }
}
