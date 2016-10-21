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
using net.jaslokhospital.jaslokwebserver;
using System.Web.Security;
using System.Net.Mail;
using DotNetNuke.Security;

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

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            spnStatus.Visible = true;

            lblMsg.Visible = false;
            string secret_key = "66fc8c3cca181b8954338bb5d5bd0cbb18b99b6d";
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

                //Response.Write("Thank You for using citrus payment Your Unique Transaction Status:" + Convert.ToString(txnStatus));
                if (Session["Bed"] != null || Session["Surgery"] != null || Session["AppointmentDetail"] != null || Session["HealthCheck-upComprehensive"] != null || Session["OutstandingBillPayment"] != null || Session["permenantRegistration"] != null || Session["ConsultationAppointment"] != null)
                {
                    DataAccessEntities sessionData = new DataAccessEntities();
                    if (Session["Bed"] != null)
                    {
                        sessionData = (DataAccessEntities)Session["Bed"];
                    }
                    else if (Session["Surgery"] != null)
                    {
                        sessionData = (DataAccessEntities)Session["Surgery"];
                    }
                    else if (Session["AppointmentDetail"] != null)
                    {
                        sessionData = (DataAccessEntities)Session["AppointmentDetail"];
                    }
                    else if (Session["HealthCheck-upComprehensive"] != null)
                    {
                        sessionData = (DataAccessEntities)Session["HealthCheck-upComprehensive"];
                    }
                    else if (Session["OutstandingBillPayment"] != null)
                    {
                        sessionData = (DataAccessEntities)Session["OutstandingBillPayment"];
                    }
                    else if (Session["permenantRegistration"] != null)
                    {
                        sessionData = (DataAccessEntities)Session["permenantRegistration"];
                    }
                    else if (Session["ConsultationAppointment"] != null)
                    {
                        sessionData = (DataAccessEntities)Session["ConsultationAppointment"];
                    }


                    //double Damount = Convert.ToDouble(amount);

                    sessionData.Tranrefid = Convert.ToString(issuerRefNo);
                    sessionData.Transtatus = Convert.ToString(txnStatus);
                    sessionData.Amount = Convert.ToInt32(Session["Amount"]);
                    sessionData.UserId = user.UserID;

                    lblUserName.Text = user.DisplayName;
                    lblMNo.Text = sessionData.MRNumber; //= Convert.ToString(user.UserID);
                    lblTxtnId.Text = sessionData.Transactionid = Convert.ToString(txnId);
                    lblPaidAgainst.Text = sessionData.FacilityName;
                    lblDateTime.Text = Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy"));
                    lblAmount.Text = Convert.ToString(Session["Amount"]) + ".00 INR";

                    if (txnStatus != null)
                    {
                        PatIndex objDeposit = new PatIndex();

                        if (Session["Bed"] != null)
                        {
                            if (txnStatus == "CANCELED")
                            {
                                Session["Bed"] = null;
                                Response.Redirect("/Bed-Booking");

                            }

                            objBusinessLogic.SavePaymentBedSurgery(sessionData);
                            ServiceBookingSendEmail(user.DisplayName, user.Email, sessionData.FacilityName, sessionData.Category, lblDateTime.Text, lblAmount.Text, "BedBookingPayment", AppGlobal.EmailFormBedReservations);
                            ServiceBookingSendEmail(user.DisplayName, user.Email, sessionData.FacilityName, sessionData.Category, lblDateTime.Text, lblAmount.Text, "BedBookingPayment_user", AppGlobal.EmailFormBedReservations);
                            Session["Bed"] = null;
                        }

                        else if (Session["Surgery"] != null)
                        {
                            if (txnStatus == "CANCELED")
                            {
                                Session["Surgery"] = null;
                                Response.Redirect("/surgery-booking");

                            }
                            objBusinessLogic.SavePaymentBedSurgery(sessionData);
                            ServiceBookingSendEmail(user.DisplayName, user.Email, sessionData.FacilityName, sessionData.Category, lblDateTime.Text, lblAmount.Text, "SurgeryBookingPayment", AppGlobal.EmailFormBedReservations);
                            ServiceBookingSendEmail(user.DisplayName, user.Email, sessionData.FacilityName, sessionData.Category, lblDateTime.Text, lblAmount.Text, "SurgeryBookingPayment_user", AppGlobal.EmailFormBedReservations);
                            Session["Surgery"] = null;
                        }
                        else if (Session["HealthCheck-upComprehensive"] != null)
                        {
                            if (txnStatus == "CANCELED")
                            {
                                Session["HealthCheck-upComprehensive"] = null;
                                Response.Redirect("/health-check-up-comprehensive");

                            }
                            objBusinessLogic.SavePaymentBedSurgery(sessionData);
                            ServiceBookingSendEmail(user.DisplayName, user.Email, sessionData.FacilityName, sessionData.Category, lblDateTime.Text, lblAmount.Text, "HealthCheckPayment", AppGlobal.EmailFormHealthCheckup);
                            ServiceBookingSendEmail(user.DisplayName, user.Email, sessionData.FacilityName, sessionData.Category, lblDateTime.Text, lblAmount.Text, "HealthCheckPayment_user", AppGlobal.EmailFormHealthCheckup);
                            Session["HealthCheck-upComprehensive"] = null;
                        }
                        else if (Session["OutstandingBillPayment"] != null)
                        {
                            if (txnStatus == "CANCELED")
                            {
                                Session["OutstandingBillPayment"] = null;
                                Response.Redirect("/outstandingbillpayment");

                            }
                            objBusinessLogic.SavePaymentBedSurgery(sessionData);
                            OutStandingSendEmail(sessionData.FacilityName, lblAmount.Text, "OutstandingPayment");
                            OutStandingSendEmail(sessionData.FacilityName, lblAmount.Text, "OutstandingPayment_user");
                            Session["OutstandingBillPayment"] = null;
                        }
                        else if (Session["permenantRegistration"] != null)
                        {
                            if (txnStatus == "CANCELED")
                            {
                                Session["permenantRegistration"] = null;
                                Response.Redirect("/");

                            }
                            Session["permenantRegistration"] = null;
                            lblMsg.Visible = true;

                            PatIndex objPatIndex = new PatIndex();

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

                            var PatientDetails = objPatIndex.UpdateorInsertPatient(user.Username, user.FirstName, user.LastName, Gender, Age, "01/01/2000", Address, Address, Address, PhoneNumber, Email);

                            if (!string.IsNullOrEmpty(PatientDetails.WEBPWD))
                            {

                                DataSet ds = objBusinessLogic.IsExistMRNumber(PatientDetails.MRNO);
                                if (ds.Tables[0].Rows.Count > 0)
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

                                        objBusinessLogic.SavePaymentBedSurgery(sessionData);
                                        lblMNo.Text = PatientDetails.MRNO;

                                        if (dsVal.Tables[0].Rows.Count > 0)
                                        {
                                            // SendMail & MSG

                                            try
                                            {
                                                PermanentUserSendEmail(PatientDetails.PatFName, PatientDetails.PatEmail, PatientDetails.MRNO, PatientDetails.WEBPWD, PhoneNumber, "PermanentRegistration");
                                                PermanentUserSendEmail(PatientDetails.PatFName, PatientDetails.PatEmail, PatientDetails.MRNO, PatientDetails.WEBPWD, PhoneNumber, "PermanentRegistration_user");
                                                lblMsg.Text = "You are now the permanent user! Please login with your MR Number that has been sent to your registered mobile number";
                                                lblMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#008000");
                                            }
                                            catch (Exception ex)
                                            {
                                                lblMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0000");
                                                lblMsg.Text = "SMS Service is stoped Due to technical problem!";
                                            }
                                            UserController.DeleteUser(ref user, false, false);
                                            UserController.RemoveUser(user);

                                            /*UserInfo objUserInfo = new UserInfo();
                                            objUserInfo = UserController.GetUserByName(user.Username);
                                            objUserInfo.Membership.Approved = false;
                                            UserController.UpdateUser(0, objUserInfo);*/

                                            //string display = "You are now the permanent user! Please login with your MR Number";
                                            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

                                            //System.Threading.Thread.Sleep(10000);

                                            if (user.UserID != -1)
                                            {
                                                secure.SignOut();
                                                // Response.Redirect("/", false);
                                            }
                                        }
                                    }
                                    else
                                    {
                                        Clear();
                                        lblMsg.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0000");
                                        lblMsg.Text = "UserName allready exist!";
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
                        else if (Session["ConsultationAppointment"] != null)
                        {
                            if (txnStatus == "CANCELED")
                            {
                                Session["ConsultationAppointment"] = null;
                                Response.Redirect("/");

                            }
                            objBusinessLogic.SavePaymentBookAppointment(sessionData);
                            AppointmentSendEmail(Convert.ToString(sessionData.PhoneNo), Convert.ToString(sessionData.MobileNo), Convert.ToString(sessionData.Location), Convert.ToString(sessionData.Address), Convert.ToString(sessionData.TimeDate), Convert.ToString(lblAmount.Text), Convert.ToString(sessionData.Description), "ConsultationAppointment");
                            AppointmentSendEmail(Convert.ToString(sessionData.PhoneNo), Convert.ToString(sessionData.MobileNo), Convert.ToString(sessionData.Location), Convert.ToString(sessionData.Address), Convert.ToString(sessionData.TimeDate), Convert.ToString(lblAmount.Text), Convert.ToString(sessionData.Description), "ConsultationAppointment_user");
                            Session["ConsultationAppointment"] = null;
                        }
                        else if (Session["AppointmentDetail"] != null)
                        {
                            if (txnStatus == "CANCELED")
                            {
                                Session["AppointmentDetail"] = null;
                                Response.Redirect("/");

                            }
                            objBusinessLogic.SavePaymentBookAppointment(sessionData);
                            AppointmentSendEmail(Convert.ToString(sessionData.PhoneNo), Convert.ToString(sessionData.MobileNo), Convert.ToString(sessionData.Location), Convert.ToString(sessionData.Address), Convert.ToString(sessionData.TimeDate), Convert.ToString(lblAmount.Text), Convert.ToString(sessionData.Description), "ConsultationAppointment");
                        }

                        //var detaisl = objDeposit.SaveDeposit(lblTxtnId.Text, lblMNo.Text, Convert.ToString(Session["Amount"]), Convert.ToString(DateTime.Now.ToString("dd/MM/yyyy")), sessionData.FacilityName);

                        //if (!string.IsNullOrEmpty(detaisl.MRNO))
                        //{
                        //    sessionData.JeevaStatus = detaisl.MRNO;
                        //}
                        Session["AppointmentDetail"] = null;
                    }
                    else
                    {
                        plcDivSucces.Visible = false;
                        plcDivError.Visible = true;
                        spnStatus.Attributes["Class"] = "highlight";
                        spnStatus.InnerText = "Payment Fail !";
                    }
                    Session["Amount"] = null;

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
            throw ex;
        }

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

            //lsUserName = FName.Substring(0, 1).ToLower() + LName.ToLower() + Telephone.Substring(Telephone.Length - 3, 3);

            //Password = EncryptPassword(Password);

            string lsOtp = Guid.NewGuid().ToString().ToUpper().Split('-')[0];

            Membership.CreateUser(lsUserName, Password);

            DataSet ds = objBusinessLogic.SaveUserDetails(MRNO, lsUserName, FName, LName, Email, FName, Password, Telephone, Gender, Address, Age, lsOtp);

            return ds;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void PermanentUserSendEmail(string Username, string Email, string MRNO, string Password, string MobileNo, string TemplateName)
    {
        List<EmailParaMeters> lstParameters = new List<EmailParaMeters>();
        List<SmsParaMeters> lstsmsParameters = new List<SmsParaMeters>();


        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Username", ShortCodeValue = user.DisplayName });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Email", ShortCodeValue = user.Email });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "MRNO", ShortCodeValue = MRNO });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Password", ShortCodeValue = Password });

        DataSet ds = new DataSet();
        ds = null;
        ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(AppGlobal.EmailFormPermanentRegistration);

        string EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
        string EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);

        lsEmailStatus = objMailer.SendEmail("PermanentRegistration", lstParameters, EmailToId, EmailCCId);
        lsEmailStatus = objMailer.SendEmail("PermanentRegistration_user", lstParameters, user.Email, EmailCCId);
        if (TemplateName == "PermanentRegistration_user")
        {
            lsSmsStatus = objMailer.SendSms(TemplateName, lstsmsParameters, MobileNo);
        }
        //CommonFn.SendSMS(MobileNo, "You are now the permenant user! Please login with Id(MR Number)= " + MRNO + "  and Password=" + Password);
        lstParameters = null;
    }

    public void ServiceBookingSendEmail(string Username, string Email, string ServiceName, string ServicePackage, string BookingDateTime, string DepositAmount, string TemplateName, int FormEmailTypeId)
    {
        List<EmailParaMeters> lstParameters = new List<EmailParaMeters>();
        List<SmsParaMeters> lstsmsParameters = new List<SmsParaMeters>();

        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Username", ShortCodeValue = user.DisplayName });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Email", ShortCodeValue = user.Email });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "ServiceName", ShortCodeValue = ServiceName });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "ServicePackage", ShortCodeValue = ServicePackage });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "BookingDateTime", ShortCodeValue = BookingDateTime });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "DepositAmount", ShortCodeValue = DepositAmount });


        DataSet ds = new DataSet();
        ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(FormEmailTypeId);

        string EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
        string EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);

        lsEmailStatus = objMailer.SendEmail(TemplateName, lstParameters, EmailToId, EmailCCId);


        string PhoneNumber = user.Profile.GetPropertyValue("PhoneNumber");
        // string val=lstParameters[5].ShortCodeValue.Replace("&nbsp;"," ");
        lstsmsParameters.Add(new SmsParaMeters { ShortCodeName = "ServiceName", ShortCodeValue = ServiceName });
        lstsmsParameters.Add(new SmsParaMeters { ShortCodeName = "DepositAmount", ShortCodeValue = DepositAmount });
        if (TemplateName == "BedBookingPayment_user" || TemplateName == "SurgeryBookingPayment_user" || TemplateName == "HealthCheckPayment_user")
        {
            lsSmsStatus = objMailer.SendSms(TemplateName, lstsmsParameters, PhoneNumber);
        }
        // CommonFn.SendSMS(PhoneNumber, " Your payment Rs." + val + " was completed Successfully for '" + ServiceName + "'!");

        lstParameters = null;
    }

    public void OutStandingSendEmail(string ServiceName, string DepositAmount, string TemplateName)
    {
        List<EmailParaMeters> lstParameters = new List<EmailParaMeters>();
        List<SmsParaMeters> lstsmsParameters = new List<SmsParaMeters>();

        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Username", ShortCodeValue = user.DisplayName });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Email", ShortCodeValue = user.Email });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "ServiceName", ShortCodeValue = ServiceName });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "DepositAmount", ShortCodeValue = DepositAmount });


        DataSet ds = new DataSet();
        //ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(AppGlobal.EmailFormFixAnappointment);
        ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(AppGlobal.AllPaymentGatewayEmail);

        string EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
        string EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);

        lsEmailStatus = objMailer.SendEmail("OutstandingPayment", lstParameters, EmailToId, EmailCCId);
        lsEmailStatus = objMailer.SendEmail("OutstandingPayment_user", lstParameters, user.Email, EmailCCId);

        string val = lstParameters[3].ShortCodeValue.Replace("&nbsp;", " ");

        string PhoneNumber = user.Profile.GetPropertyValue("PhoneNumber");
        lstsmsParameters.Add(new SmsParaMeters { ShortCodeName = "DepositAmount", ShortCodeValue = DepositAmount });
        if (TemplateName == "OutstandingPayment_user")
        {
            lsSmsStatus = objMailer.SendSms(TemplateName, lstsmsParameters, PhoneNumber);
        }
        // CommonFn.SendSMS(PhoneNumber, "Your payment Rs." + val + " was completed Successfully !");

        lstParameters = null;
    }

    public void AppointmentSendEmail(string PhoneNo, string MobileNo, string Location, string Address, string TimeDate, string lblAmount, string Description, string TemplateName)
    {
        List<EmailParaMeters> lstParameters = new List<EmailParaMeters>();
        List<SmsParaMeters> lstsmsParameters = new List<SmsParaMeters>();


        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Username", ShortCodeValue = user.DisplayName });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Email", ShortCodeValue = user.Email });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "PhoneNo", ShortCodeValue = PhoneNo });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "MobileNo", ShortCodeValue = MobileNo });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Location", ShortCodeValue = Location });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Address", ShortCodeValue = Address });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "TimeDate", ShortCodeValue = TimeDate });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "AppointmentTypeCharge", ShortCodeValue = lblAmount });
        lstParameters.Add(new EmailParaMeters { ShortCodeName = "Description", ShortCodeValue = Description });


        DataSet ds = new DataSet();
        ds = (DataSet)objBusinessLogic.GetFormsEmailDetail(AppGlobal.EmailFormFixAnappointment);

        string EmailToId = Convert.ToString(ds.Tables[0].Rows[0]["EmailToId"]);
        string EmailCCId = Convert.ToString(ds.Tables[0].Rows[0]["EmailCCId"]);

        lsEmailStatus = objMailer.SendEmail(TemplateName, lstParameters, EmailToId, EmailCCId);
        string val = lstParameters[7].ShortCodeValue.Replace("&nbsp;", " ");
        string PhoneNumber = user.Profile.GetPropertyValue("PhoneNumber");
        lstsmsParameters.Add(new SmsParaMeters { ShortCodeName = "AppointmentTypeCharge", ShortCodeValue = lblAmount });
        if (TemplateName == "ConsultationAppointment_user")
        {
            lsSmsStatus = objMailer.SendSms(TemplateName, lstsmsParameters, PhoneNumber);
        }
        // CommonFn.SendSMS(PhoneNumber, "Your payment Rs." + val + " was completed Successfully !");

        lstParameters = null;
    }


}