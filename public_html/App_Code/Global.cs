using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

public static class AppGlobal
{
    public static int HomePageId
    {
        get
        {
            return 114;
        }
    }
    public static int VideoId
    {
        get
        {
            return 29;
        }
    }
    //public static int FeedbackId
    //{
    //    get
    //    {
    //        return 1;
    //    }
    //}
    //public static int Complaint
    //{
    //    get
    //    {
    //        return 2;
    //    }
    //}
    public static int PhotoID
    {
        get
        {
            return 29;
        }
    }
    public static int MedicalSpecialtiesId
    {
        get
        {
            return 1;
        }
    }
    public static int SpecialtyClinicsId
    {
        get
        {
            return 2;
        }
    }
    public static int PatientFacilitiesId
    {
        get
        {
            return 3;
        }
    }

    public static String ForgotPasswordEmailtemplate
    {
        get { return "forgotpassword"; }
    }

    public static string FeedbackEmailAddress
    {
        get { return "qmd@jaslokhospital.net"; }
    }
    public static string ComplaintEmailAddress
    {
        get
        {
            //return "hardik.patel@asentech.com";
            return "complaint_jhrc@jaslokhospital.net";
        }
    }

    public static string QuickEnquiryEmailAddress
    {
        get
        {
            //return "hardik.patel@asentech.com";
            return "marketing@jaslokhospital.net";
        }
    }

    public static string EstimateRequestEmailAddress
    {
        get
        {
            //return "hardik.patel@asentech.com";
            return "estimation@jaslokhospital.net";
        }
    }

    public static string FixAppointmentEmailAddress
    {
        get
        {
            //return "hardik.patel@asentech.com";
            return "appointments@jaslokhospital.net";
        }
    }

    public static string CareerEmailAddress
    {
        get
        {
            return "careers@jaslokhospital.net";
            //return "hardik.patel@asentech.com";
        }
    }

    public static string JaslokTimesEmailAddress
    {
        get
        {
            return "online@jaslokhospital.net";
            //return "abbas@asentechllc.com";
        }
    }

    public static string SpecialityDoctorCache
    {
        get
        {
            return "SpecialityDoctorCache";
            //return "hardik.patel@asentech.com";
        }
    }

    public static string SpecialityCache
    {
        get
        {
            return "SpecialityCache";
            //return "hardik.patel@asentech.com";
        }
    }

    public static string SpecialtyPage_BindSpecialtiesCache
    {
        get
        {
            return "SpecialtyPageCache";
        }
    }
    public static string SpecialtyPage_BindPageDetailCache
    {
        get
        {
            return "BindPageDetailCache";
        }
    }
    public static string SpecialityOPD_detailCache
    {
        get
        {
            return "SpecialityOPDdetail";
        }
    }
    public static string SpecialtyOPD_dDoctorsCache
    {
        get
        {
            return "SpecialtyOPDdDoctors";
        }
    }

    public static string HomeTestimonialCache
    {
        get
        {
            return "HomeTestimonialCache";
            //return "hardik.patel@asentech.com";
        }
    }

    public static string HomePressReleaseCache
    {
        get
        {
            return "HomePressReleaseCache";
            //return "hardik.patel@asentech.com";
        }
    }

    public static string HomeBannerCache
    {
        get
        {
            return "HomeBannerCache";
            //return "nileshc@asentech.com";
        }
    }

    public static string SpecialityOPDCache
    {
        get
        {
            return "SpecialityOPDCache";
            //return "nileshc@asentech.com";
        }
    }
    public static string DoctorsNameCache
    {
        get
        {
            return "DoctorsNameCache";
        }
    }
    public static int PortalId
    {
        get
        {
            return 0;
            //return "nileshc@asentech.com";
        }
    }

    public static int OTPExpiration
    {
        get
        {
            return 10;
        }
    }
    public static int EmailFormJasloktimesSubscribe
    {
        get
        {
            return 1;
        }
    }
    public static int EmailFormQuickenquiry
    {
        get
        {
            return 2;
        }
    }
    public static int EmailFormComplaint
    {
        get
        {
            return 3;
        }
    }
    public static int EmailFormEstimate
    {
        get
        {
            return 4;
        }
    }
    public static int EmailFormFeedBack
    {
        get
        {
            return 5;
        }
    }
    public static int EmailFormFixAnappointment
    {
        get
        {
            return 9;
        }
    }
    public static int EmailFormBedReservations
    {
        get
        {
            return 11;
        }
    }
    public static int EmailFormPermanentRegistration
    {
        get
        {
            return 12;
        }
    }
    public static int EmailFormHealthCheckup
    {
        get
        {
            return 13;
        }
    }
    public static int AllPaymentGatewayEmail
    {
        get
        {
            return 14;
        }
    }
    public enum JaslokEmailHandler
    {
        EmailFormJasloktimesSubscribe = 1,
        EmailFormQuickenquiry = 2,
        EmailFormComplaint = 3,
        EmailFormEstimate = 4,
        EmailFormFeedBack = 5,
        EmailFormFixAnappointment = 9,
        ApplyJaslokCareer=10
    }
}
