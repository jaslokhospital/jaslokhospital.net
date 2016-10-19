<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MobileHeader.ascx.cs"
    Inherits="JSControls_Home_MobileHeader" ClientIDMode="Static" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/JSControls/Common/StickyFindDoctor.ascx" TagPrefix="JS" TagName="StickyFindDoctor" %>
<!--//// FEATURED ARTICLES /////-->
<style type="text/css">
    .modal-footer p {
        margin-bottom: 2px !important;
    }

    .close {
        position: absolute;
        right: 5px;
        top: 0px;
        color: #fff !important;
        font-size: 40px;
        opacity: 1 !important;
    }

    .errorText {
        color: #fff !important;
        font-size: 13px !important;
        display: block;
        text-align: center;
        background-color: red;
        margin-top: 10px;
        padding: 8px;
    }

    .successText {
        color: #fff !important;
        font-size: 13px !important;
        display: block;
        text-align: center;
        background-color: darkgreen;
        margin-top: 10px;
        padding: 8px;
    }

    #SelectPayment option {
        font-size: 14px;
        font-weight: bold;
    }

    #SelectPayment optgroup option {
        font-size: 12px;
        font-weight: normal;
    }
</style>
<script type="text/javascript">
    function redirect() {
        location.href = '/Payment.aspxamount=100';
    }

</script>
<div class="container-fluid quick-connect-hover">
    <div class="container">
        <div class="row">
            <div class="col-md-3  col-sm-6 conect-icon">
                <div class="container-border">
                    <div class="icon-image">
                        <img src="/images/quick-connect-icon2.jpg" alt="quick-connect-icon" />
                    </div>
                    <div class="icon-content">
                        <span class="email-line">EMAIL ID </span><span class="content-line"><a href="mailto:online@jaslokhospital.net"
                            style="color: #ffffff;">online@jaslokhospital.net</a></span>
                    </div>
                </div>
            </div>
            <div class="col-md-3  col-sm-6 conect-icon">
                <div class="container-border">
                    <div class="icon-image">
                        <img src="/images/quick-connect-icon3.jpg" alt="quick-connect-icon" />
                    </div>
                    <div class="icon-content">
                        <span class="email-line">AMBULANCE NUMBER</span>  <a href="tel:02266573010"> <span class="content-line">022 6657
                            3010</span></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3  col-sm-6 conect-icon">
                <div class="container-border">
                    <div class="icon-image">
                        <img src="/images/quick-connect-icon1.jpg" alt="quick-connect-icon" />
                    </div>
                    <div class="icon-content">
                        <span class="email-line">EMERGENCY NUMBER</span>  <a href="tel:02223542354"> <span class="content-line">022-2354 2354</span></a>
                    </div>
                </div>
            </div>
            <div class="col-md-2 col-sm-6 conect-icon">
                <div class="container-border">
                    <a href="/feedback">
                        <div class="icon-image">
                            <img src="/images/blood-bank-icon.png" alt="quick-connect-icon" />
                        </div>
                        <div class="icon-content">
                            <span class="email-line">BLOOD BANK (24x7)</span> <a href="tel:+9102266573434"> <span class="content-line">+91-022-66573434</span></a>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-1 col-sm-6 conect-icon">
                <div class="container-border right_border">
                    <a href="/feedback">
                        <div class="icon-image">
                            <img src="/images/quick-connect-icon2.jpg" alt="quick-connect-icon" />
                        </div>
                        <div class="icon-content">
                            <span class="email-line feedback-last">FEEDBACK</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid header">
    <div class="container">
        <div class="row mobileheadsection">
            <asp:HiddenField ID="hdnUserId" runat="server" />
            <asp:HiddenField ID="hdnRedirectUrl" runat="server" />
            <div class="col-lg-12 col-md-6 col-sm-12 col-xs-12 headeronly quickheader">

                <div class="header_top">
                    <ul class="list cl-effect-2 listMobile">
                        <li id="liLogin" visible="false" runat="server">
                            <a href="#" id="myBtn">
                                <img src="/images/lock2.png" alt="Login" class="login_icon">Login</a> </li>
                        <li id="liLogout" runat="server">
                            <a id="anchlogout" runat="server" href="/" causesvalidation="false" onserverclick="SignIn">
                                <img src="/images/lock2.png" alt="Login" class="login_icon">Logout</a>
                        </li>
                        <li>
                            <literal class="btn btn_number">
                                <img src="/images/car.png" class="" /><span><a href="tel:02223542354">022-2354 2354</a></span></literal>
                        </li>
                        <li>
                            <span class="quick_connect hideonmobile"><a href="#" id="quick_connect01" style="vertical-align: middle;">Quick Connect <i class="glyphicon glyphicon-chevron-up"></i></a></span>
                        </li>
                    </ul>


                </div>
                <div class="clearfix">
                </div>
            </div>
        </div>
    </div>
    <div class="line">
    </div>


    <!-- /////// MOBILE HEADER /////// -->
    <div class="mobile-header mobile-only">
        <div class="wrapper">
            <div class="pad clearfix">
                <div class="main-logo">
                    <a href="/">
                        <img src="/images/logo3.png" class="hlogo"></a>
                </div>
                <div class="mobile-toggle down"></div>
                <div class="mobile-menu">

                    <ul class="main-nav">
                        <li>
                            <a class="SubMenu">CORPORATE PROFILE</a>
                            <div class="sub-nav">
                                <div><a class="back-btn">Back To Main</a></div>
                                <div><a href="/corporate-profile">Corporate Profile</a></div>
                                <div><a href="/corporate-profile/from-the-chairmans-desk">From The Chairman's Desk</a></div>
                                <div><a href="/corporate-profile/vision-and-mission">Vision And Mission</a></div>
                                <div><a href="/corporate-profile/trustees">Trustees</a></div>
                                <div><a href="/corporate-profile/management-team">Management</a></div>
                                <div><a href="/corporate-profile/hospital-facilities">Hospital Facilities</a></div>
                                <div><a href="/corporate-profile/certifications">Certifications</a></div>
                                <div><a href="/corporate-profile/jaslok-news">Jaslok in News</a></div>
                                <div><a href="/corporate-profile/scope-of-services">Scope Of Services</a></div>
                                <div><a href="/corporate-profile/frequently-asked-questions">Frequently Asked Questions</a></div>
                                <div><a href="/corporate-profile/quality-corner">Quality Corner</a></div>
                            </div>
                        </li>
                        <li>
                            <a class="SubMenu">SPECIALTIES</a>
                            <div class="sub-nav">
                                <div><a class="back-btn">Back To Main</a></div>
                                <div><a href="/specialties">Specialties</a></div>
                                <div><a href="/specialties/speciality-clinic">Speciality Clinic</a></div>
                                <div><a href="/health-check-up">Health Check up</a></div>
                                <div><a href="/specialitywise-opd">OPD Scheduler</a></div>
                                <div><a href="/doctorwise-opd">Our Specialists</a></div>
                            </div>
                        </li>
                        <li>
                            <a class="SubMenu">PATIENTS CARE & VISITORS</a>
                            <div class="sub-nav">
                                <div><a class="back-btn">Back To Main</a></div>
                                <div><a href="/patients/patient-facilities">Patient Facilities</a></div>
                                <div><a href="https://jaslokwebserver.jaslokhospital.net/jaslok_bill/User_Login.aspx">View Billing Details</a></div>
                                <div><a href="https://jaslokwebserver.jaslokhospital.net/jaslokwebreports/default.aspx">View Lab Reports</a></div>
                                <div><a href="/patients/feedback">Feedback Form</a></div>
                                <div><a href="/patients/complaint">Complaint Form</a></div>
                                <div><a href="/patients/quick-enquiry">Quick Inquiry</a></div>
                                <div><a href="/patients/estimate-request">Estimate request</a></div>
                            </div>

                        </li>
                        <li>
                            <a class="SubMenu">INTERNATIONAL PATIENTS</a>
                            <div class="sub-nav">
                                <div><a class="back-btn">Back To Main</a></div>
                                <div><a href="/international-patients">Hospital Facilities for International patients</a></div>
                                <div><a href="/international-patients/doctors-availability">Doctors Availability</a></div>
                                <div><a href="/international-patients/virtual-tour">Virtual Tour</a></div>
                                <div><a href="/international-patients/feedback">Feedback</a></div>
                                <div><a href="/international-patients/testimonial">Testimonials</a></div>
                                <div><a href="/international-patients/estimate-request">Estimate request</a></div>
                            </div>

                        </li>
                        <li>
                            <a class="SubMenu">EDUCATION & RESEARCH</a>
                            <div class="sub-nav">
                                <div><a class="back-btn">Back To Main</a></div>
                                <div><a href="/education-and-research/dnb-program">DNB Program</a></div>
                                <div><a href="/education-and-research/fellowship">Fellowship</a></div>
                                <div><a href="/education-and-research/internship">Internship</a></div>
                                <div><a href="/education-and-research/advance-courses">Advance Courses</a></div>
                                <div><a href="/education-and-research/nursing-program">Nursing Program</a></div>
                                <div><a href="/education-and-research/health-tips">Health Tips</a></div>
                                <div><a href="/education-and-research/research-paper">Research Paper</a></div>
                            </div>
                        </li>
                        <li class="online-facilities">
                            <a class="SubMenu">ONLINE FACILITIES</a>
                            <div class="sub-nav">
                                <div><a class="back-btn">Back To Main</a></div>
                                <div><a data-value="PatientRegistration" href="javascript:void(0)">Patient Registration</a></div>
                                <div>
                                    <a class="SubMenu">In-Patient</a>
                                    <div class="sub-nav2">
                                        <div><a class="back-btn">Back To Main</a></div>
                                        <div><a data-value="bed-booking" href="javascript:void(0)">Bed Reservation</a></div>
                                        <div><a target="_blank" href="https://jaslokwebserver.jaslokhospital.net/jaslokwebreports/default.aspx">View Lab Reports</a></div>
                                        <div><a target="_blank" href="https://jaslokwebserver.jaslokhospital.net/jaslok_bill/User_Login.aspx"> View Billing Details</a></div>
                                    </div>
                                </div>
                                <div>
                                    <a class="SubMenu">Out-Patient</a>
                                    <div class="sub-nav2">
                                        <div><a class="back-btn">Back To Main</a></div>
                                        <div><a data-value="health-check-up-comprehensive" href="javascript:void(0)">Health Check-up</a></div>
                                        <div data-value="diagnosticsappointment"><a>Diagnostics Appointment</a></div>
                                        <div><a target="_blank" href="https://jaslokwebserver.jaslokhospital.net/jaslokwebreports/default.aspx">View Lab Reports</a></div>
                                        <div><a target="_blank" href="https://jaslokwebserver.jaslokhospital.net/jaslok_bill/User_Login.aspx"> View Billing Details</a></div>
                                    </div>
                                </div>
                                <div>
                                    <a class="SubMenu">Consultation Appointment</a>
                                    <div class="sub-nav2">
                                        <div><a class="back-btn">Back To Main</a></div>
                                        <div><a data-value="consultationappointment/new" href="javascript:void(0)">New Appointment</a></div>
                                        <div><a data-value="consultationappointment/follow-up" href="javascript:void(0)">Follow-up Appointment</a></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="online-payment">
                            <a class="SubMenu">ONLINE PAYMENT</a>
                            <div class="sub-nav">
                                <div><a class="back-btn">Back To Main</a></div>
                                <div>
                                    <a class="SubMenu">Deposit Payments</a>
                                    <div class="sub-nav2">
                                        <div><a class="back-btn">Back To Main</a></div>
                                        <div><a data-value="surgery-booking" href="javascript:void(0)">Surgery Deposit Payment</a></div>
                                        <div><a data-value="outstandingbillpayment" href="javascript:void(0)">Outstanding Bill Payment</a></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!--========================== /HEADER =============================-->
</div>
<%--<JS:StickyFindDoctor runat="server" ID="StickyFindDoctor" />--%>
<div class="modal fade" id="permenantRegistrationModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="padding: 5px 50px;">
                <button type="button" class="close" data-dismiss="modal">
                    &times;</button>
                <h4>Permanent Registration</h4>
            </div>
            <div class="modal-body mymodal" style="padding: 40px 50px;">
                <p>
                    You have not yet permanently registerd with Jaslok hospital, please go for the permanent
                    registration to get premium benifits.
                </p>
               <p> Click on Submit Button for permanent registration<a href="/payment.aspx?reg=pr" class="ble-btn"
                    target="_blank">Submit</a></p>
                <%-- <asp:Button ID="btnSubmit" runat="server" CssClass="ble-btn"  Text="submit" OnClick="btnSubmit_Click" />--%>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <telerik:RadAjaxPanel ID="RadSearchPanel" LoadingPanelID="RadAjaxLoadingPanel1" runat="server"
            RestoreOriginalRenderDelegate="false">
            <asp:HiddenField ID="hdnStatus" runat="server" Value="login" />
            <div id="divLogin" class="modal-content">
                <div class="modal-header" style="padding: 5px 50px;">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4>
                        <asp:Label ID="litPopUpTitle" runat="server" Text="Login"></asp:Label></h4>
                </div>
                <div class="modal-body" style="padding: 30px 40px;">
                    <div role="form">
                        <div id="divLoginForm" runat="server">
                            <div class="form-group">
                                <label for="usrname">
                                    Visitor ID/MRNumber</label>
                                <asp:TextBox ID="txtLoginUsername" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" Font-Size="11px"
                                    runat="server" Display="Dynamic" ErrorMessage="Enter Visitor ID" ControlToValidate="txtLoginUsername"
                                    ValidationGroup="loginVal"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="psw">
                                    Password</label>
                                <asp:TextBox ID="txtLoginPassword" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" Font-Size="11px"
                                    runat="server" Display="Dynamic" ErrorMessage="Enter Password" ControlToValidate="txtLoginPassword"
                                    ValidationGroup="loginVal"></asp:RequiredFieldValidator>
                            </div>
                            <div id="divCheckbox" runat="server" visible="false" class="checkbox">
                                <label>
                                    <input type="checkbox" value="" checked>
                                    Remember me</label>
                            </div>
                            <asp:Button CssClass="btn btn-success btn-block" ID="LoginBtn" ValidationGroup="loginVal"
                                OnClick="LoginBtn_Click" runat="server" Text="Login" />
                            <asp:Label ID="lblLoginError" ForeColor="Red" Font-Size="13px" runat="server"></asp:Label>
                        </div>
                        <div id="divForgotPassword" style="display: none;" runat="server">
                            <div class="form-group">
                                <label for="usrname">
                                    Visitor ID</label>
                                <asp:TextBox ID="txtForgotPasswordUserName" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" Font-Size="11px"
                                    runat="server" Display="Dynamic" ErrorMessage="Enter Visitor ID" ControlToValidate="txtForgotPasswordUserName"
                                    ValidationGroup="forgotpassVal"></asp:RequiredFieldValidator>
                            </div>
                            <asp:Button CssClass="btn btn-success btn-block" ID="btnForgotPasword" ValidationGroup="forgotpassVal"
                                OnClick="btnForgotPasword_Click" runat="server" Text="Submit" />
                            <asp:Label ID="lblForgotPassError" ForeColor="Red" Font-Size="13px" runat="server"></asp:Label>
                        </div>
                        <div id="divOTPVerification" runat="server" style="display: none;">
                            <div class="row">
                                <div class="col-md-3 col-xs-5">
                                    <div class="form-group">
                                        <label for="psw">
                                            Mobile No</label>
                                        <asp:DropDownList ID="ddlOTPCountryCode" DataSourceID="xmlDatasource1" DataTextField="text"
                                            DataValueField="value" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-10 col-xs-7">
                                    <div class="form-group">
                                        <label style="padding-bottom: 17px;">
                                        </label>
                                        <asp:TextBox ID="txtOTPPhoneNumber" onkeypress="return Numeric(event);" MaxLength="10"
                                            runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvOtpPhoneNumber" Enabled="false" ForeColor="Red"
                                            Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Phone Number"
                                            ControlToValidate="txtOTPPhoneNumber" ValidationGroup="otpval"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rgvOTPPhoneNumber" Font-Size="11px" MinimumValue="1000000000"
                                            Type="Double" MaximumValue="9999999999" Display="Dynamic" ControlToValidate="txtOTPPhoneNumber"
                                            runat="server" ForeColor="Red" ValidationGroup="otpval" ErrorMessage="Please Enter valid Mobile Number"></asp:RangeValidator>
                                    </div>
                                </div>
                            </div>
                            <div id="divOtp" class="form-group">
                                <label for="psw">
                                    OTP</label>
                                <asp:TextBox ID="txtOTP" Style="text-transform: uppercase;" runat="server" class="form-control"></asp:TextBox>
                                <asp:LinkButton ID="lnkResendOTP" runat="server" Text="Resend OTP" OnClick="lnkResendOTP_Click"></asp:LinkButton>
                            </div>
                            <asp:Button CssClass="btn btn-success btn-block" ID="btnOTPVerification" ValidationGroup="otpval"
                                OnClick="btnOTPVerification_Click" runat="server" Text="Submit" />
                            <asp:Label ID="lblOTPError" ForeColor="Red" Font-Size="13px" runat="server"></asp:Label>
                        </div>
                        <div id="divSignUp" runat="server" style="display: none;">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="firstname">
                                            First Name</label>
                                        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqFirstname" ForeColor="Red" Font-Size="11px" runat="server"
                                            Display="Dynamic" ErrorMessage="Enter First Name" ControlToValidate="txtFirstName"
                                            ValidationGroup="valSignup"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rexFirstName" runat="server" ValidationExpression="[a-zA-Z]*$"
                                            Display="Dynamic" ForeColor="Red" ErrorMessage="Only characters are allowed in first name"
                                            ControlToValidate="txtFirstName" ValidationGroup="valSignup" Font-Size="11px"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="firstname">
                                            Last Name</label>
                                        <asp:TextBox ID="txtLastName" MaxLength="50" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqLastname" ForeColor="Red" Font-Size="11px" runat="server"
                                            Display="Dynamic" ErrorMessage="Enter Last Name" ControlToValidate="txtLastName"
                                            ValidationGroup="valSignup"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rexLastName" runat="server" ValidationExpression="[a-zA-Z]*$"
                                            Display="Dynamic" ForeColor="Red" ErrorMessage="Only characters are allowed in last name"
                                            ControlToValidate="txtLastName" ValidationGroup="valSignup" Font-Size="11px"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="gender">
                                            Gender</label>
                                        <asp:DropDownList ID="ddlGender" class="form-control" runat="server">
                                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="Age">
                                            Age</label>
                                        <asp:TextBox ID="txtAge" onkeypress="return Numeric(event);" runat="server" MaxLength="3"
                                            class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAge" ForeColor="Red" Font-Size="11px" runat="server"
                                            Display="Dynamic" ErrorMessage="Enter Age" ControlToValidate="txtAge" ValidationGroup="valSignup"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-3 col-xs-4 mob1">
                                    <div class="form-group">
                                        <label for="gender">
                                            Mobile No</label>
                                        <asp:DropDownList ID="ddlCountryCode" DataSourceID="xmlDatasource1" DataTextField="text"
                                            DataValueField="value" class="form-control" runat="server">
                                        </asp:DropDownList>
                                        <asp:XmlDataSource ID="xmlDatasource1" runat="server" DataFile="~/CountryCodes.xml"
                                            XPath="CountryCodes/code"></asp:XmlDataSource>
                                    </div>
                                </div>
                                <div class="col-md-3 col-xs-8 mob2" style="padding-left: 3px;">
                                    <div class="form-group">
                                        <label style="color: #fff;" for="PhoneNumber">
                                            a</label>
                                        <asp:TextBox ID="txtMobileNumber" onkeypress="return Numeric(event);" runat="server"
                                            MaxLength="10" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvMobileNumber" ForeColor="Red" Font-Size="11px"
                                            runat="server" Display="Dynamic" ErrorMessage="Enter Mobile Number" ControlToValidate="txtMobileNumber"
                                            ValidationGroup="valSignup"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rgvMob" Font-Size="11px" MinimumValue="1000000000" Type="Double"
                                            MaximumValue="9999999999" Display="Dynamic" ControlToValidate="txtMobileNumber"
                                            runat="server" ForeColor="Red" ValidationGroup="valSignup" ErrorMessage="Please Enter valid Mobile Number"></asp:RangeValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="psw">
                                    Email Address</label>
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqEmailAddress" ForeColor="Red" Font-Size="11px"
                                    runat="server" Display="Dynamic" ErrorMessage="Enter Emailaddress" ControlToValidate="txtEmail"
                                    ValidationGroup="valSignup"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regEmailAddress" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Font-Size="11px" runat="server" Display="Dynamic" ValidationGroup="valSignup"
                                    ErrorMessage="Enter Valid Email address" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="Address">
                                    Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" class="form-control midiafor"></asp:TextBox>
                            </div>
                            <asp:Button CssClass="btn btn-success btn-block" ID="btnSignUp" ValidationGroup="valSignup"
                                OnClick="btnSignUp_Click" runat="server" Text="Register" />
                            <asp:Label ID="lblSignUp" ForeColor="Red" Font-Size="13px" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <p id="pSignUp" runat="server">
                        Not a member?
                        <asp:LinkButton ID="lnkSignUp" runat="server" OnClick="lnkSignUp_Click" Text="Pre-Register"></asp:LinkButton>
                    </p>
                    <p id="pSignIn" runat="server" style="display: none;">
                        Already User?
                        <asp:LinkButton ID="lnkBtnSignIn" runat="server" Text="Sign In" OnClick="lnkBtnSignIn_Click"></asp:LinkButton>
                    </p>
                    <p id="pForgotPassWord" runat="server">
                        Forgot
                        <asp:LinkButton ID="lnkForgotPassword" runat="server" OnClick="lnkForgotPassword_Click"
                            Text="Password?"></asp:LinkButton>
                    </p>
                    <p id="pVerifyUser" runat="server">
                        Aleady Registered?
                        <asp:LinkButton ID="lnkVerifyUser" runat="server" OnClick="lnkVerifyUser_Click" Text="Please Verify"></asp:LinkButton>
                    </p>
                </div>
            </div>
        </telerik:RadAjaxPanel>
    </div>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30">
        <div class="modal-dialog" style="vertical-align: middle; text-align: center; background-color: white; height: 440px; margin-top: 0px !important;">
            <img alt="Loading..." src='/images/loading.gif' style="padding-top: 30% !important;" />
        </div>
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" RestoreOriginalRenderDelegate="false">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadSearchPanel">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadSearchPanel" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
</div>
<asp:HiddenField ID="hdnMrNumberexist" runat="server" />
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

    <script>
        ///////// mobile-nav
        $('.mobile-header .mobile-menu ul li>a').click(function (e) {
            if ($(this).parent().find('.sub-nav').length) {

                $('.sub-nav').hide();
                $(this).parent().find('.sub-nav').show();
                $(this).parent().parent().animate({
                    right: '100%'
                });
            }
            // alert($(this).parent().find('.sub-nav').length);
        });


        $('.mobile-header .mobile-menu ul li .sub-nav div>a').click(function (e) {
            if ($(this).parent().find('.sub-nav2').length) {
                $('.sub-nav2').hide();
                $(this).parent().find('.sub-nav2').show();
                $(this).parent().parent().parent().parent().animate({
                    right: '200%'
                });
            }
        });

        $('.mobile-header .mobile-menu ul li .sub-nav2 div>a').click(function (e) {
            if ($(this).parent().find('.sub-nav3').length) {
                $('.sub-nav3').hide();
                $(this).parent().find('.sub-nav3').show();
                $(this).parent().parent().parent().parent().parent().parent().animate({
                    right: '300%'
                });
            }
        });

        $('a.back-btn').click(function (e) {
            if ($(this).parent().parent().hasClass("sub-nav2")) {
                //alert("sub-nav2 back");
                $(this).parent().parent().parent().parent().parent().parent().animate({
                    right: '100%'
                }, function () {
                    $('.sub-nav2').hide();
                });
            }
            else if ($(this).parent().parent().hasClass("sub-nav3")) {
                //alert("sub-nav2 back");
                $(this).parent().parent().parent().parent().parent().parent().parent().parent().animate({
                    right: '200%'
                }, function () {
                    $('.sub-nav3').hide();
                });
            }
            else {
                $(this).parent().parent().parent().parent().animate({
                    right: '0%'
                }, function () {
                    $('.sub-nav').hide();
                });
            }
        });
        //////// MOBILE MENU

        $(".mobile-toggle").click(function () {

            $(this).next(".mobile-menu").toggle();
            $(".mobile-toggle").toggleClass("down");

        });

    </script>
</telerik:RadCodeBlock>
