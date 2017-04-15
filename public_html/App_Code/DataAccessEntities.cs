
using System;
namespace BusinessDataLayer
{
    public class DataAccessEntities
    {

        #region "Fields"

        public string CategoryName { get; set; }
        public string LocationName { get; set; }
        public string PositionName { get; set; }
        public int LocationID { get; set; }
        public int CategoryID { get; set; }
        public int PositionID { get; set; }
        #endregion

        #region "Location"
        public string newLocationName { get; set; }
        public int locationidexists { get; set; }
        #endregion

        #region "Educational Program"

        public string Content { get; set; }
        public string EducationalProgram { get; set; }
        public string EducationalProgramContent { get; set; }
        #endregion

        #region "Manage Enquiry"
        public int EnquiryId { get; set; }
        public string EnquiryType { get; set; }
        public int EnquiryTypeId { get; set; }       
        public int FeedbackID { get; set; }
        public string Gender { get; set; }
        public string FeedBackInfo { get; set; }
        public int Tid { get; set; }
        #endregion

        #region "Banner"
        public int BannerId { get; set; }
        public string BannerTitle { get; set; }
        public string BannerDesc { get; set; }
        public string AlternateText { get; set; }
        public string BannerLink { get; set; }
        public int PageTypeId { get; set; }
        public string optype { get; set; }
        #endregion

        #region "Page"
        public string PageType { get; set; }
        public string PageTitle { get; set; }
        public string PageDesc { get; set; }
        public string PageKeywords { get; set; }
        #endregion

        #region "Album"
        public int AlbumID { get; set; }
        public string AlbumTitle { get; set; }
        public string AlbumDesc { get; set; }
        public string AlbumImageUrl { get; set; }
        public string AlbumImgAlternateText { get; set; }
        public string AlbumType { get; set; }
        #endregion

        #region "Photo"
        public int PhotoID { get; set; }
        public string PhotoTitle { get; set; }
        public string PhotoDesc { get; set; }
        public string PhotoImageUrl { get; set; }
        public string PhotoImgAlternateText { get; set; }

        #endregion

        #region "Video"
        public int VideoId { get; set; }
        public string VideoTitle { get; set; }
        public string VideoDesc { get; set; }
        public string VideoUrl { get; set; }

        #endregion

        #region "Testinomial"
        public int TestimonialId { get; set; }
        public string tName { get; set; }
        public string Surname { get; set; }
        public string tMobileNo { get; set; }
        public string EmailId { get; set; }
        public string Comment { get; set; }
        public string tImageUrl { get; set; }
        public string ProfileImageUrl { get; set; }
        public bool ShowOnHomePage { get; set; }
        public bool IsApproved { get; set; }
        #endregion

        #region "Specialties"
        public int SpecialtyId { get; set; }
        public string SpecialtyName { get; set; }
        public int CategoryId { get; set; }
        public string SpecialtyDescription { get; set; }
        public string CreatedBy { get; set; }
        public string SpecialtyBanner { get; set; }
        #endregion

        #region "SpecialtyTabMap"
        public int TabId { get; set; }
        public string SelectTabId { get; set; }
        public string SpecialtyMap { get; set; }
        #endregion

        #region "Doctor"
       
            public int DoctorId { get; set; }
            public string dName { get; set; }
            public string dTitle { get; set; }
            public string Specialization { get; set; }
            public string Briefwrite { get; set; }
            public string Awards { get; set; }
            public string AreaExpertise { get; set; }
            public string dMobileNo { get; set; }
            public string dPhno { get; set; }
            public string dImageUrl { get; set; }
            public string dEmailId { get; set; }
            public string AppointmentType { get; set; }
            public int AppointmentTypeCharge { get; set; }
            public int ConsultingCharge { get; set; }
            public int FollowUpCharge { get; set; }

        #endregion   

        #region "User"
        public int UserId { get; set; }
        public int UTypeId { get; set; }
        public string UName { get; set; }
        public string UTitle { get; set; }
        public string UDesignation { get; set; }
        public string UDescription { get; set; }
        public string UContactNo{ get; set; }
        public bool UIsActive { get; set; }
        public string UImageUrl { get; set; }
        public string UEmail { get; set; }
        #endregion

        #region "Common Fields"
        public int Id { get; set; }
        public int Type { get; set; }
        public int PageTabId { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public string Designation { get; set; }
        public string Description { get; set; }
        public string PhoneNo { get; set; }
        public string MobileNo { get; set; }
        public string FaxNo { get; set; }
        public bool IsActive { get; set; }
        public string ImageUrl { get; set; }
        public string Thumbnail { get; set; }
        public string Graduate { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Position { get; set; }
        public string Location { get; set; }
        public string Day { get; set; }
        public string Time { get; set; }
        public string RedirectLink { get; set; }
        public string About { get; set; }
        public string Facilities { get; set; }
        public DateTime TimeDate { get; set; }
        public DateTime DOB { get; set; }
        public int Age { get; set; }
        public int CreatedByUserID { get; set; }
        public int UpdatedByUserID { get; set; }
        #endregion

        #region "Method"
        public string Image_Save_Path { get; set; }

        public string RemoveBadChar(string f)
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
            f = f.Replace("'", "");
            f = f.Replace("%20", "_");
            f = f.ToLower();
            //if (f.Length > 25)
            //{
            //    int intLength = f.Length;
            //    int intStartIndex = intLength - 15;
            //    f = f.Substring(intStartIndex);
            //}
            return f;
        }

        public string RemoveBadCharGallery(string f)
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
            f = f.Replace("'", "");
            f = f.Replace("%20", "_");
           // f = f.ToLower();

            return f;
        }
        public string RemoveBadCharForFolder(string f)
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
           // f = f.ToLower();
            //if (f.Length > 25)
            //{
            //    int intLength = f.Length;
            //    int intStartIndex = intLength - 15;
            //    f = f.Substring(intStartIndex);
            //}
            return f;
        }

        public string RemoveBadCharForFolderGallery(string f)
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
            f = f.ToLower();

            return f;
        }
        public string ThumbImageUrl { get; set; }
        #endregion

        #region "Career"
        public int JobId { get; set; }
        public int FunctionId { get; set; }
        public string FunctionName { get; set; }
        public string Job_Role { get; set; }
        public string ReportTo { get; set; }
        public object TotalVacantPosition { get; set; }
        public object MinExp { get; set; }
        public object MaxExp { get; set; }
        public string ProfessionalRequirement { get; set; }
        public string Education { get; set; }
        public string ExpiryDate { get; set; }
        public string Salary { get; set; }
        public string SubmittedAt { get; set; }

        public int jcPageSize { get; set; }
        public int jcCurrentPageIndex { get; set; }
        public string TotalExperience { get; set; }
        public int TotalRecord { get; set; }

        #endregion

        #region ApplyCareer
        public int ApplicantID { get; set; }
        //public int PositionID { get; set; }
        public string ApplicantFirstName { get; set; }
        public string ApplicantMiddleName { get; set; }
        public string ApplicantLastName { get; set; }
        public string ApplicantDOB { get; set; }
        public string ApplicantGender { get; set; }
        public string ApplicantReligion { get; set; }
        public string ApplicantNationality { get; set; }
        public string ApplicantLandLineOffice { get; set; }
        public string ApplicantLandLineResidance { get; set; }
        public string ApplicantMobile { get; set; }
        public string ApplicantEmail { get; set; }
        public string ApplicantCurrentAddress { get; set; }
        public string ApplicantPermanentAddress { get; set; }
        public string AdditionalQualification { get; set; }
        public object TotalExpInYear { get; set; }
        public object TotalExpInMonth { get; set; }

        public object AdditionalExpInYear { get; set; }
        public object AdditionalExpInMonth { get; set; }
        public object ApplicantCurrSal { get; set; }
        public object ApplicantExpSal { get; set; }
        public string ApplicantCVPath { get; set; }


        public string CompanyName { get; set; }
        public string empDesignation { get; set; }
        public string CompanyTurnOver { get; set; }
        public int NoOfEmployee { get; set; }
        public string JobResponsibilities { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public object SalaryInlacs { get; set; }
        public string ReasonForLeaving { get; set; }
        public string Reporting { get; set; }

        public int ApplicantQualificationID { get; set; }
        public string AppQualification { get; set; }
        public string AppDegree { get; set; }
        public string AppUniversityName { get; set; }
        public string AppSpecialization { get; set; }
        public string AppPercentage_Grade { get; set; }
        public string ApplicantName { get; set; }



        #endregion

        #region "DoctorSchedule"
        //DoctorSchedule
        public int DSId { get; set; }
        public int DoctorScheduleId { get; set; }
        public string Room { get; set; }
        public string Action { get; set; }
        public int TimeSlot { get; set; }
        //HealthTips
        public int HealthTipId { get; set; }
        public string HTitle { get; set; }
        public string HDescription { get; set; }
        public string HImageUrl { get; set; }
        #endregion

        #region Seminars
        public int SeminarId { get; set; }
        public string Brochure { get; set; }
        public string TimeTOPIC { get; set; }
        #endregion


        #region "News"
        public int NewId { get; set; }
        public string NewsTitle { get; set; }
        public DateTime NewsDate { get; set; }
        public string NewsContent { get; set; }
        public bool NewsIsActive { get; set; }
        #endregion 


        #region Home Slider
        public int SliderId { get; set; }
        #endregion


        #region Application
        public int CareerAppId { get; set; }
        #endregion

        #region Seminar
        public int seminarEnryId { get; set; }
        public string Institution { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public string Fax { get; set; }
        #endregion

        #region Speciality ClinicOPD
        public int SpecialityClinicId { get; set; }
        #endregion

        #region JaslokTimes
        //public int CategoryId { get;set;}
        //public string CategoryName { get; set; }
        public string FileName { get; set; }
        public string FileFriendlyName { get; set; }
        public string FilePath { get; set; }
        public int JaslokTimesId { get; set; }
        public int JaslokTimesCategoryId { get; set; }
        public Boolean IsActiveJaslokTimes { get; set; }
        public string FileExtension { get; set; }
        public string PdfPath { get; set; }

        #endregion

        #region WhatsNew
        public string WhatsNewTitle { get; set; }
        public int WhatsNewId { get; set; }
        public Boolean IsActiveWhatsNew { get; set; }
        public string WNSummury { get; set; }

        #endregion

        #region SAchievement
        public int AchievementID { get; set; }
        public string AchievementTitle { get; set; }
        public DateTime PublishedDate { get; set; }
        public string AchievementSummery { get; set; }
        #endregion

        //ESTIMATE FORM
        public string Option1 { get; set; }
        public string Option2 { get; set; }
        public string Option3 { get; set; }
        public string Option4 { get; set; }
        public string Guid { get; set; }

        #region FormsEmailDetail
        public string FormType { get; set; }
        public string EmailToId { get; set; }
        public string EmailCCId { get; set; }
        #endregion


        #region User CSV Updation
         public string UserName { get; set; }
         public string MRNumber { get; set; }
        #endregion

         #region Book Bed

         public string FacilityName { get; set; }         
         public string OptInType { get; set; }
         public string Category { get; set; }
         public string AdmissionCharge { get; set; }        
         public string Suite_Deluxe { get; set; }
         public string A_Deluxe { get; set; }
         public string A_Class { get; set; }
         public string B_Class { get; set; }
         public string E_Class { get; set; }        
         public DateTime BookinDateTime { get; set; }

         public string Transactionid { get; set; }
         public string Tranrefid { get; set; }
         public string Transtatus { get; set; }
         public string JeevaStatus { get; set; }
         public int Amount { get; set; }
         public string Paidagainst { get; set; }
         public string Mrnumber { get; set; }

         public int Portalid { get; set; }


         #endregion

         #region ResearchPaper
         public string ThumbnailImage { get; set; }
         public string ResearchPaperPDF { get; set; }
         public string ThumbnailImageURL { get; set; }
         public string ResearchPaperPDFURL { get; set; }
         #endregion
    }


    public class MenuItems
    {
        public int Id { get; set; }
        public int ParentId { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public bool Published { get; set; }
        public int TabID { get; set; }
    }

}