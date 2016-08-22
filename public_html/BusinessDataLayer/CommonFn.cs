using DotNetNuke.Entities.Users;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusinessDataLayer
{
    public class CommonFn 
    {
        //public void UploadFile(FileUpload UploadImages, string fileName, string type, string path)
        //{

        //    string Image_Save_Path = ConfigurationManager.AppSettings[type];
        //    String FileExtension = System.IO.Path.GetExtension(fileName);
        //    if (FileExtension.ToLower() == ".jpg" || FileExtension.ToLower() == ".png" || FileExtension.ToLower() == ".jpeg")
        //    {
        //        if (!System.IO.Directory.Exists(path + Image_Save_Path))
        //        {
        //            DirectoryInfo di = Directory.CreateDirectory(path + Image_Save_Path);
        //        }
        //        else
        //        {
        //            int count = 0;
        //            if (File.Exists(fileName))
        //            {
        //                fileName = fileName + "(" + count.ToString() + ").txt";
        //                count++;
                       
        //            }
        //            DirectoryInfo di = Directory.CreateDirectory(path + Image_Save_Path);
        //            UploadImages.PostedFile.SaveAs(path + Image_Save_Path + "/" + fileName);
        //            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('File Uploaded successfully!!!');", true);
                    
        //        }
        //    }
        //    else
        //    {
        //        //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Images only .gif, .jpg, .png, .tiff and .jpeg this format!!!');", true);
        //    }
        //}
       
        private const string ImageSaveKey = "Image_Save_Path";

        //public static string DB_Image_Save_Path = ConfigurationManager.AppSettings["DB_Image_Save_Path"].ToString();
        public static string Image_Save_Path = ConfigurationManager.AppSettings[ImageSaveKey].ToString();
       
        public static string domainName = "http://" + HttpContext.Current.Request.Url.Host.ToString();

        public const string BannerFolder = "\\Banner";
        public const string TestimonialFolder = "\\Testimonial";
        public const string AlbumFolder = "\\Album";
        public const string PhotoGalleryFolder = "\\PhotoGallery";
        public const string VideoGalleryFolder = "\\VideoGallery";
        public const string DoctorFolder = "\\Doctor";
        public const string UserGalleryFolder = "\\UsersGallery";

        public const string DbBannerFolder = "/banner/";
        public const string DbTestimonialFolder = "/testimonial/";
        public const string DbAlbumFolder = "/album/";
        public const string DbPhotoGalleryFolder = "/photoGallery/";
        public const string DbVideoGalleryFolder = "/videoGallery/";
        public const string DbDoctorFolder = "/doctor/";
        public const string DbUserGalleryFolder = "/usersGallery/";


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
          public static string RemoveBadCharForFolderGallery(string f)
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
    }
}