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


namespace BusinessDataLayer
{
    public class DataAccessLogic
    {


        /// <summary>
        /// Load Category
        /// </summary>
        /// <param name="SList"></param>
        /// <returns></returns>
        public DataSet GetCategory(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[9];

            param[0] = new SqlParameter("@CategoryName", SqlDbType.NVarChar);
            param[0].Value = SList.CategoryName;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetCategory", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }

        }

        /// <summary>
        /// Load Location
        /// </summary>
        /// <param name="SList"></param>
        /// <returns></returns>
        public DataSet GetLocation(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[9];

            param[0] = new SqlParameter("@LocationName", SqlDbType.NVarChar);
            param[0].Value = SList.LocationName;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetLocation", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }
        }

        //Load Position
        public DataSet GetPosition(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[9];

            param[0] = new SqlParameter("@PositionName", SqlDbType.NVarChar);
            param[0].Value = SList.PositionName;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetPositions", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }
        }

        // Delete Position LoadCareerDetails
        public int DeletePositionDetails(DataAccessEntities Slist)
        {

            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@PositionID", SqlDbType.Int);
            param[0].Value = Slist.PositionID;

            try
            {

                int intResult = SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_DeletePositionsByID", param);
                return intResult;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }

        //Add Jaslok Times Subscription
        public void AddJaslokTimesSubscription(DataAccessEntities Slist)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@email", SqlDbType.VarChar);
            param[0].Value = Slist.Email;
            
            try
            {
                SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_AddJaslokTimesSubscription", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        public void DeleteJaslokTimesSubscription(int id)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@id", SqlDbType.Int);
            param[0].Value = id;

            try
            {
                SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_DeleteJaslokTimesSubscription", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        public DataSet GetJaslokTimesSubscription(string skey)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@SearchKey", SqlDbType.NVarChar);
            param[0].Value = skey;
            
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetJaslokTimesSubscription", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }

        // Get Career Details
        public DataSet LoadCareerDetails(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = new SqlParameter("@PositionID", SqlDbType.Int);
            param[0].Value = Slist.PositionID;
            param[1] = new SqlParameter("@CategoryID", SqlDbType.Int);
            param[1].Value = Slist.CategoryID;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetCareerDetails", param);
                return dsTest;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }


        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet SaveLocationAdmin(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = new SqlParameter("@locationName", SqlDbType.VarChar);
            param[0].Value = Slist.newLocationName;
            param[1] = new SqlParameter("@locationid", SqlDbType.Int);
            param[1].Value = Slist.locationidexists;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SP_SaveAdminLocation", param);
                return dsTest;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }

        // Created by priti on 29/09/2015 DeleteLocationAdmin
        public DataSet DeleteLocationAdmin(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[2];

            param[1] = new SqlParameter("@locationid", SqlDbType.Int);
            param[1].Value = Slist.locationidexists;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SP_DeleteAdminLocation", param);
                return dsTest;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }

        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet SaveCategoryAdmin(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = new SqlParameter("@CategoryName", SqlDbType.VarChar);
            param[0].Value = Slist.CategoryName;
            param[1] = new SqlParameter("@Categoryid", SqlDbType.Int);
            param[1].Value = Slist.CategoryID;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SP_SaveCategoryAdmin", param);
                return dsTest;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }

        // Created by priti on 29/09/2015 DeleteLocationAdmin
        public DataSet DeleteCategoryAdmin(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[2];

            param[1] = new SqlParameter("@Categoryid", SqlDbType.Int);
            param[1].Value = Slist.CategoryID;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SP_DeleteCategoryAdmin", param);
                return dsTest;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }

        // Created by priti on 29/09/2015 saveLocationAdmin
        public DataSet SavePositionAdmin(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = new SqlParameter("@PositionName", SqlDbType.VarChar);
            param[0].Value = Slist.PositionName;
            param[1] = new SqlParameter("@Positionid", SqlDbType.Int);
            param[1].Value = Slist.PositionID;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SP_SaveAdminPosition", param);
                return dsTest;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }

        /// <summary>
        /// Added by Bhujang - load educational program data
        /// </summary>
        /// <param name="SList"></param>
        /// <returns></returns>
        public DataSet LoadEducationalPrograms(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[9];

            param[0] = new SqlParameter("@EducationalProgram", SqlDbType.NVarChar);
            param[0].Value = SList.EducationalProgram;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetEducationProgramsDetails", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }

        }


        /// <summary>
      
        /// </summary>
        /// <param name="Slist"></param>
        /// <returns></returns>
        public DataSet SaveEducationalPrograms(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[2];

            param[0] = new SqlParameter("@EducationalProgram", SqlDbType.NVarChar);
            param[0].Value = Slist.EducationalProgram;
            param[1] = new SqlParameter("@EducationalProgramContent", SqlDbType.NVarChar);
            param[1].Value = Slist.EducationalProgramContent;



            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveEducationPrograms", param);
                return dsTest;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }
        public DataSet GetEnquiry(DataAccessEntities SList)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@EnquiryType", SqlDbType.NVarChar);
            param[0].Value = SList.EnquiryType;


            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetFeedbackInfo", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }
        }

        //public DataSet SaveEnquiryType(DataAccessEntities Slist)
        //{

        //    DataSet dsTest = new DataSet();
        //    SqlParameter[] param = new SqlParameter[2];

        //    param[0] = new SqlParameter("@EnquiryType", SqlDbType.VarChar);
        //    param[0].Value = Slist.EnquiryType;
        //    param[1] = new SqlParameter("@CreatedBy", SqlDbType.NVarChar);
        //    param[1].Value = "";


        //    try
        //    {
        //        dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "Insert_EnquiryMaster", param);
        //        return dsTest;

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {

        //    }

        //}


        public DataSet GetEnquiryType()
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[0];

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetEnquiryddl", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }

        }

        public DataSet GetAllEquiryGrid(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@EnquiryTypeId", SqlDbType.VarChar);
            param[0].Value = Slist.EnquiryTypeId;
            param[1] = new SqlParameter("@EnquiryId", SqlDbType.VarChar);
            param[1].Value = Slist.EnquiryId;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetAllEnquiryGrid", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }
        }
        public DataSet DeleteEnquiryAdmin(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[2];

            //param[0] = new SqlParameter("@EnquiryTypeId", SqlDbType.Int);
            //param[0].Value = Slist.EnquiryTypeId;
            param[0] = new SqlParameter("@EnquiryTypeId", SqlDbType.VarChar);
            param[0].Value = Slist.EnquiryTypeId;
            param[1] = new SqlParameter("@EnquiryId", SqlDbType.Int);
            param[1].Value = Slist.EnquiryId;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SP_DeleteAdminEnquiry", param);
                return dsTest;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }
        public DataSet GetPageType()
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetPageType", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }

        }
        //priti
        public DataSet GetBannerDetails(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@PageTabId", SqlDbType.Int);
            param[0].Value = Slist.PageTabId;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetBanner", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }

        }
        public DataSet SaveBanner(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[8];

            param[0] = new SqlParameter("@BannerTitle", SqlDbType.NVarChar);
            param[0].Value = Slist.BannerTitle;
            param[1] = new SqlParameter("@BannerDesc", SqlDbType.NVarChar);
            param[1].Value = Slist.BannerDesc;
            param[2] = new SqlParameter("@AlternateText", SqlDbType.NVarChar);
            param[2].Value = Slist.AlternateText;
            param[3] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[3].Value = Slist.ImageUrl;
            param[4] = new SqlParameter("@BannerLink", SqlDbType.NVarChar);
            param[4].Value = Slist.BannerLink;
            param[5] = new SqlParameter("@PageTabId", SqlDbType.Int);
            param[5].Value = Slist.PageTabId;
            param[6] = new SqlParameter("@CreatedByUserId", SqlDbType.Int);
            param[6].Value = Slist.CreatedByUserID;
            param[7] = new SqlParameter("@ID", SqlDbType.Int);
            //param[8].Value = 1;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveBanner", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet UpdateDeleteBanner(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[9];

            param[0] = new SqlParameter("@BannerId", SqlDbType.Int);
            param[0].Value = Slist.BannerId;
            param[1] = new SqlParameter("@BannerTitle", SqlDbType.NVarChar);
            param[1].Value = Slist.BannerTitle;
            param[2] = new SqlParameter("@BannerDesc", SqlDbType.NVarChar);
            param[2].Value = Slist.BannerDesc;
            param[3] = new SqlParameter("@AlternateText", SqlDbType.NVarChar);
            param[3].Value = Slist.AlternateText;
            param[4] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[4].Value = Slist.ImageUrl;
            param[5] = new SqlParameter("@BannerLink", SqlDbType.NVarChar);
            param[5].Value = Slist.BannerLink;
            param[6] = new SqlParameter("@PageTabId", SqlDbType.Int);
            param[6].Value = Slist.PageTabId;
            param[7] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[7].Value = Slist.UpdatedByUserID;
            param[8] = new SqlParameter("@OPType", SqlDbType.NVarChar);//
            param[8].Value = Slist.optype;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeleteBanner", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet GetPageDetails(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@PageTabId", SqlDbType.VarChar);
            param[0].Value = Slist.PageTabId;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetPageDetails", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
            }
        }
        public DataSet GetPageDescription(int Pageid)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@PageId", SqlDbType.NVarChar);
            param[0].Value = Pageid;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetPageDescription", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
            }
        }
        public DataSet Savepage(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[8];

            param[0] = new SqlParameter("@PageType", SqlDbType.NVarChar);
            param[0].Value = Slist.PageType;
            param[1] = new SqlParameter("@PageTitle", SqlDbType.NVarChar);
            param[1].Value = Slist.PageTitle;
            param[2] = new SqlParameter("@PageDescription", SqlDbType.NVarChar);
            param[2].Value = Slist.PageDesc;
            param[3] = new SqlParameter("@PageKeywords", SqlDbType.NVarChar);
            param[3].Value = Slist.PageKeywords;
            param[4] = new SqlParameter("@Content", SqlDbType.NVarChar);
            param[4].Value = Slist.Content;
            param[5] = new SqlParameter("@CreatedByUserId", SqlDbType.Int);
            param[5].Value = Slist.CreatedBy;
            param[6] = new SqlParameter("@PageTabId", SqlDbType.NVarChar);
            param[6].Value = Slist.PageTabId;
            param[7] = new SqlParameter("@ID", SqlDbType.Int);
            //param[5].Value = 1;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SavePage", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet UpdateDeletePage(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[7];

            param[0] = new SqlParameter("@PageTypeId", SqlDbType.Int);
            param[0].Value = Slist.PageTypeId;
            param[1] = new SqlParameter("@PageTitle", SqlDbType.NVarChar);
            param[1].Value = Slist.PageTitle;
            param[2] = new SqlParameter("@PageDescription", SqlDbType.NVarChar);
            param[2].Value = Slist.PageDesc;
            param[3] = new SqlParameter("@PageKeywords", SqlDbType.NVarChar);
            param[3].Value = Slist.PageKeywords;
            param[4] = new SqlParameter("@Content", SqlDbType.NVarChar);
            param[4].Value = Slist.Content;
            param[5] = new SqlParameter("@UpdatedByUserID", SqlDbType.Int);
            param[5].Value = Slist.UpdatedByUserID;
            param[6] = new SqlParameter("@OPType", SqlDbType.NVarChar);
            param[6].Value = Slist.optype;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeletePage", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }

        public DataSet GetAlbumDetails()
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetAlbum", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }
        }
        public DataSet GetAlbumList()
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetAlbumList", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }
        }
        public DataSet SaveAlbum(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[9];

            param[0] = new SqlParameter("@AlbumTitle", SqlDbType.NVarChar);
            param[0].Value = Slist.AlbumTitle;
            param[1] = new SqlParameter("@AlbumDescription", SqlDbType.NVarChar);
            param[1].Value = Slist.AlbumDesc;
            param[2] = new SqlParameter("@AlbumImageUrl", SqlDbType.NVarChar);
            param[2].Value = Slist.AlbumImageUrl;
            param[3] = new SqlParameter("@AlbumImgAlternateText", SqlDbType.NVarChar);
            param[3].Value = Slist.AlbumImgAlternateText;
            param[4] = new SqlParameter("@AlbumType", SqlDbType.NVarChar);
            param[4].Value = Slist.AlbumType;
            param[5] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[5].Value = Slist.CreatedByUserID ;
            param[6] = new SqlParameter("@ID", SqlDbType.Int);
            //param[6].Value = 1;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveAlbum", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet UpdateDeleteAlbum(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[8];

            param[0] = new SqlParameter("@AlbumId", SqlDbType.Int);
            param[0].Value = Slist.AlbumID;
            param[1] = new SqlParameter("@AlbumTitle", SqlDbType.NVarChar);
            param[1].Value = Slist.AlbumTitle;
            param[2] = new SqlParameter("@AlbumDescription", SqlDbType.NVarChar);
            param[2].Value = Slist.AlbumDesc;
            param[3] = new SqlParameter("@AlbumImageUrl", SqlDbType.NVarChar);
            param[3].Value = Slist.AlbumImageUrl;
            param[4] = new SqlParameter("@AlbumImgAlternateText", SqlDbType.NVarChar);
            param[4].Value = Slist.AlbumImgAlternateText;
            param[5] = new SqlParameter("@AlbumType", SqlDbType.NVarChar);
            param[5].Value = Slist.AlbumType;
            param[6] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[6].Value = Slist.UpdatedByUserID;
            param[7] = new SqlParameter("@OPType", SqlDbType.NVarChar);//
            param[7].Value = Slist.optype;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeleteAlbum", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        //Photo
        public DataSet GetPhotoDetailByPhotoId(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@PhotoID", SqlDbType.Int);
            param[0].Value = Slist.PhotoID;


            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetPhotoDetailByPhotoId", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
            }
        }
        public DataSet GetPhotoDetailsByAlbumId(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@AlbumId", SqlDbType.Int);
            param[0].Value = Slist.AlbumID;


            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetPhotoDetails", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
            }
        }
        public DataSet SavePhoto(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[9];

            param[0] = new SqlParameter("@PhotoTitle", SqlDbType.NVarChar);
            param[0].Value = Slist.PhotoTitle;
            param[1] = new SqlParameter("@PhotoDescription", SqlDbType.NVarChar);
            param[1].Value = Slist.PhotoDesc;
            param[2] = new SqlParameter("@PhotoImageUrl", SqlDbType.NVarChar);
            param[2].Value = Slist.PhotoImageUrl;
            param[3] = new SqlParameter("@PhotoImgAlternateText", SqlDbType.NVarChar);
            param[3].Value = Slist.PhotoImgAlternateText;
            param[4] = new SqlParameter("@AlbumID", SqlDbType.NVarChar);
            param[4].Value = Slist.AlbumID;
            param[5] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[5].Value = Slist.CreatedByUserID;
            param[6] = new SqlParameter("@ID", SqlDbType.Int);
            //param[8].Value = 1;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SavePhoto", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet UpdateDeletePhoto(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[9];

            param[0] = new SqlParameter("@PhotoId", SqlDbType.Int);
            param[0].Value = Slist.PhotoID;
            param[1] = new SqlParameter("@PhotoTitle", SqlDbType.NVarChar);
            param[1].Value = Slist.PhotoTitle;
            param[2] = new SqlParameter("@PhotoDescription", SqlDbType.NVarChar);
            param[2].Value = Slist.PhotoDesc;
            param[3] = new SqlParameter("@PhotoImageUrl", SqlDbType.NVarChar);
            param[3].Value = Slist.PhotoImageUrl;
            param[4] = new SqlParameter("@PhotoImgAlternateText", SqlDbType.NVarChar);
            param[4].Value = Slist.PhotoImgAlternateText;
            param[5] = new SqlParameter("@AlbumID", SqlDbType.Int);
            param[5].Value = Slist.AlbumID;
            param[6] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[6].Value = Slist.UpdatedByUserID;
            param[7] = new SqlParameter("@OPType", SqlDbType.NVarChar);//
            param[7].Value = Slist.optype;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeletePhoto", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet GetVideoDetailByAlbumId(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@AlbumID", SqlDbType.Int);
            param[0].Value = Slist.AlbumID;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_Get_VideoDetailByAlbumId", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
            }
        }
        public DataSet GetVideoDetails(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@VideoId", SqlDbType.Int);
            param[0].Value = Slist.VideoId;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_Get_VideoGallery", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
            }
        }
        public DataSet SaveVideo(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[7];

            param[0] = new SqlParameter("@VideoTitle", SqlDbType.NVarChar);
            param[0].Value = Slist.VideoTitle;
            param[1] = new SqlParameter("@VideoDescription", SqlDbType.NVarChar);
            param[1].Value = Slist.VideoDesc;
            param[2] = new SqlParameter("@VideoUrl", SqlDbType.NVarChar);
            param[2].Value = Slist.VideoUrl;
            param[3] = new SqlParameter("@VideoThumbnail", SqlDbType.NVarChar);
            param[3].Value = Slist.ImageUrl;
            param[4] = new SqlParameter("@AlbumID", SqlDbType.NVarChar);
            param[4].Value = Slist.AlbumID;
            param[5] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[5].Value = Slist.CreatedByUserID;
            param[6] = new SqlParameter("@ID", SqlDbType.Int);
            //param[5].Value = 1;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveVideo", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet UpdateDeleteVideo(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[8];

            param[0] = new SqlParameter("@VideoId", SqlDbType.Int);
            param[0].Value = Slist.VideoId;
            param[1] = new SqlParameter("@VideoTitle", SqlDbType.NVarChar);
            param[1].Value = Slist.VideoTitle;
            param[2] = new SqlParameter("@VideoDescription", SqlDbType.NVarChar);
            param[2].Value = Slist.VideoDesc;
            param[3] = new SqlParameter("@VideoUrl", SqlDbType.NVarChar);
            param[3].Value = Slist.VideoUrl;
            param[4] = new SqlParameter("@AlbumID", SqlDbType.Int);
            param[4].Value = Slist.AlbumID;
            param[5] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[5].Value = Slist.UpdatedByUserID;
            param[6] = new SqlParameter("@OPType", SqlDbType.NVarChar);//
            param[6].Value = Slist.optype;
            param[7] = new SqlParameter("@VideoThumbnail", SqlDbType.NVarChar);
            param[7].Value = Slist.ImageUrl;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeleteVideo", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        //Testinomial
        public DataSet GetTestinomialMapDetails()
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetTestinomial", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }

        }
        public DataSet GetTestinomialDetails(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@TestimonialId", SqlDbType.Int);
            param[0].Value = Slist.TestimonialId;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "[dbo].[JH_GetTestinomialDetails]", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
            }
        }

        public DataSet GetTestimonialSpecialties(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@TestimonialId", SqlDbType.Int);
            param[0].Value = Slist.TestimonialId;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "[dbo].[JH_GetTestimonialSpecialties]", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;
            }
        }

        public DataSet SaveTestinomial(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[15];

            param[0] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[0].Value = Slist.tName;
            param[1] = new SqlParameter("@Surname", SqlDbType.NVarChar);
            param[1].Value = Slist.Surname;
            param[2] = new SqlParameter("@MobileNo", SqlDbType.NVarChar);
            param[2].Value = Slist.tMobileNo;
            param[3] = new SqlParameter("@EmailId", SqlDbType.NVarChar);
            param[3].Value = Slist.EmailId;
            param[4] = new SqlParameter("@Title", SqlDbType.NVarChar);
            param[4].Value = Slist.Title;
            param[5] = new SqlParameter("@Comment", SqlDbType.NVarChar);
            param[5].Value = Slist.Comment;
            param[6] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[6].Value = Slist.tImageUrl;
            param[7] = new SqlParameter("@ProfileImageUrl", SqlDbType.NVarChar);
            param[7].Value = Slist.ProfileImageUrl;
            param[8] = new SqlParameter("@ShowOnHomePage", SqlDbType.NVarChar);
            param[8].Value = Slist.ShowOnHomePage;
            param[9] = new SqlParameter("@IsApproved", SqlDbType.NVarChar);
            param[9].Value = Slist.IsApproved;
            param[10] = new SqlParameter("@SpecialityId", SqlDbType.NVarChar);
            param[10].Value = Slist.SelectTabId;
            param[11] = new SqlParameter("@TestimonialId", SqlDbType.Int);
            param[11].Value = Slist.TestimonialId;
            param[12] = new SqlParameter("@CreatedByUserId", SqlDbType.Int);
            param[12].Value = Slist.CreatedByUserID;
            param[13] = new SqlParameter("@UpdatedByUserID", SqlDbType.Int);
            param[13].Value = Slist.UpdatedByUserID;
            param[14] = new SqlParameter("@optype", SqlDbType.NVarChar);
            param[14].Value = Slist.optype;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveTestinomial", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet DeleteTestinomial(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@TestimonialId", SqlDbType.Int);
            param[0].Value = Slist.TestimonialId;
           
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_DeleteTestinomial", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }

        //Speciality
        public DataSet GetSpecialtiesDetails(int Cid)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter param = new SqlParameter("@CategoryId", Cid);
            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpecialtiesDetails", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }

        public DataTable GetDoctorSpecialities(int DoctorId)
        {
            DataTable dsSpecialties = new DataTable();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Doctorid", SqlDbType.Int);
            param[0].Value = DoctorId;
            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctorSpeciality", param).Tables[0];
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }
        public DataSet GetSpecialtiesDescription(int Specialtyid)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@Specialtyid", SqlDbType.Int);
            param[0].Value = Specialtyid;
            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpecialtiesDescription", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }
        public DataSet SaveSpecialties(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[8];

            param[0] = new SqlParameter("@CategoryId", SqlDbType.Int);
            param[0].Value = Slist.CategoryId;
            param[1] = new SqlParameter("@SpecialtyName", SqlDbType.NVarChar);
            param[1].Value = Slist.SpecialtyName;
            param[2] = new SqlParameter("@About", SqlDbType.NVarChar);
            param[2].Value = Slist.About;
            param[3] = new SqlParameter("@Facilities", SqlDbType.NVarChar);
            param[3].Value = Slist.Facilities;
            param[4] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[4].Value = Slist.ImageUrl;
            param[5] = new SqlParameter("@ImageTitle", SqlDbType.NVarChar);
            param[5].Value = Slist.PhotoTitle;
            param[6] = new SqlParameter("@ImageAlt", SqlDbType.NVarChar);
            param[6].Value = Slist.AlternateText;
            param[7] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[7].Value = Slist.CreatedByUserID;
            //param[8].Value = 1;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveSpecialties", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public void UpdateDeleteSpecialties(DataAccessEntities Slist)
        {
            SqlParameter[] param = new SqlParameter[11];
            param[0] = new SqlParameter("@CategoryId", SqlDbType.Int);
            param[0].Value = Slist.CategoryId;
            param[1] = new SqlParameter("@SpecialtyName", SqlDbType.NVarChar);
            param[1].Value = Slist.SpecialtyName;
            param[2] = new SqlParameter("@About", SqlDbType.NVarChar);
            param[2].Value = Slist.About;
            param[3] = new SqlParameter("@Facilities", SqlDbType.NVarChar);
            param[3].Value = Slist.Facilities;
            param[4] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[4].Value = Slist.ImageUrl;
            param[5] = new SqlParameter("@ImageTitle", SqlDbType.NVarChar);
            param[5].Value = Slist.PhotoTitle;
            param[6] = new SqlParameter("@ImageAlt", SqlDbType.NVarChar);
            param[6].Value = Slist.AlternateText;
            param[7] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[7].Value = Slist.UpdatedByUserID;
            param[8] = new SqlParameter("@OPType", SqlDbType.NVarChar);
            param[8].Value = Slist.optype;
            param[9] = new SqlParameter("@Tabs", SqlDbType.NVarChar);
            param[9].Value = Slist.SelectTabId.Trim(',');
            param[10] = new SqlParameter("@SpecialtyId", SqlDbType.Int);
            param[10].Value = Slist.SpecialtyId;
            try
            {
                SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeleteSpecialties", param);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet GetDoctoDetailbySID(int sid)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@SpecialtyId", SqlDbType.Int);
            param[0].Value = sid;
            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctoDetailbySID", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }


        //SpecialtyTabMapping
        public DataSet GetSpecialtyCategoryDetails()
        {
            DataSet dsSpecialtyTabMap = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsSpecialtyTabMap = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpecialtyCategoryDetails", param);
                return dsSpecialtyTabMap;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialtyTabMap = null;
            }

        }
        public DataSet GetSpecialtyTabMapDetails()
        {
            DataSet dsSpecialtyTabMap = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsSpecialtyTabMap = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpecialtyTabMapDetails", param);
                return dsSpecialtyTabMap;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialtyTabMap = null;
            }

        }
        public DataSet GetTabsDetails()
        {
            DataSet dsSpecialtyTabMap = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsSpecialtyTabMap = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetTabsDetails", param);
                return dsSpecialtyTabMap;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialtyTabMap = null;
            }

        }
        public DataSet GetSpecialtiesById(DataAccessEntities Slist)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@CategoryId", SqlDbType.NVarChar);
            param[0].Value = Slist.CategoryId;
            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpecialtiesById", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }
        //Doctor
        public DataSet GetDoctorDetails(DataAccessEntities Slist)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@DoctorId", SqlDbType.Int);
            param[0].Value = Slist.DoctorId;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctor", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }

        }
        public DataSet SaveDoctor(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[13];

            param[0] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[0].Value = Slist.dName;
            param[1] = new SqlParameter("@Title", SqlDbType.NVarChar);
            param[1].Value = Slist.dTitle;
            param[2] = new SqlParameter("@Designation", SqlDbType.NVarChar);
            param[2].Value = Slist.Designation;
            param[3] = new SqlParameter("@Specialization", SqlDbType.NVarChar);
            param[3].Value = Slist.Specialization;
            param[4] = new SqlParameter("@AreaExpertise", SqlDbType.NVarChar);
            param[4].Value = Slist.AreaExpertise;
            param[5] = new SqlParameter("@Briefwrite", SqlDbType.NVarChar);
            param[5].Value = Slist.Briefwrite;
            param[6] = new SqlParameter("@Awards", SqlDbType.NVarChar);
            param[6].Value = Slist.Awards;
            param[7] = new SqlParameter("@MobileNo", SqlDbType.NVarChar);
            param[7].Value = Slist.dMobileNo;
            param[8] = new SqlParameter("@EmailId", SqlDbType.NVarChar);
            param[8].Value = Slist.dEmailId;
            param[9] = new SqlParameter("@PhoneNo", SqlDbType.NVarChar);
            param[9].Value = Slist.dPhno;
            param[10] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[10].Value = Slist.dImageUrl;
            param[11] = new SqlParameter("@SelectTabId", SqlDbType.NVarChar);
            param[11].Value = Slist.SelectTabId;
            param[12] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[12].Value = Slist.CreatedByUserID;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveDoctor", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet UpdateDeleteDoctor(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[15];

            param[0] = new SqlParameter("@DoctorId", SqlDbType.Int);
            param[0].Value = Slist.DoctorId;
            param[1] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[1].Value = Slist.dName;
            param[2] = new SqlParameter("@Title", SqlDbType.NVarChar);
            param[2].Value = Slist.dTitle;
            param[3] = new SqlParameter("@Designation", SqlDbType.NVarChar);
            param[3].Value = Slist.Designation;
            param[4] = new SqlParameter("@Specialization", SqlDbType.NVarChar);
            param[4].Value = Slist.Specialization;
            param[5] = new SqlParameter("@AreaExpertise", SqlDbType.NVarChar);
            param[5].Value = Slist.AreaExpertise;
            param[6] = new SqlParameter("@Briefwrite", SqlDbType.NVarChar);
            param[6].Value = Slist.Briefwrite;
            param[7] = new SqlParameter("@Awards", SqlDbType.NVarChar);
            param[7].Value = Slist.Awards;
            param[8] = new SqlParameter("@MobileNo", SqlDbType.NVarChar);
            param[8].Value = Slist.dMobileNo;
            param[9] = new SqlParameter("@EmailId", SqlDbType.NVarChar);
            param[9].Value = Slist.dEmailId;
            param[10] = new SqlParameter("@PhoneNo", SqlDbType.NVarChar);
            param[10].Value = Slist.dPhno;
            param[11] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[11].Value = Slist.dImageUrl;
            param[12] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[12].Value = Slist.UpdatedByUserID;
            param[13] = new SqlParameter("@OPType", SqlDbType.NVarChar);
            param[13].Value = Slist.optype;
            param[14] = new SqlParameter("@SelectTabId", SqlDbType.NVarChar);
            param[14].Value = Slist.SelectTabId;

            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeleteDoctor", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet GetDoctorIdName()
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctorIdName", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }

        }
        //User
        public DataSet GetUserType()
        {
            DataSet dsUser = new DataSet();
            SqlParameter[] param = new SqlParameter[0];

            try
            {
                dsUser = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetUserType", param);
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsUser = null;
            }

        }
        public DataSet GetUserTypeAllDetails(DataAccessEntities Slist)
        {
            DataSet dsUser = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@optype", SqlDbType.NVarChar);
            param[0].Value = Slist.optype;
            try
            {
                dsUser = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetUserTypeAllDetails", param);
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsUser = null;
            }

        }
        public DataSet GetUserDetails(DataAccessEntities Slist)
        {
            DataSet dsUser = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@UserId", SqlDbType.Int);
            param[0].Value = Slist.UserId;
            try
            {
                dsUser = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetUsers", param);
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsUser = null;
            }

        }
        public string SaveUser(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[10];

            param[0] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[0].Value = Slist.UName;
            param[1] = new SqlParameter("@Title", SqlDbType.NVarChar);
            param[1].Value = Slist.UTitle;
            param[2] = new SqlParameter("@Designation", SqlDbType.NVarChar);
            param[2].Value = Slist.UDesignation;
            param[3] = new SqlParameter("@EmailId", SqlDbType.NVarChar);
            param[3].Value = Slist.UEmail;
            param[4] = new SqlParameter("@Description", SqlDbType.NVarChar);
            param[4].Value = Slist.UDescription;
            param[5] = new SqlParameter("@UserTypeId", SqlDbType.Int);
            param[5].Value = Slist.UTypeId;
            param[6] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[6].Value = Slist.UImageUrl;
            param[7] = new SqlParameter("@ContactNo", SqlDbType.NVarChar);
            param[7].Value = Slist.UContactNo;
            param[8] = new SqlParameter("@IsActive", SqlDbType.Bit);
            param[8].Value = Slist.UIsActive;
            param[9] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[9].Value = Slist.CreatedByUserID;
            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveUsers", param));
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }
        public DataSet UpdateDeleteUser(DataAccessEntities Slist)
        {
            DataSet dsUser = new DataSet();
            SqlParameter[] param = new SqlParameter[12];


            param[0] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[0].Value = Slist.UName;
            param[1] = new SqlParameter("@Title", SqlDbType.NVarChar);
            param[1].Value = Slist.UTitle;
            param[2] = new SqlParameter("@Designation", SqlDbType.NVarChar);
            param[2].Value = Slist.UDesignation;
            param[3] = new SqlParameter("@EmailId", SqlDbType.NVarChar);
            param[3].Value = Slist.UEmail;
            param[4] = new SqlParameter("@Description", SqlDbType.NVarChar);
            param[4].Value = Slist.UDescription;
            param[5] = new SqlParameter("@UserTypeId", SqlDbType.Int);
            param[5].Value = Slist.UTypeId;
            param[6] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[6].Value = Slist.UImageUrl;
            param[7] = new SqlParameter("@ContactNo", SqlDbType.NVarChar);
            param[7].Value = Slist.UContactNo;
            param[8] = new SqlParameter("@IsActive", SqlDbType.Bit);
            param[8].Value = Slist.UIsActive;
            param[9] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[9].Value = Slist.UpdatedByUserID;
            param[10] = new SqlParameter("@UserId", SqlDbType.Int);
            param[10].Value = Slist.UserId;
            param[11] = new SqlParameter("@OPType", SqlDbType.NVarChar);
            param[11].Value = Slist.optype;

            try
            {
                dsUser = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeleteUser", param);
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
       

        //Doctor Mapping
        public DataSet GetDoctorById(DataAccessEntities Slist)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            //param[0] = new SqlParameter("@DoctorId", SqlDbType.NVarChar);
            //param[0].Value = Slist.DoctorId;
            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctorById", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }
        public DataSet GetSpecialtyMap(DataAccessEntities Slist)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@DoctorId", SqlDbType.NVarChar);
            param[0].Value = Slist.DoctorId;

            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpecialtyMap", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }
        public DataSet GetDoctorTabMapDetails()
        {
            DataSet dsSpecialtyTabMap = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsSpecialtyTabMap = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctorTabMapDetails", param);
                return dsSpecialtyTabMap;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialtyTabMap = null;
            }

        }
        public DataSet GetSpeciality(bool IsFrontEnd = false)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter param = new SqlParameter("@IsFrontEnd", IsFrontEnd);
            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpeciality", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }
        public DataSet AddSpecialtyMappingCtr(DataAccessEntities Slist)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@DoctorId", SqlDbType.NVarChar);
            param[0].Value = Slist.DoctorId;
            param[1] = new SqlParameter("@SpecialtyMap", SqlDbType.NVarChar);
            param[1].Value = Slist.SpecialtyMap;
            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_AddSpecialtyMapping", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }
        public DataSet UpdateDeleteDoctorTab(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[13];

            param[0] = new SqlParameter("@DoctorId", SqlDbType.Int);
            param[0].Value = Slist.DoctorId;
            param[1] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[1].Value = Slist.dName;
            param[2] = new SqlParameter("@Title", SqlDbType.NVarChar);
            param[2].Value = Slist.dTitle;
            param[3] = new SqlParameter("@Designation", SqlDbType.NVarChar);
            param[3].Value = Slist.Designation;
            param[4] = new SqlParameter("@Specialization", SqlDbType.NVarChar);
            param[4].Value = Slist.Specialization;
            param[5] = new SqlParameter("@Description", SqlDbType.NVarChar);
            param[5].Value = Slist.Description;
            param[6] = new SqlParameter("@MobileNo", SqlDbType.NVarChar);
            param[6].Value = Slist.dMobileNo;
            param[7] = new SqlParameter("@EmailId", SqlDbType.NVarChar);
            param[7].Value = Slist.dEmailId;
            param[8] = new SqlParameter("@PhoneNo", SqlDbType.NVarChar);
            param[8].Value = Slist.dPhno;
            param[9] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[9].Value = Slist.dImageUrl;
            param[10] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[10].Value = 1;
            param[11] = new SqlParameter("@OPType", SqlDbType.NVarChar);//
            param[11].Value = Slist.optype;

            param[12] = new SqlParameter("@SpecialtyMap", SqlDbType.NVarChar);//
            param[12].Value = Slist.SelectTabId;

           



            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeleteDoctorTab", param);
                return dsTest;
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
        public DataSet GetCareerCategoryDetails()
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[0];           

            try
            {
                dsSpecialties=SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetCareerCategoryDetails", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }

        // Career Position Dropdown
        public DataSet GetCareerPositions(DataAccessEntities Slist)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@FunctionId", SqlDbType.Int);
            param[0].Value = Slist.FunctionId;

            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetCareerPosts", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }
        }

        //Career Position Details for Grid  - Added By Bhujang
        public DataSet GetPositionsForListing(DataAccessEntities Slist)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[4];

            param[0] = new SqlParameter("@FunctionId", SqlDbType.Int);
            param[0].Value = Slist.FunctionId;
            param[1] = new SqlParameter("@JobId", SqlDbType.Int);
            param[1].Value = Slist.JobId;
            param[2] = new SqlParameter("@jcPageSize", SqlDbType.Int);
            param[2].Value = Slist.jcPageSize;
            param[3] = new SqlParameter("@jcCurrentPageIndex", SqlDbType.Int);
            param[3].Value = Slist.jcCurrentPageIndex;

            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetCareerPosition_ForListing", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }
        }


        public string SaveCareerCategory(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[3];

           
            param[0] = new SqlParameter("@FunctionName", SqlDbType.NVarChar);
            param[0].Value = Slist.FunctionName;
            param[1] = new SqlParameter("@IsActive", SqlDbType.Bit);
            param[1].Value = Slist.UIsActive;
            param[2] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[2].Value = Slist.CreatedByUserID;
            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveCareerCategory", param));
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }
        public void UpdateDeleteCareerCategory(DataAccessEntities Slist)
        {
            SqlParameter[] param = new SqlParameter[5];

            param[0] = new SqlParameter("@FunctionId", SqlDbType.Int);
            param[0].Value = Slist.FunctionId;
            param[1] = new SqlParameter("@FunctionName", SqlDbType.NVarChar);
            param[1].Value = Slist.FunctionName;
            param[2] = new SqlParameter("@IsActive", SqlDbType.Bit);
            param[2].Value = Slist.UIsActive;
            param[3] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[3].Value = Slist.UpdatedByUserID;
            param[4] = new SqlParameter("@OpType", SqlDbType.NVarChar);
            param[4].Value = Slist.optype;

            try
            {
               SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeleteCareerCategory", param);
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        //Career Position
        public DataSet GetCareerPositionDetails()
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetCareerPositionDetails", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }
        public string SaveCareerPosition(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[15];
            param[0] = new SqlParameter("@Position", SqlDbType.NVarChar);
            param[0].Value = Slist.PositionName;
            param[1] = new SqlParameter("@FunctionId", SqlDbType.Int);
            param[1].Value = Slist.FunctionId;
            param[2] = new SqlParameter("@ReportTo", SqlDbType.NVarChar);
            param[2].Value = Slist.ReportTo;
            param[3] = new SqlParameter("@Location", SqlDbType.NVarChar);
            param[3].Value = Slist.Location;
            param[4] = new SqlParameter("@TotalVacantPosition", SqlDbType.Int);
            param[4].Value = Slist.TotalVacantPosition;
            param[5] = new SqlParameter("@MinExp", SqlDbType.Int);
            param[5].Value = Slist.MinExp;
            param[6] = new SqlParameter("@MaxExp", SqlDbType.Int);
            param[6].Value = Slist.MaxExp;
            param[7] = new SqlParameter("@Job_Role", SqlDbType.NVarChar);
            param[7].Value = Slist.Job_Role;
            param[8] = new SqlParameter("@ProfessionalRequirement", SqlDbType.NVarChar);
            param[8].Value = Slist.ProfessionalRequirement;
            param[9] = new SqlParameter("@Education", SqlDbType.NVarChar);
            param[9].Value = Slist.Education;
            param[10] = new SqlParameter("@ExpiryDate", SqlDbType.NVarChar);
            param[10].Value = Slist.ExpiryDate;
            param[11] = new SqlParameter("@Salary", SqlDbType.NVarChar);
            param[11].Value = Slist.Salary;
            param[12] = new SqlParameter("@SubmittedAt", SqlDbType.NVarChar);
            param[12].Value = Slist.SubmittedAt;
            param[13] = new SqlParameter("@IsApproved", SqlDbType.Bit);
            param[13].Value = Slist.IsApproved;
            param[14] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[14].Value = Slist.CreatedByUserID;

            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveCareerPosition", param));
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }
        public void UpdateDeleteCareerPosition(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[17];
            param[0] = new SqlParameter("@Position", SqlDbType.NVarChar);
            param[0].Value = Slist.PositionName;
            param[1] = new SqlParameter("@FunctionId", SqlDbType.Int);
            param[1].Value = Slist.FunctionId;
            param[2] = new SqlParameter("@ReportTo", SqlDbType.NVarChar);
            param[2].Value = Slist.ReportTo;
            param[3] = new SqlParameter("@Location", SqlDbType.NVarChar);
            param[3].Value = Slist.Location;
            param[4] = new SqlParameter("@TotalVacantPosition", SqlDbType.Int);
            param[4].Value = Slist.TotalVacantPosition;
            param[5] = new SqlParameter("@MinExp", SqlDbType.Int);
            param[5].Value = Slist.MinExp;
            param[6] = new SqlParameter("@MaxExp", SqlDbType.Int);
            param[6].Value = Slist.MaxExp;
            param[7] = new SqlParameter("@Job_Role", SqlDbType.NVarChar);
            param[7].Value = Slist.Job_Role;
            param[8] = new SqlParameter("@ProfessionalRequirement", SqlDbType.NVarChar);
            param[8].Value = Slist.ProfessionalRequirement;
            param[9] = new SqlParameter("@Education", SqlDbType.NVarChar);
            param[9].Value = Slist.Education;
            param[10] = new SqlParameter("@ExpiryDate", SqlDbType.NVarChar);
            param[10].Value = Slist.ExpiryDate;
            param[11] = new SqlParameter("@Salary", SqlDbType.NVarChar);
            param[11].Value = Slist.Salary;
            param[12] = new SqlParameter("@SubmittedAt", SqlDbType.NVarChar);
            param[12].Value = Slist.SubmittedAt;
            param[13] = new SqlParameter("@IsApproved", SqlDbType.Bit);
            param[13].Value = Slist.IsApproved;
            param[14] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[14].Value = Slist.UpdatedByUserID;
            param[15] = new SqlParameter("@OpType", SqlDbType.NVarChar);
            param[15].Value = Slist.optype;
            param[16] = new SqlParameter("@JobId", SqlDbType.Int);
            param[16].Value = Slist.JobId;

            try
            {
                SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeleteCareerPosition", param);

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
            DataSet dsSpecialtyTabMap = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsSpecialtyTabMap = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctorScheduleDetails", param);
                return dsSpecialtyTabMap;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialtyTabMap = null;
            }

        }
        public DataTable GetScheduleDetail(int DoctorScheduleId)
        {
            DataTable dsSeminars = new DataTable();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@DoctorScheduleId", SqlDbType.Int);
            param[0].Value = DoctorScheduleId;

            try
            {
                dsSeminars = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctorScheduleDetail", param).Tables[0];
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;

            }

        }
        public DataSet DSInsertUpdateDelete(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[10];
            param[0] = new SqlParameter("@DSId", SqlDbType.Int);
            param[0].Value = Slist.DSId;
            param[1] = new SqlParameter("@DoctorId", SqlDbType.Int);
            param[1].Value = Slist.DoctorId;
            param[2] = new SqlParameter("@Day", SqlDbType.NVarChar);
            param[2].Value = Slist.Day;
            param[3] = new SqlParameter("@Time", SqlDbType.NVarChar);
            param[3].Value = Slist.Time;
            param[4] = new SqlParameter("@Room", SqlDbType.NVarChar);
            param[4].Value = Slist.Room;
            param[5] = new SqlParameter("@Action", SqlDbType.NVarChar);
            param[5].Value = Slist.Action;
            param[6] = new SqlParameter("@SpecialityId", SqlDbType.Int);
            param[6].Value = Slist.SpecialtyId;
            param[7] = new SqlParameter("@TimeSlot", SqlDbType.Int);
            param[7].Value = Slist.TimeSlot;
            param[8] = new SqlParameter("@CreatedByUserId", SqlDbType.Int);
            param[8].Value = Slist.CreatedByUserID;
            param[9] = new SqlParameter("@UpdatedByUserId", SqlDbType.Int);
            param[9].Value = Slist.UpdatedByUserID;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_DSInsertUpdateDelete", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet GetDoctorSchedule(DataAccessEntities Slist)
        {
            DataSet dsSpecialtyTabMap = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@DoctorId", SqlDbType.NVarChar);
            param[0].Value = Slist.DoctorId;
            try
            {
                dsSpecialtyTabMap = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctorSchedule", param);
                return dsSpecialtyTabMap;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialtyTabMap = null;
            }

        }

        //HealthTips
        public DataSet GetHealthTipsDetails()
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetHealthTipsDetails", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }

        }
        public DataSet SaveHealthTips(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[5];

            param[0] = new SqlParameter("@Title", SqlDbType.NVarChar);
            param[0].Value = Slist.HTitle;
             param[1] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[1].Value = Slist.HImageUrl;
            param[2] = new SqlParameter("@Description", SqlDbType.NVarChar);
            param[2].Value = Slist.HDescription;
            param[3] = new SqlParameter("@IsActive", SqlDbType.NVarChar);
            param[3].Value = Slist.IsActive;
            param[4] = new SqlParameter("@CreatedByUserId", SqlDbType.Int);
            param[4].Value = Slist.CreatedByUserID;
           
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveHealthTips", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet UpdateDeletHealthTips(DataAccessEntities Slist)
        {

            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[7];

            param[0] = new SqlParameter("@HealthTipId", SqlDbType.Int);
            param[0].Value = Slist.HealthTipId;
            param[1] = new SqlParameter("@Title", SqlDbType.NVarChar);
            param[1].Value = Slist.HTitle;
            param[2] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[2].Value = Slist.HImageUrl;
            param[3] = new SqlParameter("@Description", SqlDbType.NVarChar);
            param[3].Value = Slist.HDescription;
            param[4] = new SqlParameter("@IsActive", SqlDbType.NVarChar);
            param[4].Value = Slist.IsActive;
            param[5] = new SqlParameter("@UpdatedByUserId", SqlDbType.Int);
            param[5].Value = Slist.UpdatedByUserID;
            param[6] = new SqlParameter("@OPType", SqlDbType.NVarChar);//
            param[6].Value = Slist.optype;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_UpdateDeleteHealthTips", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }

        //Seminars
        public string SaveUpdateSeminars(DataAccessEntities Slist)
        {
            string dsUser = string.Empty; 
            SqlParameter[] param = new SqlParameter[12];
            param[0] = new SqlParameter("@SeminarId", SqlDbType.Int);
            param[0].Value = Slist.SeminarId;
            param[1] = new SqlParameter("@Title", SqlDbType.NVarChar);
            param[1].Value = Slist.Title;
            param[2] = new SqlParameter("@DateOfSeminar", SqlDbType.NVarChar);
            param[2].Value = Slist.Day;
            param[3] = new SqlParameter("@Timings", SqlDbType.NVarChar);
            param[3].Value = Slist.Time;
            param[4] = new SqlParameter("@Venue", SqlDbType.NVarChar);
            param[4].Value = Slist.Location;
            param[5] = new SqlParameter("@OfficerInCharge", SqlDbType.NVarChar);
            param[5].Value = Slist.Name;
            param[6] = new SqlParameter("@Contact", SqlDbType.NVarChar);
            param[6].Value = Slist.dPhno;
            param[7] = new SqlParameter("@Email", SqlDbType.NVarChar);
            param[7].Value = Slist.Email;
            param[8] = new SqlParameter("@Brochure", SqlDbType.NVarChar);
            param[8].Value = Slist.Brochure;
            param[9] = new SqlParameter("@TimeTOPIC", SqlDbType.NVarChar);
            param[9].Value = Slist.TimeTOPIC;
            param[10] = new SqlParameter("@ExpiryDate", SqlDbType.NVarChar);
            param[10].Value = Slist.ExpiryDate;
            param[11] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[11].Value = 1;

            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveUpdateSeminars", param));
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }
        public DataSet GetSeminarsDetails(int Sid)
        {
            DataSet dsSeminars = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@SeminarsId", SqlDbType.Int);
            param[0].Value = Sid;

            try
            {
                dsSeminars = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSeminarsDetails", param);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;

            }

        }
        public void DeleteSeminars(DataAccessEntities Slist)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@SeminarId", SqlDbType.Int);
            param[0].Value = Slist.SeminarId;          

            try
            {
               Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_DeleteSeminars", param));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }

        //SeminarForms
        public string SaveSeminarForm(DataAccessEntities Slist)
        {
            string dsSeminar = string.Empty;
            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@SeminarId", SqlDbType.Int);
            param[0].Value = Slist.SeminarId;
            param[1] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[1].Value = Slist.Name;
            param[2] = new SqlParameter("@Graduate", SqlDbType.NVarChar);
            param[2].Value = Slist.Designation;
            param[3] = new SqlParameter("@Institution", SqlDbType.NVarChar);
            param[3].Value = Slist.FunctionName;
            param[4] = new SqlParameter("@Address", SqlDbType.NVarChar);
            param[4].Value = Slist.Location;
            param[5] = new SqlParameter("@Phone", SqlDbType.NVarChar);
            param[5].Value = Slist.PhoneNo;
            param[6] = new SqlParameter("@Mobile", SqlDbType.NVarChar);
            param[6].Value = Slist.MobileNo;
            param[7] = new SqlParameter("@Fax", SqlDbType.NVarChar);
            param[7].Value = Slist.FaxNo;
            param[8] = new SqlParameter("@Email", SqlDbType.NVarChar);
            param[8].Value = Slist.Email;

            try
            {
                dsSeminar = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveSeminarForm", param));
                return dsSeminar;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }

        //BookAppointment
        public DataSet GetBookAppointment(int DoctorId)
        {
            DataSet dsTest = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@DoctorId", SqlDbType.Int);
            param[0].Value = DoctorId;
            try
            {
                dsTest = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetBookAppointment", param);
                return dsTest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsTest = null;

            }

        }
        public string SaveBookAppointment(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[12];
            param[0] = new SqlParameter("@SpecialtyId", SqlDbType.Int);
            param[0].Value = Slist.SpecialtyId;
            param[1] = new SqlParameter("@DoctorId", SqlDbType.Int);
            param[1].Value = Slist.DoctorId;
            param[2] = new SqlParameter("@BookedDate", SqlDbType.NVarChar);
            param[2].Value = Slist.TimeDate;
            param[3] = new SqlParameter("@ClientName", SqlDbType.NVarChar);
            param[3].Value = Slist.Name;
            param[4] = new SqlParameter("@DateOfBirth", SqlDbType.NVarChar);
            param[4].Value = Slist.Day;
            param[5] = new SqlParameter("@Email", SqlDbType.NVarChar);
            param[5].Value = Slist.Email;
            param[6] = new SqlParameter("@PhoneNo", SqlDbType.NVarChar);
            param[6].Value = Slist.PhoneNo;
            param[7] = new SqlParameter("@MobileNo", SqlDbType.NVarChar);
            param[7].Value = Slist.MobileNo;
            param[8] = new SqlParameter("@Country", SqlDbType.NVarChar);
            param[8].Value = Slist.Location;
            param[9] = new SqlParameter("@StateName", SqlDbType.NVarChar);
            param[9].Value = Slist.Address;
            param[10] = new SqlParameter("@Enquiry", SqlDbType.NVarChar);
            param[10].Value = Slist.Description;
            param[11] = new SqlParameter("@DoctorScheduleId", SqlDbType.Int);
            param[11].Value = Slist.DoctorScheduleId;
            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveBookAppointment", param));
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }

        //Home Slider
        public string SaveUpdateHomeSlider(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@SliderId", SqlDbType.Int);
            param[0].Value = Slist.SliderId;
            param[1] = new SqlParameter("@ImageUrl", SqlDbType.NVarChar);
            param[1].Value = Slist.ImageUrl;
            param[2] = new SqlParameter("@ImageAlternateText", SqlDbType.NVarChar);
            param[2].Value = Slist.Description;
            param[3] = new SqlParameter("@Title", SqlDbType.NVarChar);
            param[3].Value = Slist.Title;
            param[4] = new SqlParameter("@RedirectLink", SqlDbType.NVarChar);
            param[4].Value = Slist.RedirectLink;
            param[5] = new SqlParameter("@IsActive", SqlDbType.Bit);
            param[5].Value = Slist.IsApproved;
            param[6] = new SqlParameter("@CreatedByUserId", SqlDbType.Int);
            param[6].Value = Slist.CreatedByUserID;
            param[7] = new SqlParameter("@UpdatedByUserId", SqlDbType.Int);
            param[7].Value = Slist.UpdatedByUserID;
            param[8] = new SqlParameter("@Optype", SqlDbType.NVarChar);
            param[8].Value = Slist.optype;
            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveUpdateHomeSlider", param));
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }
        public DataSet GetHomeSliderDetails(int SliderId)
        {
            DataSet dsSeminars = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@SliderId", SqlDbType.Int);
            param[0].Value = SliderId;
            try
            {
                dsSeminars = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetHomeSliderDetails", param);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
            }
        }
        public void DeleteHomeSlider(DataAccessEntities Slist)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@SliderId", SqlDbType.Int);
            param[0].Value = Slist.SliderId;

            try
            {
                Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_DeleteHomeSlider", param));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }
        //News
        public string AddEditDeleteNews(DataAccessEntities Slist)
        {

            string dsNews = string.Empty;
            SqlParameter[] param = new SqlParameter[9];

            param[0] = new SqlParameter("@NewsId", SqlDbType.Int);
            param[0].Value = Slist.NewId;
            param[1] = new SqlParameter("@NewsTitle", SqlDbType.NVarChar);
            param[1].Value = Slist.NewsTitle;
            param[2] = new SqlParameter("@NewsContent", SqlDbType.NVarChar);
            param[2].Value = Slist.NewsContent;
            param[3] = new SqlParameter("@NewsDate", SqlDbType.Date);
            param[3].Value = Slist.NewsDate;
            param[4] = new SqlParameter("@isActive", SqlDbType.Bit);
            param[4].Value = Slist.NewsIsActive;
            param[5] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[5].Value = Slist.CreatedByUserID;
            param[6] = new SqlParameter("@Thumbnail", SqlDbType.NVarChar);
            param[6].Value = Slist.Thumbnail;
            param[7] = new SqlParameter("@Optype", SqlDbType.NVarChar);
            param[7].Value = Slist.optype;
            param[8] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[8].Value = Slist.UpdatedByUserID;

            try
            {
                Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_AddEditDeleteNews", param));

                return dsNews;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public DataSet GetNewsDetails(DataAccessEntities Slist)
        {
            DataSet dsnEWS = new DataSet();
            SqlParameter[] param = new SqlParameter[2];
            try
            {
                param[0] = new SqlParameter("@NewsId", SqlDbType.Int);
                param[0].Value = Slist.NewId;

                param[1] = new SqlParameter("@IsActive", SqlDbType.Bit);
                param[1].Value = Slist.IsActive;

                dsnEWS = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetNewsDetails", param);
                return dsnEWS;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsnEWS = null;
            }
        }
        public DataSet GetCareerApplicationDetails(DataAccessEntities slist)
        {
            DataSet dsApplication = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@PositionID", SqlDbType.Int);
                param[0].Value = slist.JobId;
           
                //dsApplication = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetApplicationDetails", param);
                dsApplication = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetCareerApplicationDetails", param);
                return dsApplication;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsApplication = null;
            }
        }
        public DataSet GetSeminarEntries(DataAccessEntities slist)
        {
            DataSet dsApplication = new DataSet();
            SqlParameter[] param = new SqlParameter[2];
            try
            {
                param[0] = new SqlParameter("@EntryId", SqlDbType.Int);
                param[0].Value = slist.seminarEnryId;

                dsApplication = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSeminarEntryDetails", param);
                return dsApplication;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsApplication = null;
            }
        }

        //Speciality Clinic OPD Map With doctor
        public string SaveUpdateSpecialityClinicOPD(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[5];
            param[0] = new SqlParameter("@SpecialityClinicId", SqlDbType.Int);
            param[0].Value = Slist.SpecialityClinicId;
            param[1] = new SqlParameter("@SpecialtyName", SqlDbType.NVarChar);
            param[1].Value = Slist.SpecialtyName;
            param[2] = new SqlParameter("@SelectTabId", SqlDbType.NVarChar);
            param[2].Value = Slist.SelectTabId;
            param[3] = new SqlParameter("@IsApproved", SqlDbType.Bit);
            param[3].Value = Slist.IsApproved;
            param[4] = new SqlParameter("@Optype", SqlDbType.NVarChar);
            param[4].Value = Slist.optype;
            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SaveSpecialityClinicOPD", param));
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }
        public DataSet GetSpecialityClinicOPD()
        {
            DataSet dsSeminars = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
           
            try
            {
                dsSeminars = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpecialityClinicOPD", param);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
            }
        }

        public DataSet GetActiveSpecialityClinicOPD()
        {
            DataSet dsSeminars = new DataSet();
            SqlParameter[] param = new SqlParameter[0];

            try
            {
                dsSeminars = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetActiveSpecialityClinicsOPD", param);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
            }
        }

        public DataSet GetSpecialityClinicOPDDoctors()
        {
            DataSet dsSeminars = new DataSet();
            SqlParameter[] param = new SqlParameter[0];

            try
            {
                dsSeminars = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpecialityClinicsOPDDoctors", param);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;
            }
        }

        public DataSet GetSpecialtyDoctor(DataAccessEntities Slist)
        {
            DataSet dsSpecialties = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@SpecialtyId", SqlDbType.NVarChar);
            param[0].Value = Slist.SpecialtyId;

            try
            {
                dsSpecialties = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpecialtyDoctor", param);
                return dsSpecialties;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialties = null;

            }

        }
        
        //Home testimonial
        public DataSet GetTestimonialByParm(DataAccessEntities Slist)
        {
            DataSet dsnEWS = new DataSet();
            SqlParameter[] param = new SqlParameter[2];
            try
            {
                param[0] = new SqlParameter("@TestimonialId", SqlDbType.Int);
                param[0].Value = Slist.TestimonialId;
                param[1] = new SqlParameter("@optype", SqlDbType.NVarChar);
                param[1].Value = Slist.optype;
                dsnEWS = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetTestimonialByParm", param);
                return dsnEWS;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsnEWS = null;
            }
        }
        public DataSet GetDoctorDetailsForPage(DataAccessEntities Slist)
        {
            DataSet dsSeminars = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@DoctorId", SqlDbType.Int);
            param[0].Value = Slist.DoctorId;

            try
            {
                dsSeminars = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctorDetails", param);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;

            }

        }

        public DataSet CheckUerExistence(string fsMobileNumber)
        {
            DataSet dsSeminars = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@MobileNo", SqlDbType.NVarChar);
            param[0].Value = fsMobileNumber;

            try
            {
                dsSeminars = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "CheckMobile_Uniquness", param);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;

            }

        }

        public DataSet OTPVerification(string fsMobileNumber, string fsOTP, int fiOTPExpiration)
        {
            DataSet dsSeminars = new DataSet();
            SqlParameter[] param = new SqlParameter[3];
            param[0] = new SqlParameter("@MobileNo", SqlDbType.NVarChar);
            param[0].Value = fsMobileNumber;
            param[1] = new SqlParameter("@OTP", SqlDbType.NVarChar);
            param[1].Value = fsOTP;
            param[2] = new SqlParameter("@OTPExpiration", SqlDbType.Int);
            param[2].Value = fiOTPExpiration;

            try
            {
                dsSeminars = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "OTPVerification", param);
                return dsSeminars;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSeminars = null;

            }

        }

        //Detail Inner page manage
        public DataSet GetBannerPageContentDetail(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@PageTabId", SqlDbType.Int);
                param[0].Value = Slist.PageTypeId;

                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetBannerPageContentDetail", param);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }

        //Get Page TabId name
        public DataSet GetPageTabIdName()
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {

                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetPageTabIdName", param);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }
        public DataSet GetCountry()
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            try
            {

                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetCountry", param);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }
        
        // jaslok Times
        public DataSet BindJTimesCategory()
        {
            DataSet dscat = new DataSet();
            //SqlParameter[] param = new SqlParameter[2];
            try
            {

                dscat = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetJaslokTimesCategory");
                return dscat;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dscat = null;
            }
        }
        public DataSet GetJaslokTimesById(int id)
        {
            DataSet dscat = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@JaslokTimesId", SqlDbType.Int);
                param[0].Value = id;
                dscat = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetJaslokTimesById", param);
                return dscat;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dscat = null;
            }
        }

        public DataSet GetJaslokTimesDetails(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[2];
            try
            {
                param[0] = new SqlParameter("@CategoryId", SqlDbType.Int);
                param[0].Value = Slist.CategoryID;
                param[1] = new SqlParameter("@FileName", SqlDbType.VarChar);
                param[1].Value = Slist.FileName;

                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetJaslokTimes", param);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }

        public DataTable GetDoctorScheduleDays(int DoctorId, int SpecialityId)
        {
            return SqlHelper.ExecuteDataset(Config.GetConnectionString(), "GetDoctorScheduleDays", new object[] { DoctorId, SpecialityId }).Tables[0];
        }



        public string AddJaslokTimes(DataAccessEntities Slist)
        {

            string dsNews = string.Empty;
            SqlParameter[] param = new SqlParameter[8];

            param[0] = new SqlParameter("@JaslokTimesId", SqlDbType.Int);
            param[0].Value = Slist.JaslokTimesId;

            param[1] = new SqlParameter("@CategoryId", SqlDbType.Int);
            param[1].Value = Slist.CategoryId;
            param[2] = new SqlParameter("@FileName", SqlDbType.NVarChar);
            param[2].Value = Slist.FileName;
            param[3] = new SqlParameter("@FileFriendlyName", SqlDbType.NVarChar);
            param[3].Value = Slist.FileFriendlyName;
            param[4] = new SqlParameter("@FilePath", SqlDbType.NVarChar);
            param[4].Value = Slist.FilePath;
            param[5] = new SqlParameter("@IsActiveJaslokTimes", SqlDbType.Bit);
            param[5].Value = Slist.IsActiveJaslokTimes;
            param[6] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[6].Value = Slist.CreatedByUserID;
            param[7] = new SqlParameter("@UpdatedBy", SqlDbType.Int);
            param[7].Value = Slist.UpdatedByUserID;
            try
            {
                Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_InsertJaslokTimes", param));

                return dsNews;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }


        public int DeleteJaslokTimes(DataAccessEntities Slist)
        {

            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@JaslokTimesId", SqlDbType.Int);
            param[0].Value = Slist.JaslokTimesId;

            try
            {

                int intResult = SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_DeleteJaslokTimes", param);
                return intResult;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }

        // Delete Whats news
        public int DeleteWhatNews(DataAccessEntities Slist)
        {

            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@WhatsNewId", SqlDbType.Int);
            param[0].Value = Slist.WhatsNewId;

            try
            {

                int intResult = SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_DeleteWhatNew", param);
                return intResult;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }

        }


        // Whats New

        public string AddWhatsNew(DataAccessEntities Slist)
        {

            string dsNews = string.Empty;
            SqlParameter[] param = new SqlParameter[6];

            param[0] = new SqlParameter("@WhatsNewId", SqlDbType.Int);
            param[0].Value = Slist.JaslokTimesId;
            param[1] = new SqlParameter("@WhatsNewTitle", SqlDbType.NVarChar);
            param[1].Value = Slist.WhatsNewTitle;
            param[2] = new SqlParameter("@IsActiveWhatsNew", SqlDbType.Bit);
            param[2].Value = Slist.IsActiveWhatsNew;
            param[3] = new SqlParameter("@FilePath", SqlDbType.NVarChar);
            param[3].Value = Slist.FilePath;
            param[4] = new SqlParameter("@WNSummury", SqlDbType.NVarChar);
            param[4].Value = Slist.WNSummury;
            param[5] = new SqlParameter("@UserId", SqlDbType.Int);
            param[5].Value = Slist.UserId;


            try
            {
                Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_InsertWhatsNew", param));

                return dsNews;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }


        public DataSet GetWhatsNew(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[2];
            try
            {

                param[0] = new SqlParameter("@WhatsNewId", SqlDbType.Int);
                param[0].Value = Slist.WhatsNewId;
                param[1] = new SqlParameter("@WhatsNewTitle", SqlDbType.NVarChar);
                param[1].Value = Slist.WhatsNewTitle;

                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetWhatsNew", param);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }


        // Semminar

        public DataSet GetSeminarNameById(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[2];
            try
            {
                param[0] = new SqlParameter("@SeminarId", SqlDbType.Int);
                param[0].Value = Slist.SeminarId;
                param[1] = new SqlParameter("@Title", SqlDbType.VarChar);
                param[1].Value = Slist.Title;

                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetJaslokSeminars", param);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }




        public void SaveFeedBack(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[5];
            //param[0] = new SqlParameter("@EnquiryTypeId", SqlDbType.Int);
            //param[0].Value = Slist.EnquiryTypeId;
            param[0] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[0].Value = Slist.Name;
            param[1] = new SqlParameter("@Gender", SqlDbType.NVarChar);
            param[1].Value = Slist.Gender;
            param[2] = new SqlParameter("@Mobile", SqlDbType.NVarChar);
            param[2].Value = Slist.PhoneNo;
            param[3] = new SqlParameter("@EmailAddress", SqlDbType.NVarChar);
            param[3].Value = Slist.Email;
            param[4] = new SqlParameter("@FeedBack", SqlDbType.NVarChar);
            param[4].Value = Slist.Description;
            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "jh_Forms_SaveFeedBack", param));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }
        public void SaveComplaint(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[3];
            //param[0] = new SqlParameter("@EnquiryTypeId", SqlDbType.Int);
            //param[0].Value = Slist.EnquiryTypeId;
            param[0] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[0].Value = Slist.Name;
            param[1] = new SqlParameter("@EmailAddress", SqlDbType.NVarChar);
            param[1].Value = Slist.Email;
            param[2] = new SqlParameter("@Complaint", SqlDbType.NVarChar);
            param[2].Value = Slist.Description;
            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "jh_Forms_SaveComplaint", param));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }
        public void SaveQuickEnquiry(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[7];
            param[1] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[1].Value = Slist.Name;
            param[2] = new SqlParameter("@Age", SqlDbType.Int);
            param[2].Value = Slist.Age;
            param[3] = new SqlParameter("@Gender", SqlDbType.NVarChar);
            param[3].Value = Slist.Gender;
            param[4] = new SqlParameter("@Mobile", SqlDbType.NVarChar);
            param[4].Value = Slist.PhoneNo;
            param[5] = new SqlParameter("@EmailAddress", SqlDbType.NVarChar);
            param[5].Value = Slist.Email;
            param[6] = new SqlParameter("@Enquiry", SqlDbType.NVarChar);
            param[6].Value = Slist.Description;
            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "jh_Forms_SaveQuickEnquiry", param));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }
        public void SaveEstimate(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@Age", SqlDbType.Int);
            param[0].Value = Slist.Age;
            param[1] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[1].Value = Slist.Name;
            param[2] = new SqlParameter("@Gender", SqlDbType.NVarChar);
            param[2].Value = Slist.Gender;
            param[3] = new SqlParameter("@Mobile", SqlDbType.NVarChar);
            param[3].Value = Slist.Mobile;
            param[4] = new SqlParameter("@EmailAddress", SqlDbType.NVarChar);
            param[4].Value = Slist.Email;
            param[5] = new SqlParameter("@Option1", SqlDbType.NVarChar);
            param[5].Value = Slist.Option1;
            param[6] = new SqlParameter("@Option2", SqlDbType.NVarChar);
            param[6].Value = Slist.Option2;
            param[7] = new SqlParameter("@Option3", SqlDbType.NVarChar);
            param[7].Value = Slist.Option3;
            param[8] = new SqlParameter("@Comments", SqlDbType.NVarChar);
            param[8].Value = Slist.Comment;
            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "jh_Forms_SaveEstimate", param));

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }


        public string AddEditSAchievement(DataAccessEntities Slist)
        {

            string dsNews = string.Empty;
            SqlParameter[] param = new SqlParameter[7];

            param[0] = new SqlParameter("@AchievementID", SqlDbType.Int);
            param[0].Value = Slist.AchievementID;
            param[1] = new SqlParameter("@AchievementTitle", SqlDbType.NVarChar);
            param[1].Value = Slist.AchievementTitle;
            param[2] = new SqlParameter("@PublishedDate", SqlDbType.Date);
            param[2].Value = Slist.PublishedDate;
            param[3] = new SqlParameter("@AchievementSummery", SqlDbType.NVarChar);
            param[3].Value = Slist.AchievementSummery; 
            param[4] = new SqlParameter("@CreatedBy", SqlDbType.Int);
            param[4].Value = Slist.CreatedBy;
           

            try
            {
                Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_AddEditSpecialAchievement", param));

                return dsNews;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }


        // Apply Seminars
        public string ApplySeminar(DataAccessEntities Slist)
        {
            string dsUser = string.Empty;
            SqlParameter[] param = new SqlParameter[9];
            param[0] = new SqlParameter("@Seminarid", SqlDbType.Int);
            param[0].Value = Slist.SeminarId;
            param[1] = new SqlParameter("@Name", SqlDbType.NVarChar);
            param[1].Value = Slist.Name;
            param[2] = new SqlParameter("@Graduate", SqlDbType.NVarChar);
            param[2].Value = Slist.Graduate;
            param[3] = new SqlParameter("@Institution", SqlDbType.NVarChar);
            param[3].Value = Slist.Institution;
            param[4] = new SqlParameter("@Address", SqlDbType.NVarChar);
            param[4].Value = Slist.Address;
            param[5] = new SqlParameter("@Phone", SqlDbType.NVarChar);
            param[5].Value = Slist.Phone;
            param[6] = new SqlParameter("@Mobile", SqlDbType.NVarChar);
            param[6].Value = Slist.Mobile;
            param[7] = new SqlParameter("@Fax", SqlDbType.NVarChar);
            param[7].Value = Slist.Fax;
            param[8] = new SqlParameter("@Email", SqlDbType.NVarChar);
            param[8].Value = Slist.Email;
            

            try
            {
                dsUser = Convert.ToString(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_ApplySeminar", param));
                return dsUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }



        // Get Seminar

        public DataSet GetJaslokSemminars(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[2];
            try
            {
                param[0] = new SqlParameter("@SeminarId", SqlDbType.Int);
                param[0].Value = Slist.SeminarId;
                param[1] = new SqlParameter("@Title", SqlDbType.VarChar);
                param[1].Value = Slist.Title;

                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetJaslokSeminars", param);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }


        //Get Health Tips Info by Name or ID

        public DataSet GetHealthTipsInfo(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[2];
            try
            {
                param[0] = new SqlParameter("@HealthTipId", SqlDbType.Int);
                param[0].Value = Slist.HealthTipId;
                param[1] = new SqlParameter("@Title", SqlDbType.VarChar);
                param[1].Value = Slist.Title;

                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetHealthTipsInfo", param);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }



        // Get Health Details by ID

        public DataSet GetHealthTipsDetailsById(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@HealthTipId", SqlDbType.Int);
                param[0].Value = Slist.HealthTipId;  

                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetHealthTipsByID", param);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }


        // Get Career Post 
        public DataSet GetCareerPostAndCategory(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@JobId", SqlDbType.Int);
                param[0].Value = Slist.JobId;

                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetCareerPostByJobId", param);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }


        // Save Candidate Application

        public int SaveCandidateApplication(DataAccessEntities Slist)
        {
           // int ApplicantID = 0;

            SqlParameter[] param = new SqlParameter[23];
            param[0] = new SqlParameter("@FunctionId", SqlDbType.Int);
            param[0].Value = Slist.FunctionId;
            param[1] = new SqlParameter("@PositionID", SqlDbType.Int);
            param[1].Value = Slist.PositionID;
            param[2] = new SqlParameter("@ApplicantFirstName", SqlDbType.NVarChar);
            param[2].Value = Slist.ApplicantFirstName;
            param[3] = new SqlParameter("@ApplicantMiddleName", SqlDbType.NVarChar);
            param[3].Value = Slist.ApplicantMiddleName;
            param[4] = new SqlParameter("@ApplicantLastName", SqlDbType.NVarChar);
            param[4].Value = Slist.ApplicantLastName;
            param[5] = new SqlParameter("@ApplicantDOB", SqlDbType.Date);
            param[5].Value = Slist.ApplicantDOB;
            param[6] = new SqlParameter("@ApplicantGender", SqlDbType.NVarChar);
            param[6].Value = Slist.ApplicantGender;
            param[7] = new SqlParameter("@ApplicantReligion", SqlDbType.NVarChar);
            param[7].Value = Slist.ApplicantReligion;
            param[8] = new SqlParameter("@ApplicantNationality", SqlDbType.NVarChar);
            param[8].Value = Slist.ApplicantNationality;
            param[9] = new SqlParameter("@ApplicantLandLineOffice", SqlDbType.NVarChar);
            param[9].Value = Slist.ApplicantLandLineOffice;
            param[10] = new SqlParameter("@ApplicantLandLineResidance", SqlDbType.NVarChar);
            param[10].Value = Slist.ApplicantLandLineResidance;

            param[11] = new SqlParameter("@ApplicantMobile", SqlDbType.NVarChar);
            param[11].Value = Slist.ApplicantMobile;
            param[12] = new SqlParameter("@ApplicantEmail", SqlDbType.NVarChar);
            param[12].Value = Slist.ApplicantEmail;
            param[13] = new SqlParameter("@ApplicantCurrentAddress", SqlDbType.NVarChar);
            param[13].Value = Slist.ApplicantCurrentAddress;
            param[14] = new SqlParameter("@ApplicantPermanentAddress", SqlDbType.NVarChar);
            param[14].Value = Slist.ApplicantPermanentAddress;
            param[15] = new SqlParameter("@AdditionalQualification", SqlDbType.NVarChar);
            param[15].Value = Slist.AdditionalQualification;
            param[16] = new SqlParameter("@TotalExpInYear", SqlDbType.Int);
            param[16].Value = Slist.TotalExpInYear;
            param[17] = new SqlParameter("@TotalExpInMonth", SqlDbType.Int);
            param[17].Value = Slist.TotalExpInMonth;
            param[18] = new SqlParameter("@AdditionalExpInYear", SqlDbType.Int);
            param[18].Value = Slist.AdditionalExpInYear;

            param[19] = new SqlParameter("@AdditionalExpInMonth", SqlDbType.Int);
            param[19].Value = Slist.AdditionalExpInMonth;

            param[20] = new SqlParameter("@ApplicantCurrSal", SqlDbType.Float);
            param[20].Value = Slist.ApplicantCurrSal;
            param[21] = new SqlParameter("@ApplicantExpSal", SqlDbType.Float);
            param[21].Value = Slist.ApplicantExpSal;
            param[22] = new SqlParameter("@ApplicantCVPath", SqlDbType.NVarChar);
            param[22].Value = Slist.ApplicantCVPath;

            try
            {
                int ApplicantID = Convert.ToInt32(SqlHelper.ExecuteScalar(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SP_SaveApplication", param));
                return ApplicantID;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { }
        }


        public string SaveWorkExpByApplicant(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            string str = string.Empty;
            SqlParameter[] param = new SqlParameter[12];
            try
            {
                param[0] = new SqlParameter("@ApplicantID", SqlDbType.Int);
                param[0].Value = Slist.ApplicantID;
                param[1] = new SqlParameter("@CompanyName", SqlDbType.NVarChar);
                param[1].Value = Slist.CompanyName;
                param[2] = new SqlParameter("@empDesignation", SqlDbType.NVarChar);
                param[2].Value = Slist.empDesignation;
                param[3] = new SqlParameter("@CompanyTurnOver", SqlDbType.NVarChar);
                param[3].Value = Slist.CompanyTurnOver;
                param[4] = new SqlParameter("@NoOfEmployee", SqlDbType.Int);
                param[4].Value = Slist.NoOfEmployee;
                param[5] = new SqlParameter("@JobResponsibilities", SqlDbType.NVarChar);
                param[5].Value = Slist.JobResponsibilities;
                param[6] = new SqlParameter("@Location", SqlDbType.NVarChar);
                param[6].Value = Slist.Location;
                param[7] = new SqlParameter("@FromDate", SqlDbType.Date);
                param[7].Value = Slist.FromDate;
                param[8] = new SqlParameter("@ToDate", SqlDbType.Date);
                param[8].Value = Slist.ToDate;
                param[9] = new SqlParameter("@Reporting", SqlDbType.NVarChar);
                param[9].Value = Slist.Reporting;
                param[10] = new SqlParameter("@SalaryInlacs", SqlDbType.Float);
                param[10].Value = Slist.SalaryInlacs;
                param[11] = new SqlParameter("@ReasonForLeaving", SqlDbType.NVarChar);
                param[11].Value = Slist.ReasonForLeaving;

                //param[9] = new SqlParameter("@ApplicantLandLineOffice", SqlDbType.NVarChar);
                //param[9].Value = Slist.ApplicantLandLineOffice;
                //param[10] = new SqlParameter("@ApplicantLandLineResidance", SqlDbType.NVarChar);
                //param[10].Value = Slist.ApplicantLandLineResidance;

                str = Convert.ToString(SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SP_AddApplicant_WorkExp", param));
                return str;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }


        // Save Applicant Qualification
        public string Save_ApplicantQualification(DataAccessEntities Slist)
        {
            DataSet ds = new DataSet();
            string str = string.Empty;
            SqlParameter[] param = new SqlParameter[6];
            try
            {
                param[0] = new SqlParameter("@ApplicantID", SqlDbType.Int);
                param[0].Value = Slist.ApplicantID;
                param[1] = new SqlParameter("@AppQualification", SqlDbType.NVarChar);
                param[1].Value = Slist.AppQualification;
                param[2] = new SqlParameter("@AppDegree", SqlDbType.NVarChar);
                param[2].Value = Slist.AppDegree;
                param[3] = new SqlParameter("@AppUniversityName", SqlDbType.NVarChar);
                param[3].Value = Slist.AppUniversityName;
                param[4] = new SqlParameter("@AppSpecialization", SqlDbType.NVarChar);
                param[4].Value = Slist.AppSpecialization;
                param[5] = new SqlParameter("@AppPercentage_Grade", SqlDbType.NVarChar);
                param[5].Value = Slist.AppPercentage_Grade;

                str = Convert.ToString(SqlHelper.ExecuteNonQuery(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_SP_AddApplicant_Qualifications", param));
                return str;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }


        // Get Work Exp Details By AppId
        public DataSet GetWorkExperienceByAppId(DataAccessEntities slist)
        {
            DataSet dsApplication = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@ApplicantID", SqlDbType.Int);
                param[0].Value = slist.ApplicantID;

                //dsApplication = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetApplicationDetails", param);
                dsApplication = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetWorkExpByApplicant", param);
                return dsApplication;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsApplication = null;
            }
        }


        // Get Qualificaiton Details By AppId
        public DataSet GetQualificationByAppId(DataAccessEntities slist)
        {
            DataSet dsApplication = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@ApplicantID", SqlDbType.Int);
                param[0].Value = slist.ApplicantID;

                //dsApplication = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetApplicationDetails", param);
                dsApplication = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetQualificatinByApplicant", param);
                return dsApplication;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsApplication = null;
            }
        }



        // Get Position Info By JobId
        public DataSet GetPositionInfoByJobId(DataAccessEntities slist)
        {
            DataSet dsApplication = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@JobId", SqlDbType.Int);
                param[0].Value = slist.JobId;

                //dsApplication = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetApplicationDetails", param);
                dsApplication = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetPositionInfo", param);
                return dsApplication;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsApplication = null;
            }
        }

        public DataSet GetSpecialityWiseOpd()
        {
            DataSet dsSpecialityWiseOpd = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            //param[0] = new SqlParameter("@SpecialtyId", SqlDbType.Int);
            //param[0].Value = Slist.SpecialtyId;

            try
            {
                dsSpecialityWiseOpd = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetSpecialityWiseOpd", param);
                return dsSpecialityWiseOpd;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialityWiseOpd = null;

            }
        }
        public DataSet GetDoctorWiseOpd()
        {
            DataSet dsSpecialityWiseOpd = new DataSet();
            SqlParameter[] param = new SqlParameter[0];
            //param[0] = new SqlParameter("@SpecialtyId", SqlDbType.Int);
            //param[0].Value = Slist.SpecialtyId;

            try
            {
                dsSpecialityWiseOpd = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetDoctorWiseOpd", param);
                return dsSpecialityWiseOpd;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsSpecialityWiseOpd = null;

            }
        }

        public DataSet GetUsersPaymentDetail()
        {
            DataSet ds = new DataSet();
            try
            {
                ds = SqlHelper.ExecuteDataset(Config.GetConnectionString(), "GetUsersPaymentDetail");
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ds = null;
            }
        }

        public DataSet GetBannerById(DataAccessEntities slist)
        {
            DataSet dsGetBannerById = new DataSet();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@BannerId", SqlDbType.Int);
            param[0].Value = slist.BannerId;

            try
            {
                dsGetBannerById = SqlHelper.ExecuteDataset(Config.GetConnectionString(), CommandType.StoredProcedure, "JH_GetBannerById", param);
                return dsGetBannerById;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                dsGetBannerById = null;

            }
        }
       
    }
}
