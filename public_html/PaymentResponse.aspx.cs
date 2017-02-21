using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessDataLayer;
using System.Data;
using System.IO;
using DotNetNuke.Entities.Users;
using System.Web.Security;
using System.Net.Mail;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using net.jaslokhospital.jaslokwebserver;

public partial class PaymentResponse : System.Web.UI.Page
{
    PortalSecurity secure = new PortalSecurity();
    UserInfo user = UserController.Instance.GetCurrentUserInfo();
    public BusinessLogic objBusinessLogic = new BusinessLogic();
    public DataAccessLogic objDALogic = new DataAccessLogic();
    public DataAccessEntities objDAEntities = new DataAccessEntities();
    JaslokMailer objMailer = new JaslokMailer();
    string lsEmailStatus = string.Empty;
    string lsSmsStatus = string.Empty;
    PatIndex objPatIndex = new PatIndex();
    string JeevaStatus = string.Empty;
    DataAccessEntities sessionData = new DataAccessEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            spnStatus.Visible = true;
            lblMsg.Visible = false;
            string secret_key = "ed70df7a017654499542ff0a5515812824b74142";
            string data = "";
            string txnId = Request["TxId"];
            string txnStatus = Request["TxStatus"];
            string amount = Request["amount"];
            string pgTxnId = Request["pgTxnNo"];
            string issuerRefNo = Request["issuerRefNo"];
            string authIdCode = Request["authIdCode"];
            string firstName = Request["firstName"];
            string lastName = Request["lastName"];
            string pgRespCode = Request["pgRespCode"];
            string zipCode = Request["addressZip"];
            string resSignature = Request["signature"];

            bool flag = true;
            if (txnId != null)
            {
                data += txnId;
            }
            if (txnStatus != null)
            {
                data += txnStatus;
            }
            if (amount != null)
            {
                data += amount;
            }
            if (pgTxnId != null)
            {
                data += pgTxnId;
            }
            if (issuerRefNo != null)
            {
                data += issuerRefNo;
            }
            if (authIdCode != null)
            {
                data += authIdCode;
            }
            if (firstName != null)
            {
                data += firstName;
            }
            if (lastName != null)
            {
                data += lastName;
            }
            if (pgRespCode != null)
            {
                data += pgRespCode;
            }
            if (zipCode != null)
            {
                data += zipCode;
            }

            System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));

            System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
            string signature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();

            if (resSignature != null && !signature.Equals(resSignature))
            {
                flag = false;
            }
            if (flag == true)
            {
                string Tranrefid = Convert.ToString(issuerRefNo);
                string Transtatus = Convert.ToString(txnStatus);
                //sessionData.Amount = Convert.ToInt32(Session["Amount"]);
                int UserId = user.UserID;
                lblUserName.Text = user.DisplayName;
                lblMNo.Text = user.Username; //= Convert.ToString(user.UserID);
                lblTxtnId.Text = Convert.ToString(txnId);
                lblPaidAgainst.Text = string.Empty;
                lblDateTime.Text = Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy"));
                lblAmount.Text = string.Empty;

                if (txnStatus == null)
                {
                    if (Session["Guid"] != null)
                    {
                        DataSet AppointmentDs = new DataSet();
                        if (txnStatus == "CANCELED")
                        {
                            Session["Guid"] = null;
                            Response.Redirect("/");
                        }
                        string Guid = Session["Guid"].ToString();

                        string PageName = Guid.Substring(0, 3);

                   /**/ if (PageName == "App")
                        {
                            AppointmentDs = objBusinessLogic.SavePaymentBookAppointment(txnId, Tranrefid, Transtatus, Guid, JeevaStatus);
                            if (AppointmentDs.Tables[0].Rows.Count > 0)
                            {
                                double Amount = Convert.ToDouble(AppointmentDs.Tables[0].Rows[0]["AMOUNT"]);
                                string ServiceName = Convert.ToString(AppointmentDs.Tables[0].Rows[0]["ServiceName"]);
                                int PaymentId = Convert.ToInt32(AppointmentDs.Tables[0].Rows[0]["PaymentId"]);
                                lblAmount.Text = Convert.ToString(Amount);
                                lblPaidAgainst.Text = ServiceName;
                                // Send data to Napier Service for Save Deposit
                                JeevaStatus = SaveDeposit(txnId, lblMNo.Text, Amount, Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy")), ServiceName);
                                // Code To Update Jeeva status in Payment Table
                                if (!string.IsNullOrEmpty(JeevaStatus))
                                {
                                    DataTable dt=null;
                                    objBusinessLogic.InsertPermenentRegPayment(JeevaStatus, PaymentId, lblMNo.Text,dt);
                                }
                                AppointmentSendEmail(Convert.ToString(AppointmentDs.Tables[0].Rows[0]["PhoneNo"]), Convert.ToString(AppointmentDs.Tables[0].Rows[0]["MobileNo"]), Convert.ToString(AppointmentDs.Tables[0].Rows[0]["Country"]), Convert.ToString(AppointmentDs.Tables[0].Rows[0]["StateName"]), Convert.ToString(AppointmentDs.Tables[0].Rows[0]["BookedDate"]), Convert.ToString(AppointmentDs.Tables[0].Rows[0]["AMOUNT"]) + ".00 INR", Convert.ToString(AppointmentDs.Tables[0].Rows[0]["Description"]), Convert.ToString(AppointmentDs.Tables[0].Rows[0]["DoctName"]), "ConsultationAppointment");
                                AppointmentDs.Tables[0].Rows.Clear();
                            }
                            Session["Guid"] = null;
                        }

                   /**/ else if (PageName == "Reg")
                             {
                                lblMsg.Visible = true;
                                string Gender = user.Profile.GetPropertyValue("Gender");
                                if (Gender == "Male")
                                {
                                    Gender = "M";
                                }
                                else { Gender = "F"; }
                                string Age = user.Profile.GetPropertyValue("Age");
                                string Address = user.Profile.GetPropertyValue("Address");
                                string PhoneNumber = user.Profile.GetPropertyValue("PhoneNumber");

                                string[] X = PhoneNumber.Split('-');
                                PhoneNumber = X[1];

                                string Username;
                                string Fname;
                                string Lname;
                                string Email;

                                if (user.Username.Length > 20)
                                {
                                    Username = user.Username.Substring(0, 20);
                                }
                                else
                                {
                                    Username = user.Username;
                                }

                                if (user.FirstName.Length > 30)
                                {
                                    Fname = user.FirstName.Substring(0, 30);
                                }
                                else
                                {
                                    Fname = user.FirstName;
                                }

                                if (user.LastName.Length > 30)
                                {
                                    Lname = user.LastName.Substring(0, 30);
                                }
                                else
                                {
                                    Lname = user.LastName;
                                }
                                if (user.Email.Length > 50)
                                {
                                    Email = user.Email.Substring(0, 50);
                                }
                                else
                                {
                                    Email = user.Email;

                                }
                                if (Address.Length > 30)
                                {
                                    Address = Address.Substring(0, 30);
                                }

                                if (PhoneNumber.Length > 12)
                                {
                                    PhoneNumber = PhoneNumber.Substring(0, 12);
                                }


                                var PatientDetails = NapierService(user.Username, user.FirstName, user.LastName, Gender, Age, "01/01/2000", Address, Address, Address, PhoneNumber, Email);

                                //var PatientDetails = objPatIndex.UpdateorInsertPatient(user.Username, user.FirstName, user.LastName, Gender, Age, "01/01/2000", Address, Address, Address, PhoneNumber, Email);

                                if (!string.IsNullOrEmpty(PatientDetails.MRNO))
                                {
                                    if (!string.IsNullOrEmpty(PatientDetails.WEBPWD))
                                    {
                                        bool IsExistMRNumber = objBusinessLogic.IsExistMRNumber(PatientDetails.MRNO);
                                        if (IsExistMRNumber == true)
                                        {
                                            Clear();
                                            lblMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0000");
                                            lblMsg.Text = "You Are Allready Registered As A permanent User!";
                                        }
                                        else
                                        {
                                            bool IsUserExist = objBusinessLogic.IsUserExist(PatientDetails.MRNO);
                                            if (!IsUserExist)
                                            {
                                                if (PatientDetails.PatSex == "M")
                                                {
                                                    PatientDetails.PatSex = "Male";
                                                }
                                                else
                                                {
                                                    PatientDetails.PatSex = "Female";
                                                }
                                                DataSet dsVal = InsertUpdateUserDetails(PatientDetails.MRNO, PatientDetails.PatFName, PatientDetails.PatLName, PatientDetails.PatEmail, PatientDetails.WEBPWD, PatientDetails.PatMobile, PatientDetails.PatSex, PatientDetails.PatAddr1, PatientDetails.PatAge);
                                                lblMNo.Text = PatientDetails.MRNO;

                                                if (dsVal.Tables[0].Rows.Count > 0)
                                                {
                                                    // SendMail & MSG
                                                    try
                                                    {
                                                        PermanentUserSendEmail(PatientDetails.PatFName, PatientDetails.PatEmail, PatientDetails.MRNO, PatientDetails.WEBPWD, PhoneNumber, "PermanentRegistration");

                                                    }
                                                    catch (Exception ex)
                                                    {
                                                        lblMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0000");
                                                        lblMsg.Text = "SMS Service is stoped Due to technical problem!";

                                                        Exceptions.LogException(ex);
                                                    }

                                                    lblMsg.Text = "You are now the permanent user! Please login with your MR Number that has been sent to your registered mobile number";
                                                    lblMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#008000");
                                                    UserController.DeleteUser(ref user, false, false);
                                                    UserController.RemoveUser(user);
                                                    if (user.UserID != -1)
                                                    {
                                                        secure.SignOut();
                                                    }
                                                }
                                            }
                                            else
                                            {
                                                Clear();
                                                lblMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0000");
                                                lblMsg.Text = "UserName already exist!";
                                            }
                                        }
                                    }
                                    else
                                    {
                                        Clear();
                                        lblMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0000");
                                        lblMsg.Text = "You are already register as a permanent user, Please login with MR Number";
                                    }
                                }
                                else
                                {
                                    Clear();
                                    lblMsg.Visible = true;
                                    lblMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0000");
                                    lblMsg.Text = "Due to some technical problem MRNumber is not generated please contact Jaslok Hospital!";
                                    plcDivSucces.Visible = true;
                                    plcDivError.Visible = false;
                                }

                                // code to save payment details of Per. Reg.
                                int PaymentId = 0;
                                int Amount = 100;
                                string ServiceName = "PermenantRegistration";
                                lblAmount.Text = Convert.ToString(Amount);
                                lblPaidAgainst.Text = ServiceName;
                                // Send data to Napier Service for Save Deposit
                                JeevaStatus = SaveDeposit(txnId, lblMNo.Text, Amount, Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy")), ServiceName);
                            
                                DataTable dt = new DataTable();
                                dt.Columns.AddRange(new DataColumn[9] { new DataColumn("TRANSACTIONID"), new DataColumn("TRANREFID"), new DataColumn("TRANSTATUS"), new DataColumn("AMOUNT"),new DataColumn("USERID"), new DataColumn("PORTALID"), new DataColumn("JeevaStatus"), new DataColumn("MrNo"),new DataColumn("ServiceName")});
                                

                               //Add rows to DataTable.
                                dt.Rows.Add(txnId, Tranrefid, Transtatus, Amount, user.UserID, AppGlobal.PortalId, JeevaStatus, lblMNo.Text, ServiceName);

                                if (dt.Rows.Count > 0)
                                {
                                    objBusinessLogic.InsertPermenentRegPayment(JeevaStatus, PaymentId, lblMNo.Text, dt);
                                }

                               // DataSet PayDs = objBusinessLogic.SavePaymentDetails(Guid, txnId, Tranrefid, Transtatus);

                                //if (PayDs.Tables[0].Rows.Count > 0)
                                //{
                                //    double Amount = Convert.ToDouble(PayDs.Tables[0].Rows[0]["AMOUNT"]);
                                //    string ServiceName = Convert.ToString(PayDs.Tables[0].Rows[0]["ServiceName"]);
                                //    int PaymentId = Convert.ToInt32(PayDs.Tables[0].Rows[0]["PaymentId"]);
                                //    lblPaidAgainst.Text = "PermenantRegistration";
                                //    lblAmount.Text = Convert.ToString(100);
                                //    // Send data to Napier Service for Save Deposit
                                //    JeevaStatus = SaveDeposit(txnId, lblMNo.Text, Amount, Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy")), ServiceName);

                                //    // Code To Update Jeeva status in Payment Table
                                //    if (!string.IsNullOrEmpty(JeevaStatus))
                                //    {
                                //        objBusinessLogic.UpdateJeevaStatus(JeevaStatus, PaymentId, lblMNo.Text, true);
                                //    }
                                //}
                        }

                  /**/else
                        {
                            DataSet ds = objBusinessLogic.SavePaymentDetails(Guid, txnId, Tranrefid, Transtatus);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                double Amount = Convert.ToDouble(ds.Tables[0].Rows[0]["Amount"]);
                                string ServiceName = Convert.ToString(ds.Tables[0].Rows[0]["ServiceName"]);
                                string ServicePackage = Convert.ToString(ds.Tables[0].Rows[0]["ServicePackage"]);
                                string BookDate = Convert.ToString(ds.Tables[0].Rows[0]["BEDBOOKINDATETIME"]);
                                int PaymentId = Convert.ToInt32(ds.Tables[0].Rows[0]["PaymentId"]);
                                string processName = Convert.ToString(ds.Tables[0].Rows[0]["processName"]);
                                lblAmount.Text = Convert.ToString(Amount);
                                lblPaidAgainst.Text=ServiceName;
                                // Send data to Napier Service for Save Deposit
                                JeevaStatus = SaveDeposit(txnId, lblMNo.Text, Amount, Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy")), ServiceName);

                                // Code To Update Jeeva status in Payment Table
                                if (!string.IsNullOrEmpty(JeevaStatus))
                                {
                                    DataTable dt=null;
                                    objBusinessLogic.InsertPermenentRegPayment(JeevaStatus, PaymentId, lblMNo.Text,dt);
                                }
                                // Conditions For Email
                                if (processName == "Bed" || processName == "Sur" || processName == "Hea")
                                {
                                    string TemplateName = string.Empty;
                                    if (processName == "Bed")
                                    {
                                        TemplateName = "BedBookingPayment";
                                                        
                                    }
                                    else if (processName == "Sur")
                                    {
                                        TemplateName = "SurgeryBookingPayment";
                                                        
                                    }
                                    else if (processName == "Hea")
                                    {
                                        TemplateName = "HealthCheckPayment"; 
                                    }

                                    ServiceBookingSendEmail(user.DisplayName, user.Email, ServiceName, ServicePackage, BookDate, Amount + ".00 INR", TemplateName);
                                }
                                else if (processName == "Out")
                                {
                                    OutStandingSendEmail(sessionData.FacilityName, Amount + ".00 INR", "OutstandingPayment");
                                }

                                ds.Tables[0].Rows.Clear();

                            }
                            Session["Guid"] = null;
                        }
                    }
                }
                else
                {
                    plcDivSucces.Visible = false;
                    plcDivError.Visible = true;
                    spnStatus.Attributes["Class"] = "highlight";
                    spnStatus.InnerText = "Payment Fail !";
                }
            }
            else
            {
                Response.Write("Citrus Response Signature and Our (Merchant)Signature Mis - Match");
            }
        }
        catch (Exception ex)
        {
            Exceptions.LogException(ex);
        }

    }

    private ReceiptDetails NapierService(string TxtnId, string MRNO, double Amount, string ReceiptDate, string Remark)
    {
        var details = (dynamic)null;
        details = objPatIndex.SaveDeposit("JEEVAPG", "JEEVAPG@16", TxtnId, MRNO, Amount, ReceiptDate, Remark);
        return details;

    }

    private MstPaintx NapierService(string UserName,string FirstName,string LastName,string Gender,string Age,string DOB,string Add1,string Add2,string Add3,string MobNo,string Email)
    {
        var PatientDetails = (dynamic)null;
        PatientDetails = objPatIndex.UpdateorInsertPatient("JEEVAPG", "JEEVAPG@16", UserName, FirstName, LastName, Gender, Age, DOB, Add1, Add2, Add3, MobNo, Email);
        return PatientDetails;
    }


    private string SaveDeposit(string TxtnId,string MrNo,double Amount,string ReceiptDate,string remark)
    {
        var details = (dynamic)null;
        try
        {
            details = NapierService(TxtnId, MrNo, Amount, ReceiptDate,remark);
        }
        catch (Exception ex)
        {
            Exceptions.LogException(ex);
            JeevaStatus = "Service Unavailable";
        }
        if (details != null && !string.IsNullOrEmpty(details.MRNO))
        {
            JeevaStatus = details.MRNO;
        }
        return JeevaStatus;
    }

    public void Clear()
    {
        lblUserName.Text = string.Empty;
        lblMNo.Text = string.Empty;
        lblTxtnId.Text = string.Empty;
        lblPaidAgainst.Text = string.Empty;
        lblDateTime.Text = string.Empty;
        lblAmount.Text = string.Empty;
        spnStatus.Visible = false;
        plcDivSucces.Visible = false;
    }

    public DataSet InsertUpdateUserDetails(string MRNO, string FName, string LName, string Email, string Password, string Telephone, string Gender, string Address, string Age)
    {
        try
        {
            string lsUserName = string.Empty;

            lsUserName = MRNO;

            string lsOtp = Guid.NewGuid().ToString().ToUpper().Split('-')[0];

            Membership.CreateUser(lsUserName, Password);

            DataSet ds = objBusinessLogic.SaveUserDetails(MRNO, lsUserName, FName, LName, Email, FName, Password, Telephone, Gender, Address, Age, lsOtp);

            return ds;
        }
        catch (Exception ex)
        {
            Exceptions.LogException(ex);
            throw ex;
        }


    }
    public void PermanentUserSendEmail(string Username, string Email, string MRNO, string Password, string MobileNo, string TemplateName)
    {
        List<Parameters> lstParameters = new List<Parameters>();


        lstParameters.Add(new Parameters { ShortCodeName = "Username", ShortCodeValue = user.DisplayName });
        lstParameters.Add(new Parameters { ShortCodeName = "Email", ShortCodeValue = user.Email });
        lstParameters.Add(new Parameters { ShortCodeName = "MRNO", ShortCodeValue = MRNO });
        lstParameters.Add(new Parameters { ShortCodeName = "Password", ShortCodeValue = Password });

        DataSet ds = new DataSet();
        ds = null;
        ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(AppGlobal.EmailFormPermanentRegistration);
        string EmailToId = string.Empty;
        string EmailCCId = string.Empty;
        if (ds.Tables[0].Rows.Count > 0)
        {
            EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
            EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);
        }
        lsEmailStatus = objMailer.SendEmail(TemplateName, lstParameters, EmailToId, EmailCCId);
        TemplateName = TemplateName + "_user";
        lsEmailStatus = objMailer.SendEmail(TemplateName, lstParameters, user.Email, EmailCCId);
        if (TemplateName == "PermanentRegistration_user")
        {
            lsSmsStatus = objMailer.SendSms(TemplateName, lstParameters, MobileNo);
        }
        lstParameters = null;
    }

    public void ServiceBookingSendEmail(string Username, string Email, string ServiceName, string ServicePackage, string BookingDateTime, string DepositAmount, string TemplateName)
    {
        List<Parameters> lstParameters = new List<Parameters>();

        lstParameters.Add(new Parameters { ShortCodeName = "Username", ShortCodeValue = user.DisplayName });
        lstParameters.Add(new Parameters { ShortCodeName = "Email", ShortCodeValue = user.Email });
        lstParameters.Add(new Parameters { ShortCodeName = "ServiceName", ShortCodeValue = ServiceName });
        lstParameters.Add(new Parameters { ShortCodeName = "ServicePackage", ShortCodeValue = ServicePackage });
        lstParameters.Add(new Parameters { ShortCodeName = "BookingDateTime", ShortCodeValue = BookingDateTime });
        lstParameters.Add(new Parameters { ShortCodeName = "DepositAmount", ShortCodeValue = DepositAmount });
        string PhoneNumber = user.Profile.GetPropertyValue("PhoneNumber");

        DataSet ds = new DataSet();
        int _emailTemplateID = -1;
        if (TemplateName.ToLower() == "bedbookingpayment")
            _emailTemplateID = 11;
        else if (TemplateName.ToLower() == "healthcheckpayment")
            _emailTemplateID = 13;
        else
            _emailTemplateID = 14;

        ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(_emailTemplateID);
        string EmailToId = string.Empty;
        string EmailCCId = string.Empty;
        if (ds.Tables[0].Rows.Count > 0)
        {
             EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
             EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);
        }
        lsEmailStatus = objMailer.SendEmail(TemplateName, lstParameters, EmailToId, EmailCCId);
        TemplateName = TemplateName + "_user";
        lsEmailStatus = objMailer.SendEmail(TemplateName, lstParameters, Email, EmailCCId);
        lsSmsStatus = objMailer.SendSms(TemplateName, lstParameters, PhoneNumber);

        lstParameters = null;
    }

    public void OutStandingSendEmail(string ServiceName, string DepositAmount, string TemplateName)
    {
        List<Parameters> lstParameters = new List<Parameters>();

        lstParameters.Add(new Parameters { ShortCodeName = "Username", ShortCodeValue = user.DisplayName });
        lstParameters.Add(new Parameters { ShortCodeName = "Email", ShortCodeValue = user.Email });
        lstParameters.Add(new Parameters { ShortCodeName = "ServiceName", ShortCodeValue = ServiceName });
        lstParameters.Add(new Parameters { ShortCodeName = "DepositAmount", ShortCodeValue = DepositAmount });


        DataSet ds = new DataSet();
        ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(AppGlobal.EmailFormOtherPaymentForms);
        string EmailToId=string.Empty;
        string EmailCCId=string.Empty;
        if (ds.Tables[0].Rows.Count > 0)
        {
             EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
             EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);
        }
        lsEmailStatus = objMailer.SendEmail(TemplateName, lstParameters, EmailToId, EmailCCId);
        TemplateName = TemplateName + "_user";
        string val = lstParameters[3].ShortCodeValue.Replace("&nbsp;", " ");
        string PhoneNumber = user.Profile.GetPropertyValue("PhoneNumber");
        lsEmailStatus = objMailer.SendEmail(TemplateName, lstParameters, user.Email, EmailCCId);
        lsSmsStatus = objMailer.SendSms(TemplateName, lstParameters, PhoneNumber);
        lstParameters = null;
    }

    public void AppointmentSendEmail(string PhoneNo, string MobileNo, string Location, string Address, string TimeDate, string lblAmount, string Description, string doctorName, string TemplateName)
    {
        List<Parameters> lstParameters = new List<Parameters>();

        lstParameters.Add(new Parameters { ShortCodeName = "Username", ShortCodeValue = user.DisplayName });
        lstParameters.Add(new Parameters { ShortCodeName = "Email", ShortCodeValue = user.Email });
        lstParameters.Add(new Parameters { ShortCodeName = "PhoneNo", ShortCodeValue = PhoneNo });
        lstParameters.Add(new Parameters { ShortCodeName = "MobileNo", ShortCodeValue = MobileNo });
        lstParameters.Add(new Parameters { ShortCodeName = "Location", ShortCodeValue = Location });
        lstParameters.Add(new Parameters { ShortCodeName = "Address", ShortCodeValue = Address });
        lstParameters.Add(new Parameters { ShortCodeName = "TimeDate", ShortCodeValue = TimeDate });
        lstParameters.Add(new Parameters { ShortCodeName = "AppointmentTypeCharge", ShortCodeValue = lblAmount });
        lstParameters.Add(new Parameters { ShortCodeName = "Description", ShortCodeValue = Description });
        lstParameters.Add(new Parameters { ShortCodeName = "DoctorName", ShortCodeValue = doctorName });


        DataSet ds = new DataSet();
        ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(AppGlobal.EmailFormFixAnappointment);
        string EmailToId = string.Empty;
        string EmailCCId = string.Empty;
        if (ds.Tables[0].Rows.Count > 0)
        {
             EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
             EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);
        }
        objMailer.SendEmail(TemplateName, lstParameters, EmailToId, EmailCCId);
        TemplateName = TemplateName + "_user";
        objMailer.SendEmail(TemplateName, lstParameters, user.Email, EmailCCId);
        string val = lstParameters[7].ShortCodeValue.Replace("&nbsp;", " ");
        string PhoneNumber = user.Profile.GetPropertyValue("PhoneNumber");
        lstParameters.Add(new Parameters { ShortCodeName = "AppointmentTypeCharge", ShortCodeValue = lblAmount });
        if (TemplateName == "ConsultationAppointment_user")
        {
            lsSmsStatus = objMailer.SendSms(TemplateName, lstParameters, PhoneNumber);
        }
        lstParameters = null;
    }
}