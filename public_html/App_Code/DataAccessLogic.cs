using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Data;
using DotNetNuke.Entities.Users;


namespace BusinessDataLayer
{
    public class DataAccessLogic
    {

        UserInfo objInfo = UserController.Instance.GetCurrentUserInfo();
        /// <summary>
        /// Load Category
        /// </summary>
        /// <param name="SList"></param>
        /// <returns></returns>
        public DataSet GetCategory(DataAccessEntities SList)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetCategory", new object[] { SList.CategoryName });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }

        }

        public DataSet GetUserNameByMRNumber(DataAccessEntities SList)
        {

            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_uspUserUpdateSelect", new object[] {"Get User By MRNumber", SList.UserName, SList.MRNumber, SList.Email });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }

        }


        public DataSet GetMRNumberByUserName(string UserName)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_uspGetMRNO", new object[] {UserName });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;

            }

        }


        public bool IsMrNoExist(string username)
        {
            try
            {
                return Convert.ToBoolean(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_IsExistsMRNO", new object[] { username }));
            }
            catch(Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return false;
                
            }
        }

        public DataSet IsExistMRNumber(string MRNumber)
        {

            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_uspIsExistsMRNumber", new object[] { MRNumber });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        /// <summary>
        /// Load Location
        /// </summary>
        /// <param name="SList"></param>
        /// <returns></returns>
        
        public DataSet GetLocation(DataAccessEntities SList)
        {

            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetLocation", new object[] { SList.LocationName });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        //Load Position
        public DataSet GetPosition(DataAccessEntities SList)
        {

            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetPositions", new object[] { SList.PositionName });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }





        // Delete Position LoadCareerDetails
        public int DeletePositionDetails(DataAccessEntities Slist)
        {

            try
            {
                int intResult = SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), "JH_DeletePositionsByID", new object[] { Slist.PositionID });
                return intResult;
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return 0;
            }
        }

        //Add Jaslok Times Subscription
        public void AddJaslokTimesSubscription(DataAccessEntities Slist)
        {
            try
            {
                 SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), "JH_AddJaslokTimesSubscription", new object[] { Slist.Email });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
               
            }
        }



        public void DeleteJaslokTimesSubscription(int id)
        {

            try
            {
                SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), "JH_DeleteJaslokTimesSubscription", new object[] { id });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                
            }

        }
        public DataSet GetJaslokTimesSubscription(string skey)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetJaslokTimesSubscription", new object[] { skey });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        // Get Career Details
        // Start Updating By Jainendra
        public DataSet LoadCareerDetails(DataAccessEntities Slist)
        {            
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetCareerDetails", new object[] { Slist.PositionID, Slist.CategoryID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet SaveLocationAdmin(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SP_SaveAdminLocation", new object[] { Slist.newLocationName, Slist.locationidexists });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        // Created by priti on 29/09/2015 DeleteLocationAdmin
        public DataSet DeleteLocationAdmin(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SP_DeleteAdminLocation", new object[] {Slist.locationidexists });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }           
        }

        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet SaveCategoryAdmin(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SP_SaveCategoryAdmin", new object[] { Slist.CategoryName , Slist.CategoryID});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        // Created by priti on 29/09/2015 DeleteLocationAdmin
        public DataSet DeleteCategoryAdmin(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SP_DeleteCategoryAdmin", new object[] {Slist.CategoryID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet SavePositionAdmin(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SP_SaveAdminPosition", new object[] { Slist.PositionName, Slist.PositionID});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        /// <summary>
        /// Added by Bhujang - load educational program data
        /// </summary>
        /// <param name="SList"></param>
        /// <returns></returns>
        public DataSet LoadEducationalPrograms(DataAccessEntities SList)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetEducationProgramsDetails", new object[] { SList.EducationalProgram });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        public DataSet SaveEducationalPrograms(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SaveEducationPrograms", new object[] { Slist.EducationalProgram, Slist.EducationalProgramContent });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetEnquiry(DataAccessEntities SList)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetFeedbackInfo", new object[] { SList.EnquiryType});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        public DataSet GetEnquiryType()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetEnquiryddl", new object[] {});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        public DataSet GetAllEquiryGrid(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetAllEnquiryGrid", new object[] { Slist.EnquiryTypeId, Slist.EnquiryId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet DeleteEnquiryAdmin(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SP_DeleteAdminEnquiry", new object[] { Slist.EnquiryTypeId, Slist.EnquiryId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetPageType()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetPageType", new object[] {});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
       
        public DataSet GetBannerDetails(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetBanner", new object[] { Slist.PageTabId});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet SaveBanner(DataAccessEntities Slist)
        {
            try
            {
                int Id = 0;
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SaveBanner", new object[] { Slist.BannerTitle, Slist.BannerDesc, Slist.AlternateText, Slist.ImageUrl, Slist.BannerLink, Slist.PageTabId, Slist.CreatedByUserID, Id });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }



        public DataSet SaveUserDetails(string MRNO,string Username, string FName, string LName, string Email, string DisplayName, string Password, string Telephone, string Gender, string Address, string Age, string OTP)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "CREATEUSER", new object[] { Username, FName, LName, Email, DisplayName, Password, AppGlobal.PortalId, true, Gender, Address, Age, Telephone, MRNO, OTP });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        public DataSet UpdateDeleteBanner(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeleteBanner", new object[] { Slist.BannerId, Slist.BannerTitle, Slist.BannerDesc, Slist.AlternateText, Slist.ImageUrl, Slist.BannerLink, Slist.PageTabId, Slist.UpdatedByUserID, Slist.optype });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetPageDetails(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetPageDetails", new object[] { Slist.PageTabId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetPageDescription(int Pageid)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetPageDescription", new object[] { Pageid });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet Savepage(DataAccessEntities Slist)
        {
            try
            {
                int Id = 0;
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SavePage", new object[] { Slist.PageType, Slist.PageTitle, Slist.PageDesc, Slist.PageKeywords, Slist.Content, Slist.CreatedBy, Slist.PageTabId, Id });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet UpdateDeletePage(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeletePage", new object[] { Slist.PageTypeId, Slist.PageTitle, Slist.PageDesc, Slist.PageKeywords, Slist.Content, Slist.UpdatedByUserID, Slist.optype });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        public DataSet GetAlbumDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetAlbum", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetAlbumList()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetAlbumList", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet SaveAlbum(DataAccessEntities Slist)
        {
            try
            {
                int Id = 0;
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SaveAlbum", new object[] { Slist.AlbumTitle, Slist.AlbumDesc, Slist.AlbumImageUrl, Slist.AlbumImgAlternateText, Slist.AlbumType, Slist.CreatedByUserID, Id });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet UpdateDeleteAlbum(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeleteAlbum", new object[] { Slist.AlbumID, Slist.AlbumTitle, Slist.AlbumDesc, Slist.AlbumImageUrl, Slist.AlbumImgAlternateText, Slist.AlbumType, Slist.UpdatedByUserID, Slist.optype });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
       
        public DataSet GetPhotoDetailByPhotoId(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetPhotoDetailByPhotoId", new object[] { Slist.PhotoID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetPhotoDetailsByAlbumId(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetPhotoDetails", new object[] { Slist.AlbumID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet SavePhoto(DataAccessEntities Slist)
        {
            try
            {
                int Id = 0;
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SavePhoto", new object[] { Slist.PhotoTitle, Slist.PhotoDesc, Slist.PhotoImageUrl, Slist.AlbumID, Slist.CreatedByUserID, Id });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet UpdateDeletePhoto(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeletePhoto", new object[] { Slist.PhotoID, Slist.PhotoTitle, Slist.PhotoDesc, Slist.PhotoImageUrl, Slist.AlbumID, Slist.UpdatedByUserID, Slist.optype });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetVideoDetailByAlbumId(int AlbumID)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_Get_VideoDetailByAlbumId", new object[] { AlbumID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetVideoDetails(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_Get_VideoGallery", new object[] { Slist.VideoId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet SaveVideo(DataAccessEntities Slist)
        {
            try
            {
                int Id = 0;
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SaveVideo", new object[] { Slist.VideoTitle, Slist.VideoDesc, Slist.VideoUrl, Slist.ImageUrl, Slist.AlbumID, Slist.CreatedByUserID, Id });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }              
        }
        public DataSet UpdateDeleteVideo(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeleteVideo", new object[] { Slist.VideoId, Slist.VideoTitle, Slist.VideoDesc, Slist.VideoUrl, Slist.AlbumID, Slist.UpdatedByUserID, Slist.optype, Slist.ImageUrl });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }              
        }
        
        public DataSet GetTestinomialMapDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetTestinomial", new object[] {});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetTestinomialDetails(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "[dbo].[JH_GetTestinomialDetails]", new object[] { Slist.TestimonialId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        public DataSet GetTestimonialSpecialties(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "[dbo].[JH_GetTestimonialSpecialties]", new object[] { Slist.TestimonialId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        public DataSet SaveTestinomial(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SaveTestinomial", new object[] { Slist.tName, Slist.Surname, Slist.tMobileNo, Slist.EmailId, Slist.Title, Slist.Comment, Slist.tImageUrl, Slist.ProfileImageUrl, Slist.ShowOnHomePage, Slist.IsApproved, Slist.SelectTabId, Slist.TestimonialId, Slist.CreatedByUserID, Slist.UpdatedByUserID, Slist.optype });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet DeleteTestinomial(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_DeleteTestinomial", new object[] { Slist.TestimonialId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        //Speciality
        public DataSet GetSpecialtiesDetails(int Cid)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpecialtiesDetails", new object[] { Cid });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        public DataTable GetDoctorSpecialities(int DoctorId)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctorSpeciality", new object[] { DoctorId }).Tables[0];
                
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
           
        }
        public DataSet GetSpecialtiesDescription(int Specialtyid)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpecialtiesDescription", new object[] { Specialtyid });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet SaveSpecialties(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SaveSpecialties", new object[] { Slist.CategoryId, Slist.SpecialtyName, Slist.About, Slist.Facilities, Slist.ImageUrl, Slist.PhotoTitle, Slist.AlternateText, Slist.CreatedByUserID, Slist.SpecialtyBanner, Slist.PageKeywords });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }             
        }
        public void UpdateDeleteSpecialties(DataAccessEntities Slist)
        {
            try
            {
                SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeleteSpecialties", new object[] { Slist.CategoryId, Slist.SpecialtyName, Slist.About, Slist.Facilities, Slist.ImageUrl, Slist.PhotoTitle, Slist.AlternateText, Slist.UpdatedByUserID, Slist.optype, Slist.SelectTabId.Trim(','), Slist.SpecialtyId, Slist.SpecialtyBanner, Slist.PageKeywords });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                
            }             
        }
        public DataSet GetDoctoDetailbySID(int sid)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctoDetailbySID", new object[] { sid });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }             
        }

        //SpecialtyTabMapping
        public DataSet GetSpecialtyCategoryDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpecialtyCategoryDetails", new object[] {});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetSpecialtyTabMapDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpecialtyTabMapDetails", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }             
        }
        public DataSet GetTabsDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetTabsDetails", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetSpecialtiesById(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpecialtiesById", new object[] { Slist.CategoryId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        //Doctor
        public DataSet GetDoctorDetails(int DId)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctor", new object[] { DId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet SaveDoctor(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SaveDoctor", new object[] { Slist.dName, Slist.dTitle, Slist.Designation, Slist.Specialization, Slist.AreaExpertise, Slist.Briefwrite, Slist.Awards, Slist.dMobileNo, Slist.dEmailId, Slist.dPhno, Slist.dImageUrl, Slist.SelectTabId, Slist.ConsultingCharge, Slist.FollowUpCharge, Slist.CreatedByUserID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet UpdateDeleteDoctor(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeleteDoctor", new object[] { Slist.DoctorId, Slist.dName, Slist.dTitle, Slist.Designation, Slist.Specialization, Slist.AreaExpertise, Slist.Briefwrite, Slist.Awards, Slist.dMobileNo, Slist.dPhno, Slist.dEmailId, Slist.dImageUrl, Slist.UpdatedByUserID, Slist.ConsultingCharge, Slist.FollowUpCharge, Slist.optype, Slist.SelectTabId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetDoctorIdName()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctorIdName", new object[] {});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        //User
        public DataSet GetUserType()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetUserType", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetUserTypeAllDetails(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetUserTypeAllDetails", new object[] { Slist.optype });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetUserDetails(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetUsers", new object[] { Slist.UserId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public string SaveUser(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SaveUsers", new object[] { Slist.UName, Slist.UTitle, Slist.UDesignation, Slist.UEmail, Slist.UDescription, Slist.UTypeId, Slist.UImageUrl, Slist.UContactNo, Slist.UIsActive, Slist.CreatedByUserID }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet UpdateDeleteUser(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeleteUser", new object[] { Slist.UName, Slist.UTitle,Slist.UDesignation, Slist.UEmail, Slist.UDescription, Slist.UTypeId, Slist.UImageUrl, Slist.UContactNo, Slist.UIsActive, Slist.UpdatedByUserID, Slist.UserId, Slist.optype });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }

        //Doctor Mapping
        public DataSet GetDoctorById(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctorById", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }             
        }
        public DataSet GetSpecialtyMap(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpecialtyMap", new object[] { Slist.DoctorId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }            
        }
        public DataSet GetDoctorTabMapDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctorTabMapDetails", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetSpeciality(bool IsFrontEnd = false)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpeciality", new object[] { IsFrontEnd });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet AddSpecialtyMappingCtr(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_AddSpecialtyMapping", new object[] { Slist.DoctorId, Slist.SpecialtyMap });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet UpdateDeleteDoctorTab(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeleteDoctorTab", new object[] { Slist.DoctorId, Slist.dName, Slist.dTitle, Slist.Designation, Slist.Specialization, Slist.Description, Slist.dMobileNo, Slist.dEmailId, Slist.dPhno, Slist.dImageUrl, 1, Slist.optype, Slist.SelectTabId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        //Career Category
        public DataSet GetCareerCategoryDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetCareerCategoryDetails", new object[] {});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        // Career Position Dropdown
        public DataSet GetCareerPositions(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetCareerPosts", new object[] { Slist.FunctionId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        //Career Position Details for Grid  - Added By Bhujang
        public DataSet GetPositionsForListing(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetCareerPosition_ForListing", new object[] { Slist.FunctionId, Slist.JobId, Slist.jcPageSize, Slist.jcCurrentPageIndex });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        public string SaveCareerCategory(DataAccessEntities Slist)
        {
           
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SaveCareerCategory", new object[] { Slist.FunctionName, Slist.UIsActive, Slist.CreatedByUserID }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        public void UpdateDeleteCareerCategory(DataAccessEntities Slist)
        {
            try
            {
                SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeleteCareerCategory", new object[] { Slist.FunctionId, Slist.FunctionName, Slist.UIsActive, Slist.UpdatedByUserID, Slist.optype });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                
            }
        }
        //Career Position
        public DataSet GetCareerPositionDetails()
        {
            try
            {
              return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetCareerPositionDetails", new object[] {});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public string SaveCareerPosition(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SaveCareerPosition", new object[] { Slist.PositionName, Slist.FunctionId, Slist.ReportTo, Slist.Location, Slist.TotalVacantPosition, Slist.MinExp, Slist.MaxExp, Slist.Job_Role, Slist.ProfessionalRequirement, Slist.Education, Slist.ExpiryDate, Slist.Salary, Slist.SubmittedAt, Slist.IsApproved, Slist.CreatedByUserID }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public void UpdateDeleteCareerPosition(DataAccessEntities Slist)
        {
            try
            {
                SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeleteCareerPosition", new object[] { Slist.PositionName, Slist.FunctionId, Slist.ReportTo, Slist.Location, Slist.TotalVacantPosition, Slist.MinExp, Slist.MaxExp, Slist.Job_Role, Slist.ProfessionalRequirement, Slist.Education, Slist.ExpiryDate, Slist.Salary, Slist.SubmittedAt, Slist.IsApproved, Slist.UpdatedByUserID, Slist.optype, Slist.JobId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
               
            }
        }
        //DoctorSchedule
        public DataSet GetDoctorScheduleDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctorScheduleDetails", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataTable GetScheduleDetail(int DoctorScheduleId)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctorScheduleDetail", new object[] { DoctorScheduleId }).Tables[0];

            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet DSInsertUpdateDelete(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_DSInsertUpdateDelete", new object[] { Slist.DSId, Slist.DoctorId, Slist.Day, Slist.Time, Slist.Room, Slist.Action, Slist.SpecialtyId, Slist.TimeSlot, Slist.CreatedByUserID, Slist.UpdatedByUserID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetDoctorSchedule(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctorSchedule", new object[] { Slist.DoctorId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        //HealthTips
        public DataSet GetHealthTipsDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetHealthTipsDetails", new object[] {});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet SaveHealthTips(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SaveHealthTips", new object[] { Slist.HTitle, Slist.HImageUrl, Slist.HDescription, Slist.IsActive, Slist.CreatedByUserID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null; throw ex;
            }
        }
        public DataSet UpdateDeletHealthTips(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_UpdateDeleteHealthTips", new object[] { Slist.HealthTipId, Slist.HTitle, Slist.HImageUrl, Slist.HDescription, Slist.IsActive, Slist.UpdatedByUserID, Slist.optype });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        //Seminars
        public string SaveUpdateSeminars(DataAccessEntities Slist)
        {
            try
            {
                Slist.CreatedBy = "1";
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SaveUpdateSeminars", new object[] { Slist.SeminarId, Slist.Title, Slist.Day, Slist.Time, Slist.Location, Slist.Name, Slist.dPhno, Slist.Email, Slist.Brochure, Slist.TimeTOPIC, Slist.ExpiryDate, Slist.CreatedBy }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetSeminarsDetails(int Sid)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSeminarsDetails", new object[] { Sid });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public void DeleteSeminars(DataAccessEntities Slist)
        {
            try
            {
                Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_DeleteSeminars", new object[] { Slist.SeminarId }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                
            }
        }

        //SeminarForms
        public string SaveSeminarForm(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SaveSeminarForm", new object[] { Slist.SeminarId, Slist.Name, Slist.Designation, Slist.FunctionName, Slist.Location, Slist.PhoneNo, Slist.MobileNo, Slist.FaxNo, Slist.Email }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        //BookAppointment
        public DataSet GetBookAppointment(int DoctorId)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetBookAppointment", new object[] { DoctorId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public string SaveBookAppointment(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SaveBookAppointment", new object[] { Slist.SpecialtyId, Slist.DoctorId, Slist.TimeDate, Slist.Name, Slist.Day, Slist.Email, Slist.PhoneNo, Slist.MobileNo, Slist.Location, Slist.Address, Slist.Description, Slist.DoctorScheduleId,objInfo.UserID, Slist.AppointmentType }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

       
        //Home Slider
        public string SaveUpdateHomeSlider(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SaveUpdateHomeSlider", new object[] { Slist.SliderId, Slist.ImageUrl, Slist.Description, Slist.Title, Slist.RedirectLink, Slist.IsApproved, Slist.CreatedByUserID, Slist.UpdatedByUserID, Slist.optype }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetHomeSliderDetails(int SliderId)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetHomeSliderDetails", new object[] { SliderId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public void DeleteHomeSlider(DataAccessEntities Slist)
        {
            try
            {
                Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_DeleteHomeSlider", new object[] { Slist.SliderId }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                
            }
        }
        //News
        public string AddEditDeleteNews(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_AddEditDeleteNews", new object[] { Slist.NewId, Slist.NewsTitle, Slist.NewsContent, Slist.NewsDate, Slist.NewsIsActive, Slist.CreatedByUserID, Slist.Thumbnail, Slist.optype, Slist.UpdatedByUserID }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetNewsDetails(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetNewsDetails", new object[] { Slist.NewId, Slist.IsActive });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public DataSet GetCareerApplicationDetails(DataAccessEntities slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetCareerApplicationDetails", new object[] { slist.JobId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetSeminarEntries(DataAccessEntities slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSeminarEntryDetails", new object[] { slist.seminarEnryId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        //Speciality Clinic OPD Map With doctor
        public string SaveUpdateSpecialityClinicOPD(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SaveSpecialityClinicOPD", new object[] { Slist.SpecialityClinicId, Slist.SpecialtyName, Slist.SelectTabId, Slist.IsApproved, Slist.optype }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetSpecialityClinicOPD()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpecialityClinicOPD", new object[] {});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public DataSet GetActiveSpecialityClinicOPD()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetActiveSpecialityClinicsOPD", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public DataSet GetSpecialityClinicOPDDoctors()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpecialityClinicsOPDDoctors", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public DataSet GetSpecialtyDoctor(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpecialtyDoctor", new object[] { Slist.SpecialtyId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }        
        //Home testimonial
        public DataSet GetTestimonialByParm(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetTestimonialByParm", new object[] { Slist.TestimonialId, Slist.optype });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetDoctorDetailsForPage(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctorDetails", new object[] { Slist.DoctorId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public DataSet CheckUerExistence(string fsMobileNumber)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "CheckMobile_Uniquness", new object[] { fsMobileNumber });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public DataSet OTPVerification(string fsMobileNumber, string fsOTP, int fiOTPExpiration)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "OTPVerification", new object[] { fsMobileNumber, fsOTP, fiOTPExpiration });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        //Detail Inner page manage
        public DataSet GetBannerPageContentDetail(int PagetypeID)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetBannerPageContentDetail", new object[] { PagetypeID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        //Get Page TabId name
        public DataSet GetPageTabIdName()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetPageTabIdName", new object[] {});
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetCountry()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetCountry", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        // jaslok Times
        public DataSet BindJTimesCategory()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetJaslokTimesCategory", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetJaslokTimesById(int id)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetJaslokTimesById", new object[] { id });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetJaslokTimesDetails(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetJaslokTimes", new object[] { Slist.CategoryID, Slist.FileName });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataTable GetDoctorScheduleDays(int DoctorId, int SpecialityId)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "GetDoctorScheduleDays", new object[] { DoctorId, SpecialityId }).Tables[0];
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public string AddJaslokTimes(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_InsertJaslokTimes", new object[] { Slist.JaslokTimesId, Slist.CategoryId, Slist.FileName, Slist.FileFriendlyName, Slist.FilePath, Slist.PdfPath, Slist.IsActiveJaslokTimes, Slist.CreatedByUserID, Slist.UpdatedByUserID }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        public int DeleteJaslokTimes(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), "JH_DeleteJaslokTimes", new object[] { Slist.JaslokTimesId });
                            
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return 0;
            }
        }

        // Delete Whats news
        public int DeleteWhatNews(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), "JH_DeleteWhatNew", new object[] { Slist.WhatsNewId });
               
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return 0;
            }
        }


        // Whats New

        public string AddWhatsNew(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_InsertWhatsNew", new object[] { Slist.JaslokTimesId, Slist.WhatsNewTitle, Slist.IsActiveWhatsNew, Slist.FilePath, Slist.WNSummury, Slist.UserId }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        public DataSet GetWhatsNew(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetWhatsNew", new object[] { Slist.WhatsNewId, Slist.WhatsNewTitle });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        // Semminar

        public DataSet GetSeminarNameById(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetJaslokSeminars", new object[] { Slist.SeminarId, Slist.Title });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        //Feedback
        public void SaveFeedBack(DataAccessEntities Slist)
        {
            try
            {
                SqlHelper.ExecuteScalar(Config.GetConnectionString(), "jh_Forms_SaveFeedBack", new object[] { Slist.Name, Slist.Gender, Slist.PhoneNo, Slist.Email, Slist.Description });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
               
            }
        }
        public void SaveComplaint(DataAccessEntities Slist)
        {
            try
            {
                SqlHelper.ExecuteScalar(Config.GetConnectionString(), "jh_Forms_SaveComplaint", new object[] { Slist.Name, Slist.Email, Slist.Description });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                
            }
        }
        public void SaveQuickEnquiry(DataAccessEntities Slist)
        {
            try
            {
                SqlHelper.ExecuteScalar(Config.GetConnectionString(), "jh_Forms_SaveQuickEnquiry", new object[] { Slist.Name, Slist.Age, Slist.Gender, Slist.PhoneNo, Slist.Email, Slist.Description });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                
            }
        }
        public void SaveEstimate(DataAccessEntities Slist)
        {
            try
            {
                SqlHelper.ExecuteScalar(Config.GetConnectionString(), "jh_Forms_SaveEstimate", new object[] { Slist.Age, Slist.Name, Slist.Gender, Slist.Mobile, Slist.Email, Slist.Option1, Slist.Option2, Slist.Option3, Slist.Comment });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
               
            }
        }


        public string AddEditSAchievement(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_AddEditSpecialAchievement", new object[] { Slist.AchievementID, Slist.AchievementTitle, Slist.PublishedDate, Slist.AchievementSummery, Slist.CreatedBy }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        // Apply Seminars
        public string ApplySeminar(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_ApplySeminar", new object[] { Slist.SeminarId, Slist.Name, Slist.Graduate, Slist.Institution, Slist.Address, Slist.Phone, Slist.Mobile, Slist.Fax, Slist.Email }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }



        // Get Seminar

        public DataSet GetJaslokSemminars(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetJaslokSeminars", new object[] { Slist.SeminarId, Slist.Title });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        //Get Health Tips Info by Name or ID

        public DataSet GetHealthTipsInfo(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetHealthTipsInfo", new object[] { Slist.HealthTipId, Slist.Title });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }



        // Get Health Details by ID

        public DataSet GetHealthTipsDetailsById(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetHealthTipsByID", new object[] { Slist.HealthTipId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        // Get Career Post 
        public DataSet GetCareerPostAndCategory(DataAccessEntities Slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetCareerPostByJobId", new object[] { Slist.JobId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        // Save Candidate Application

        public int SaveCandidateApplication(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToInt32(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SP_SaveApplication", new object[] { Slist.FunctionId, Slist.PositionID, Slist.ApplicantFirstName, Slist.ApplicantMiddleName, Slist.ApplicantLastName, Slist.ApplicantDOB, Slist.ApplicantGender, Slist.ApplicantReligion, Slist.ApplicantNationality, Slist.ApplicantLandLineOffice, Slist.ApplicantLandLineResidance, Slist.ApplicantMobile, Slist.ApplicantEmail, Slist.ApplicantCurrentAddress, Slist.ApplicantPermanentAddress, Slist.AdditionalQualification, Slist.TotalExpInYear, Slist.TotalExpInMonth, Slist.AdditionalExpInYear, Slist.AdditionalExpInMonth, Slist.ApplicantCurrSal, Slist.ApplicantExpSal, Slist.ApplicantCVPath }));
                
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return 0;
            }
            
        }


        public string SaveWorkExpByApplicant(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), "JH_SP_AddApplicant_WorkExp", new object[] { Slist.ApplicantID, Slist.CompanyName, Slist.empDesignation, Slist.CompanyTurnOver, Slist.NoOfEmployee, Slist.JobResponsibilities, Slist.Location, Slist.FromDate, Slist.ToDate, Slist.Reporting, Slist.SalaryInlacs, Slist.ReasonForLeaving }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        // Save Applicant Qualification
        public string Save_ApplicantQualification(DataAccessEntities Slist)
        {
            try
            {
                return Convert.ToString(SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), "JH_SP_AddApplicant_Qualifications", new object[] { Slist.ApplicantID, Slist.AppQualification, Slist.AppDegree, Slist.AppUniversityName, Slist.AppSpecialization, Slist.AppPercentage_Grade }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        // Get Work Exp Details By AppId
        public DataSet GetWorkExperienceByAppId(DataAccessEntities slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetWorkExpByApplicant", new object[] { slist.ApplicantID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }


        // Get Qualificaiton Details By AppId
        public DataSet GetQualificationByAppId(DataAccessEntities slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetQualificatinByApplicant", new object[] { slist.ApplicantID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        // Get Position Info By JobId
        public DataSet GetPositionInfoByJobId(DataAccessEntities slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetPositionInfo", new object[] { slist.JobId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public DataSet GetSpecialityWiseOpd()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetSpecialityWiseOpd", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetDoctorWiseOpd()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetDoctorWiseOpd", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public DataSet GetUsersPaymentDetail()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "GetUsersPaymentDetail", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public DataSet GetBannerById(DataAccessEntities slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetBannerById", new object[] { slist.BannerId });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public bool IstimeSlotEmpty(DateTime SelectedTimeSlot, int DoctorId, int SpecialtyId)
        {
            try
            {
                return Convert.ToBoolean(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_IstimeSlotEmpty", new object[] { SelectedTimeSlot, DoctorId, SpecialtyId }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return false;
            }
            
        }
        public DataSet SaveUpdateFormsEmailDetail(DataAccessEntities slist)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_SaveUpdateFormsEmailDetail", new object[] { slist.Id, slist.FormType, slist.EmailToId, slist.EmailCCId, slist.CreatedByUserID, slist.UpdatedByUserID });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet GetFormsEmailDetail(int Id)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetFormsEmailDetail", new object[] { Id });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
        public DataSet DeleteFormsEmailDetail(int Id)
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_DeleteFormsEmailDetail", new object[] { Id });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        //BookBed
        public void SavePaymentBedSurgery(DataAccessEntities Slist)
        {
            try
            {
                 Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SavePaymentBedSurgery", new object[] { Slist.Transactionid, Slist.Tranrefid, Slist.Transtatus, Slist.Amount, Slist.FacilityName, objInfo.UserID, AppGlobal.PortalId, Slist.FacilityName, Slist.Category, Slist.AdmissionCharge, objInfo.UserID, Slist.DoctorId, Slist.BookinDateTime, Slist.JeevaStatus }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
               
            }
        }

        //BookBedDetail
        public DataSet GetBedDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetFacilitationDetails_Bed", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public DataSet GetFacilitationDetailsSurgery()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetFacilitationDetails_Surgery", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }

        public void SavePaymentBookAppointment(DataAccessEntities Slist)
        {
            try
            {
                Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_SavePaymentBookAppointment", new object[] { Slist.Transactionid, Slist.Tranrefid, Slist.Transtatus, Slist.Amount, Slist.FacilityName, objInfo.UserID, AppGlobal.PortalId, Slist.SpecialtyId, Slist.DoctorId, Slist.TimeDate, Slist.Name, Slist.Day, Slist.Email, Slist.PhoneNo, Slist.MobileNo, Slist.Location, Slist.Address, Slist.Description, Slist.DoctorScheduleId, Slist.AppointmentType }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                
            }
        }

        public bool IsUserExist(string username)
        {
            try
            {
                return Convert.ToBoolean(SqlHelper.ExecuteScalar(Config.GetConnectionString(), "JH_IsExistUser", new object[] { username }));
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return false;
            }
           
        }

        public DataSet GetBookingPaymentDetails()
        {
            try
            {
                return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "JH_GetBookingPaymentInfo", new object[] { });
            }
            catch (Exception ex)
            {
                Logging objlog = new Logging();
                objlog.LogError(ex);
                return null;
            }
        }
    }
}
