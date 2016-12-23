using System;
using System.Data;

namespace BusinessDataLayer
{
    public class BusinessLogic
    {

        public DataSet GetCategory(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetCategory(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet GetUserNameByMRNumber(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetUserNameByMRNumber(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }


        public DataSet GetMRNumberByUserName(string UserName)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetMRNumberByUserName(UserName);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }


        public bool IsExistMrNo(string Username)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            return objDataAccessLogic.IsMrNoExist(Username);
        }


        public bool IsExistMRNumber(string MRNumber)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
               return objDataAccessLogic.IsExistMRNumber(MRNumber);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDataAccessLogic = null;
            }
        }

        public DataSet GetLocation(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetLocation(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        // Get Position
        public DataSet GetPosition(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetPosition(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        // Delete Position
        public int DeletePositionDetails(DataAccessEntities SList)
        {

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                int intResult = objDataAccessLogic.DeletePositionDetails(SList);
                return intResult;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDataAccessLogic = null;
            }
        }

        public void AddJaslokTimesSubscription(DataAccessEntities SList)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.AddJaslokTimesSubscription(SList);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDataAccessLogic = null;
            }
        }
        public void DeleteJaslokTimesSubscription(int id)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.DeleteJaslokTimesSubscription(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDataAccessLogic = null;
            }
        }
        public DataSet GetJaslokTimesSubscription(string skey)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetJaslokTimesSubscription(skey);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        // Get Career Details
        public DataSet LoadCareerDetails(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.LoadCareerDetails(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }


        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet SaveLocationAdmin(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SaveLocationAdmin(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet DeleteLocationAdmin(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.DeleteLocationAdmin(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet SaveCategoryAdmin(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SaveCategoryAdmin(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet DeleteCategoryAdmin(DataAccessEntities SList)
        {

            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.DeleteCategoryAdmin(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet SavePositionAdmin(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SavePositionAdmin(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        /// <summary>
        /// Added by Bhujang - Get Educational Programs data
        /// </summary>
        /// <param name="SList"></param>
        /// <returns></returns>
        public DataSet LoadEducationalPrograms(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.LoadEducationalPrograms(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        /// <summary>
        /// Added by Bhujang - Save Educational Programs
        /// </summary>
        /// <param name="SList"></param>
        /// <returns></returns>
        public DataSet SaveEducationalPrograms(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SaveEducationalPrograms(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetEnquiry(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetEnquiry(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        //public DataSet SaveEnquiryAdmin(DataAccessEntities SList)
        //{
        //    DataSet dsTest = new DataSet();

        //    DataAccessLogic objDataAccessLogic = new DataAccessLogic();
        //    try
        //    {
        //        dsTest = objDataAccessLogic.SaveEnquiryType(SList);
        //        return dsTest;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        dsTest = null;
        //        objDataAccessLogic = null;
        //    }
        //}
        public DataSet GetEnquiryType()
        {

            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetEnquiryType();
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetAllEquiryGrid(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetAllEquiryGrid(Slist);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet DeleteAllEquiryAdmin(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.DeleteEnquiryAdmin(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet GetPageType()
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetPageType();
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetBannerDetails(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetBannerDetails(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet SaveBanner(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SaveBanner(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet SaveUserDetails(string MRNO, string Username, string FName, string LName, string Email, string DisplayName, string Password, string Telephone, string Gender, string Address, string Age, string OTP)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SaveUserDetails(MRNO, Username, FName, LName, Email, DisplayName, Password, Telephone, Gender, Address, Age, OTP);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }



        public bool IsUserExist(string Username)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            return objDataAccessLogic.IsUserExist(Username);
        }
        public DataSet UpdateDeleteBanner(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.UpdateDeleteBanner(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetPageDetails(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetPageDetails(Slist);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetPageDescription(int PageId)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetPageDescription(PageId);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet SavePage(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.Savepage(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet UpdateDeletePage(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.UpdateDeletePage(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetAlbumDetails()
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetAlbumDetails();
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet GetAlbumList()
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetAlbumList();
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet SaveAlbum(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SaveAlbum(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet UpdateDeleteAlbum(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.UpdateDeleteAlbum(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetPhotoDetailByPhotoId(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetPhotoDetailByPhotoId(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetPhotoDetailsByAlbumId(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetPhotoDetailsByAlbumId(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet SavePhoto(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SavePhoto(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet UpdateDeletPhoto(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.UpdateDeletePhoto(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetVideoDetailByAlbumId(int Id)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetVideoDetailByAlbumId(Id);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetVideoDetails(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetVideoDetails(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet SaveVideo(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SaveVideo(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet UpdateDeleteVideo(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.UpdateDeleteVideo(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        //Testinomial
        public DataSet GetTestinomialMapDetails()
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetTestinomialMapDetails();
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetTestinomialDetails(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetTestinomialDetails(Slist);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet GetTestimonialSpecialties(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetTestimonialSpecialties(Slist);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet SaveTestinomial(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SaveTestinomial(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet DeleteTestinomial(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.DeleteTestinomial(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        //Specialiaty
        public DataSet GetSpecialtiesDetails(int CId)
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetSpecialtiesDetails(CId);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }

        public DataTable GetDoctorSpecialities(int DoctorId)
        {
            DataTable dsSpecialties = new DataTable();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetDoctorSpecialities(DoctorId);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }

        public DataTable GetScheduleDetail(int DoctorScheduleId)
        {
            DataTable dsSeminars = new DataTable();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSeminars = objDataAccessLogic.GetScheduleDetail(DoctorScheduleId);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet GetDoctoDetailbySID(int SId)
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetDoctoDetailbySID(SId);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetSpecialtiesDescription(int Specialtyid)
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetSpecialtiesDescription(Specialtyid);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet SaveSpecialties(DataAccessEntities SList)
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.SaveSpecialties(SList);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }
        public void UpdateDeleteSpecialties(DataAccessEntities SList)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.UpdateDeleteSpecialties(SList);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }

        //SpecialtyTabMap 
        public DataSet GetSpecialtyCategoryDetails()
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetSpecialtyCategoryDetails();
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetSpecialtyTabMapDetails()
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetSpecialtyTabMapDetails();
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetTabsDetails()
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetTabsDetails();
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetSpecialtiesById(DataAccessEntities SList)
        {
            DataSet dsSpecialties = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetSpecialtiesById(SList);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        //Doctor
        public DataSet GetDoctorDetails(int DoctorId)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetDoctorDetails(DoctorId);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet SaveDoctor(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SaveDoctor(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet AddSpecialtyMappingCtr(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.AddSpecialtyMappingCtr(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet UpdateDeleteDoctor(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.UpdateDeleteDoctor(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetDoctorIdName()
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetDoctorIdName();
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        //User
        public DataSet GetUserType()
        {
            DataSet dsUserType = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsUserType = objDataAccessLogic.GetUserType();
                return dsUserType;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsUserType = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetUserTypeAllDetails(DataAccessEntities SList)
        {
            DataSet dsUser = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsUser = objDataAccessLogic.GetUserTypeAllDetails(SList);
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsUser = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetUserDetails(DataAccessEntities SList)
        {
            DataSet dsUser = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsUser = objDataAccessLogic.GetUserDetails(SList);
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsUser = null;
                objDataAccessLogic = null;
            }
        }
        public string SaveUser(DataAccessEntities SList)
        {
            string dsUser = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsUser = objDataAccessLogic.SaveUser(SList);
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsUser = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet UpdateDeleteUser(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.UpdateDeleteUser(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        //DoctorMapping
        public DataSet GetDoctorTabMapDetails()
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetDoctorTabMapDetails();
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetDoctorById(DataAccessEntities SList)
        {
            DataSet dsSpecialties = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetDoctorById(SList);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        public DataSet GetSpeciality(bool isFrontEnd = false)
        {
            DataSet dsSpecialties = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetSpeciality(isFrontEnd);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }

        public DataSet GetSpecialtyMap(DataAccessEntities SList)
        {
            DataSet dsSpecialties = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetSpecialtyMap(SList);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        public DataSet UpdateDeleteDoctorTab(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.UpdateDeleteDoctorTab(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }

        //Career Category
        public DataSet GetCareerCategoryDetails()
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetCareerCategoryDetails();
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }

        //Career Position Dropdown - Added By Bhujang
        public DataSet GetCareerPositions(DataAccessEntities SList)
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetCareerPositions(SList);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }


        //Career Position Details for Grid  - Added By Bhujang
        public DataSet GetPositionsForListing(DataAccessEntities SList)
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetPositionsForListing(SList);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }



        public string SaveCareerCategory(DataAccessEntities SList)
        {
            string dsSpecialties = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.SaveCareerCategory(SList);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }


        public void UpdateDeleteCareerCategory(DataAccessEntities SList)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.UpdateDeleteCareerCategory(SList);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }

        //Career Category
        public DataSet GetCareerPositionDetails()
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetCareerPositionDetails();
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }

        }
        public string SaveCareerPosition(DataAccessEntities Slist)
        {
            string dsSpecialties = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.SaveCareerPosition(Slist);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }
        public void UpdateDeleteCareerPosition(DataAccessEntities Slist)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.UpdateDeleteCareerPosition(Slist);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        //DoctorSchedule
        public DataSet GetDoctorScheduleDetails()
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetDoctorScheduleDetails();
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet DSInsertUpdateDelete(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.DSInsertUpdateDelete(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetDoctorSchedule(DataAccessEntities SList)
        {
            DataSet dsSpecialties = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetDoctorSchedule(SList);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;
                objDataAccessLogic = null;
            }
        }
        //HealthTips
        public DataSet GetHealthTipsDetails()
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.GetHealthTipsDetails();
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet SaveHealthTips(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.SaveHealthTips(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet UpdateDeletHealthTips(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.UpdateDeletHealthTips(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
        //Seminars
        public string SaveUpdateSeminars(DataAccessEntities Slist)
        {
            string dsSeminars = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSeminars = objDataAccessLogic.SaveUpdateSeminars(Slist);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetSeminarsDetails(int SId)
        {
            DataSet dsSeminars = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSeminars = objDataAccessLogic.GetSeminarsDetails(SId);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
                objDataAccessLogic = null;
            }
        }
        public void DeleteSeminars(DataAccessEntities Slist)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.DeleteSeminars(Slist);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        //SeminarForm
        public string SaveSeminarForm(DataAccessEntities Slist)
        {
            string dsSeminars = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSeminars = objDataAccessLogic.SaveSeminarForm(Slist);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
                objDataAccessLogic = null;
            }
        }
        //BookAppointment
        public DataSet GetBookAppointment(int Did)
        {
            DataSet dsAppointment = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsAppointment = objDataAccessLogic.GetBookAppointment(Did);
                return dsAppointment;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsAppointment = null;
                objDataAccessLogic = null;
            }

        }
        public string SaveBookAppointment(DataAccessEntities Slist)
        {
            string dsBA = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsBA = objDataAccessLogic.SaveBookAppointment(Slist);
                return dsBA;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsBA = null;
                objDataAccessLogic = null;
            }
        }

        public void SavePaymentBedSurgery(DataAccessEntities Slist)
        {
            string dsBA = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
               objDataAccessLogic.SavePaymentBedSurgery(Slist);
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsBA = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetBedDetails()
        {
            DataSet dsHomeSlider = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsHomeSlider = objDataAccessLogic.GetBedDetails();
                return dsHomeSlider;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsHomeSlider = null;
                objDataAccessLogic = null;
            }
        }
        //Home Slider
        public string SaveUpdateHomeSlider(DataAccessEntities Slist)
        {
            string dsHomeSlider = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsHomeSlider = objDataAccessLogic.SaveUpdateHomeSlider(Slist);
                return dsHomeSlider;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsHomeSlider = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetHomeSliderDetails(int Sid)
        {
            DataSet dsHomeSlider = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsHomeSlider = objDataAccessLogic.GetHomeSliderDetails(Sid);
                return dsHomeSlider;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsHomeSlider = null;
                objDataAccessLogic = null;
            }
        }
        public void DeleteHomeSlider(DataAccessEntities Slist)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.DeleteHomeSlider(Slist);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        //News
        public string AddEditDeleteNews(DataAccessEntities Slist)
        {
            string dsNews = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsNews = objDataAccessLogic.AddEditDeleteNews(Slist);
                return dsNews;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsNews = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetNewsDetails(DataAccessEntities Slist)
        {
            DataSet dsHomeSlider = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsHomeSlider = objDataAccessLogic.GetNewsDetails(Slist);
                return dsHomeSlider;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsHomeSlider = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetCareerApplicationDetails(DataAccessEntities Slist)
        {
            DataSet dsApp = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsApp = objDataAccessLogic.GetCareerApplicationDetails(Slist);
                return dsApp;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsApp = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetSeminarEntries(DataAccessEntities Slist)
        {
            DataSet dsApp = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsApp = objDataAccessLogic.GetSeminarEntries(Slist);
                return dsApp;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsApp = null;
                objDataAccessLogic = null;
            }
        }

        //Speciality Clinic OPD Map With doctor
        public string SaveUpdateSpecialityClinicOPD(DataAccessEntities Slist)
        {
            string dsHomeSlider = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsHomeSlider = objDataAccessLogic.SaveUpdateSpecialityClinicOPD(Slist);
                return dsHomeSlider;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsHomeSlider = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetSpecialityClinicOPD()
        {
            DataSet dsHomeSlider = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsHomeSlider = objDataAccessLogic.GetSpecialityClinicOPD();
                return dsHomeSlider;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsHomeSlider = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet GetActiveSpecialityClinicOPD()
        {
            DataSet dsHomeSlider = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsHomeSlider = objDataAccessLogic.GetActiveSpecialityClinicOPD();
                return dsHomeSlider;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsHomeSlider = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet GetSpecialityClinicOPDDoctors()
        {
            DataSet dsHomeSlider = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsHomeSlider = objDataAccessLogic.GetSpecialityClinicOPDDoctors();
                return dsHomeSlider;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsHomeSlider = null;
                objDataAccessLogic = null;
            }
        }
        //public void DeleteSpecialityClinicOPD(DataAccessEntities Slist)
        //{
        //    DataAccessLogic objDataAccessLogic = new DataAccessLogic();
        //    try
        //    {
        //        objDataAccessLogic.DeleteSpecialityClinicOPD(Slist);

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //}

        public DataSet GetSpecialtyDoctor(DataAccessEntities SList)
        {
            DataSet dsSpecialties = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSpecialties = objDataAccessLogic.GetSpecialtyDoctor(SList);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }

        //Home testimonial
        public DataSet GetTestimonialByParm(DataAccessEntities SList)
        {
            DataSet Testimonial = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                Testimonial = objDataAccessLogic.GetTestimonialByParm(SList);
                return Testimonial;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        public DataSet GetDoctorDetailsForPage(DataAccessEntities SList)
        {
            DataSet dsSeminars = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSeminars = objDataAccessLogic.GetDoctorDetailsForPage(SList);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
                objDataAccessLogic = null;
            }
        }

        public DataTable CheckUerExistence(string MobileNumber)
        {
            DataTable dsSeminars = new DataTable();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSeminars = objDataAccessLogic.CheckUerExistence(MobileNumber).Tables[0];
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
                objDataAccessLogic = null;
            }
        }

        public DataTable OTPVerification(string fsMobileNumber, string fsOTP, int fiOTPExpiration)
        {
            DataTable dsSeminars = new DataTable();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSeminars = objDataAccessLogic.OTPVerification(fsMobileNumber, fsOTP, fiOTPExpiration).Tables[0];
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
                objDataAccessLogic = null;
            }
        }

        //Detail Inner page manage
        public DataSet GetBannerPageContentDetail(int PageTabId)
        {
            DataSet ds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                ds = objDataAccessLogic.GetBannerPageContentDetail(PageTabId);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Get Page TabId name
        public DataSet GetPageTabIdName()
        {
            DataSet ds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                ds = objDataAccessLogic.GetPageTabIdName();
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataSet GetCountry()
        {
            DataSet ds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                ds = objDataAccessLogic.GetCountry();
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //js times
        // Jaslok Times
        public DataSet BindJTimesCategory()
        {
            DataSet jtds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                jtds = objDataAccessLogic.BindJTimesCategory();
                return jtds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        public DataSet GetJaslokTimesById(int id)
        {
            DataSet jtds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                jtds = objDataAccessLogic.GetJaslokTimesById(id);
                return jtds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        public string AddJaslokTimes(DataAccessEntities Slist)
        {
            string dsNews = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsNews = objDataAccessLogic.AddJaslokTimes(Slist);
                return dsNews;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsNews = null;
                objDataAccessLogic = null;
            }
        }


        public DataSet GetJaslokTimesDetails(DataAccessEntities SList)
        {
            DataSet jtds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                jtds = objDataAccessLogic.GetJaslokTimesDetails(SList);
                return jtds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }


        public int DeleteJaslokTimes(DataAccessEntities SList)
        {

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                int intResult = objDataAccessLogic.DeleteJaslokTimes(SList);
                return intResult;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDataAccessLogic = null;
            }
        }



        // Whats New
        public string AddWhatsNew(DataAccessEntities Slist)
        {
            string dsNews = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsNews = objDataAccessLogic.AddWhatsNew(Slist);
                return dsNews;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsNews = null;
                objDataAccessLogic = null;
            }
        }


        //Delete Whats News
        public int DeleteWhatNews(DataAccessEntities SList)
        {

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                int intResult = objDataAccessLogic.DeleteWhatNews(SList);
                return intResult;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                objDataAccessLogic = null;
            }
        }



        public DataSet GetWhatsNew(DataAccessEntities SList)
        {
            DataSet jtds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                jtds = objDataAccessLogic.GetWhatsNew(SList);
                return jtds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }


        // Semminar

        public DataSet GetJaslokSemminars(DataAccessEntities SList)
        {
            DataSet jtds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                jtds = objDataAccessLogic.GetJaslokSemminars(SList);
                return jtds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }


        public void SaveFeedBack(DataAccessEntities Slist)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.SaveFeedBack(Slist);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void SaveComplaint(DataAccessEntities Slist)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.SaveComplaint(Slist);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void SaveQuickEnquiry(DataAccessEntities Slist)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.SaveQuickEnquiry(Slist);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        // Achievement
        public string AddEditSAchievement(DataAccessEntities Slist)
        {
            string dsNews = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsNews = objDataAccessLogic.AddEditSAchievement(Slist);
                return dsNews;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsNews = null;
                objDataAccessLogic = null;
            }
        }

        // Apply Seminars
        public string ApplySeminar(DataAccessEntities Slist)
        {
            string dsSeminars = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsSeminars = objDataAccessLogic.ApplySeminar(Slist);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
                objDataAccessLogic = null;
            }
        }


        // Health Tips

        public DataSet GetHealthTipsInfo(DataAccessEntities SList)
        {
            DataSet jtds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                jtds = objDataAccessLogic.GetHealthTipsInfo(SList);
                return jtds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }

        }
        // Semminar

        public DataSet GetSeminarNameById(DataAccessEntities SList)
        {
            DataSet jtds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                jtds = objDataAccessLogic.GetSeminarNameById(SList);
                return jtds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        public DataSet GetHealthTipsDetailsById(DataAccessEntities SList)
        {
            DataSet jtds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                jtds = objDataAccessLogic.GetHealthTipsDetailsById(SList);
                return jtds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        public void SaveEstimate(DataAccessEntities SList)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.SaveEstimate(SList);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }


        // Get Career Post info
        public DataSet GetCareerPostAndCategory(DataAccessEntities SList)
        {
            DataSet jtds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                jtds = objDataAccessLogic.GetCareerPostAndCategory(SList);
                return jtds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }


        // Save Candidate Application
        public int SaveCandidateApplication(DataAccessEntities Slist)
        {
            int ApplicantID = 0;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                ApplicantID = Convert.ToInt32(objDataAccessLogic.SaveCandidateApplication(Slist));
                return ApplicantID;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ApplicantID = 0;
                objDataAccessLogic = null;
            }
        }



        // Save Work Experience by Applicant ID
        public string SaveWorkExpByApplicant(DataAccessEntities Slist)
        {
            string WorkExp = string.Empty;
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                WorkExp = objDataAccessLogic.SaveWorkExpByApplicant(Slist);
                return WorkExp;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                WorkExp = null;
                objDataAccessLogic = null;
            }
        }


        // Save Applicant Qualification
        public string Save_ApplicantQualification(DataAccessEntities Slist)
        {
            string appql = string.Empty;
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                appql = objDataAccessLogic.Save_ApplicantQualification(Slist);
                return appql;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                appql = null;
                objDataAccessLogic = null;
            }
        }



        // Get Work Exp By App ID
        public DataSet GetWorkExperienceByAppId(DataAccessEntities Slist)
        {
            DataSet dsApp = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsApp = objDataAccessLogic.GetWorkExperienceByAppId(Slist);
                return dsApp;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsApp = null;
                objDataAccessLogic = null;
            }
        }


        // Get Qualificaition By App ID
        public DataSet GetQualificationByAppId(DataAccessEntities Slist)
        {
            DataSet dsApp = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsApp = objDataAccessLogic.GetQualificationByAppId(Slist);
                return dsApp;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsApp = null;
                objDataAccessLogic = null;
            }
        }


        // Get Position Info
        public DataSet GetPositionInfoByJobId(DataAccessEntities Slist)
        {
            DataSet dsApp = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsApp = objDataAccessLogic.GetPositionInfoByJobId(Slist);
                return dsApp;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsApp = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet GetSpecialityWiseOpd()
        {
            DataSet dsOpd = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsOpd = objDataAccessLogic.GetSpecialityWiseOpd();
                return dsOpd;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsOpd = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetDoctorWiseOpd()
        {
            DataSet dsOpd = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsOpd = objDataAccessLogic.GetDoctorWiseOpd();
                return dsOpd;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsOpd = null;
                objDataAccessLogic = null;
            }
        }

        public DataTable GetUsersPaymentDetail()
        {
            DataTable dt = new DataTable();
            DataAccessLogic objLogic = new DataAccessLogic(); try
            {
                dt = objLogic.GetUsersPaymentDetail().Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dt = null;
                objLogic = null;
            }
        }

        public DataSet GetBannerById(DataAccessEntities Slist)
        {
            DataSet dsBanner = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsBanner = objDataAccessLogic.GetBannerById(Slist);
                return dsBanner;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsBanner = null;
                objDataAccessLogic = null;
            }
        }

        public DataTable GetDoctorScheduleDays(int DoctorId, int SpecialityId)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            return objDataAccessLogic.GetDoctorScheduleDays(DoctorId, SpecialityId);
        }

        public bool IstimeSlotEmpty(DateTime SelectedTimeSlot, int DoctorId, int SpecialtyId)
        {
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            return objDataAccessLogic.IstimeSlotEmpty(SelectedTimeSlot, DoctorId, SpecialtyId);
        }
        public DataSet SaveUpdateFormsEmailDetail(DataAccessEntities Slist)
        {
            DataSet ds = null;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                ds = objDataAccessLogic.SaveUpdateFormsEmailDetail(Slist);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetFormsEmailDetail(int id)
        {
            DataSet ds = null;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                ds = objDataAccessLogic.GetFormsEmailDetail(id);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
                objDataAccessLogic = null;
            }
        }
        public void DeleteFormsEmailDetail(int id)
        {
            string ds = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.DeleteFormsEmailDetail(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
                objDataAccessLogic = null;
            }
        }

        public DataSet GetFacilitationDetailsSurgery()
        {
            DataSet ds = null;
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                ds = objDataAccessLogic.GetFacilitationDetailsSurgery();
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
                objDataAccessLogic = null;
            }
        }
        public void SavePaymentBookAppointment(DataAccessEntities Slist)
        {
            string dsBA = string.Empty;

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                objDataAccessLogic.SavePaymentBookAppointment(Slist);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsBA = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetBookingPaymentDetails()
        {
            DataSet ds = null;
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                ds = objDataAccessLogic.GetBookingPaymentDetails();
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
                objDataAccessLogic = null;
            }
        }
        //Add Research Papers
        public DataSet AddResearchPapers(DataAccessEntities Slist)
        {
            DataSet dsResearchPaper = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsResearchPaper = objDataAccessLogic.AddResearchPapers(Slist);
                return dsResearchPaper;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsResearchPaper = null;
                objDataAccessLogic = null;
            }
        }
        //Detail Research Papers page manage
        public DataSet GetResearchPapersPageContentDetail()
        {
            DataSet ds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                ds = objDataAccessLogic.GetResearchPapersPageContentDetail();
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
                objDataAccessLogic = null;
            }
        }
        public DataSet GetManageResearchPapersContent(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                ds = objDataAccessLogic.GetManageResearchPapersContent(Slist);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
                objDataAccessLogic = null;
            }
        }    

        public DataSet DeleteResearchPapers(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();

            DataAccessLogic objDataAccessLogic = new DataAccessLogic();
            try
            {
                dsTest = objDataAccessLogic.DeleteResearchPapers(SList);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
                objDataAccessLogic = null;
            }
        }
    }
    public class DoctorSchedule
    {
        public string Day { get; set; }
        public string Time { get; set; }
        public int TimeSlot { get; set; }
        public int SpecialtyId { get; set; }
    }
}