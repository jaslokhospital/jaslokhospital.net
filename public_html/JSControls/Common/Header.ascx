<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="JSControls_Home_Header" ClientIDMode="Static" %>
<script type="text/javascript">
    function redirect() {
        location.href = '/Payment.aspxamount=100';
    }
</script>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/JSControls/Common/StickyFindDoctor.ascx" TagPrefix="JS" TagName="StickyFindDoctor" %>

<div class="container-fluid quick-connect-hover">
    <div class="container">
        <div class="row">
            <div class="col-md-3  col-sm-6 conect-icon">
                <div class="container-border">
                    <div class="icon-image">
                        <img src="/images/quick-connect-icon2.jpg" alt="quick-connect-icon" />
                    </div>
                    <div class="icon-content">
                        <span class="email-line">EMAIL ID </span>
                        <span class="content-line"><a href="mailto:online@jaslokhospital.net" style="color: #ffffff;">online@jaslokhospital.net</a></span>
                    </div>
                </div>
            </div>
            <div class="col-md-3  col-sm-6 conect-icon">
                <div class="container-border">
                    <div class="icon-image">
                        <img src="/images/quick-connect-icon3.jpg" alt="quick-connect-icon" />
                    </div>
                    <div class="icon-content">
                        <span class="email-line">AMBULANCE NUMBER</span>
                        <span class="content-line">022 6657 3010</span>
                    </div>
                </div>
            </div>

            <div class="col-md-3  col-sm-6 conect-icon">
                <div class="container-border">
                    <div class="icon-image">
                        <img src="/images/quick-connect-icon1.jpg" alt="quick-connect-icon" />
                    </div>
                    <div class="icon-content">
                        <span class="email-line">EMERGENCY NUMBER</span>
                        <span class="content-line">022-2354 23540</span>
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
                            <span class="email-line">BLOOD BANK (24x7)</span>
                            <span class="content-line">+91-022- 66573434</span>

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
        <nav id="Nav1" class="navbar navbar-inverse mainnav container-menu" style="margin-bottom:0%;">
            <div class="container">
               <div class="row">
                   <div class="col-sm-12 col-md-12 col-lg-12 pading45"> 
                <div class="collapse navbar-collapse a" id="Div1">
                    <ul class="nav navbar-nav menu " style="padding-top:4px;">

                  

                        <li class="dropdown main-menu-bar online-facilities" role="presentation">
                              
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-size:100% ! important;" id="A2" role="button" aria-haspopup="true" aria-expanded="false">Online Facilities<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-second-menu" style="margin-top:10px;" >
                              
                                <li data-value="PatientRegistration"><a >Patient Registration</a></li>
                                <li data-value="#" style="font-weight:bold;padding-left:6px">In-Patient</li>
                                <li data-value="bed-booking"><a>Bed Reservation</a></li>
                                <li data-value="#"><a>Lab Reports</a></li>
                                <li data-value="outstandingbillpayment"><a> Outstanding Bill (Interim Demand Note)</a></li>
                                <li data-value="#" style="font-weight:bold;padding-left:6px">Out-Patient</li>
                                <li data-value="#" style="font-weight:bold;padding-left:6px">Consultation Appointment</li>
                             <%--   <li data-value="#"><a>Consultation Appointment</a></li>--%>
                                <li data-value="consultationappointment/new" style="margin-left: 23px;"><a>&nbsp;&nbsp;&nbsp; New Appointment</a></li>
                                <li data-value="consultationappointment/follow-up" style="margin-left: 23px;"><a>&nbsp;&nbsp;&nbsp; Follow-up Appointment</a></li>
                                <li data-value="diagnosticsappointment"><a>Diagnostics Appointment</a></li>
                                <li data-value="#"><a>Lab Reports</a></li>
                                <li data-value="health-check-up-comprehensive"><a>Health Check-up</a></li>

                            </ul>
                        </li>

                    </ul>

                    <ul class="nav navbar-nav menu " style="padding-top:4px;">

                        <li class="dropdown main-menu-bar online-facilities" role="presentation">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-size:100% ! important;" id="A1" role="button" aria-haspopup="true" aria-expanded="false">Online Payment<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-second-menu">
                                
                                <li data-value="#" style="font-weight:bold;padding-left:6px;">Deposit</li>
                                <li data-value="surgery-booking" style="font-weight:bold;padding-left:6px;">Surgery Deposit</li>
                                <li data-value="outstandingbillpayment" style="font-weight:bold;padding-left:6px;">Outstanding Bill</li>
                                <li data-value="#" style="font-weight:bold;padding-left:6px;">Doctor Consultation</li>
                                <li data-value="bed-booking" style="margin-left: 23px;"><a>Bed Reservation/Admission</a></li>
                                <li data-value="#" style="margin-left: 23px;"><a> View Lab Reports</a> </li>
                                
                                <li data-value="outstandingbillpayment" style="margin-left: 23px;"><a>View Outstanding Bill (Interim Demand Note)</a></li>
                                <li data-value="#"  style="font-weight:bold;padding-left:6px;"> Diagnostic Services </li>

                               
                              

                            </ul>
                        </li>

                    </ul>


                    <div class="pull-left" style="padding-left: 10px;">
                        <ul class="list cl-effect-2">
                            <li id="liLogin" visible="false" runat="server">
                                <a href="#" id="myBtn">
                                    <img src="/images/lock2.png" alt="Login" class="login_icon">Login</a> </li>
                            <li id="liLogout" runat="server">
                                <a id="anchlogout" runat="server" href="/" causesvalidation="false" onserverclick="SignIn">
                                    <img src="/images/lock2.png" alt="Login" class="login_icon">Logout</a>
                            </li>

                            <li runat="server" id="liAhome">
                                <a runat="server" id="anchorAhome">
                                    <asp:Label ID="lblAhome" runat="server" Visible="false"></asp:Label></a>
                            </li>
                        </ul>
                    </div>
                    <div class="pull-right header_top  pulls">
                        <span class="btn btn_number">
                            <img src="/images/car.png" alt="car" class="" />022-2354 2354</span>
                        <span class="quick_connect hideonmobile"><a href="#" id="quick_connect01" style="vertical-align: middle;">Quick Connect <i class="glyphicon glyphicon-chevron-up"></i></a></span>
                    </div>
                    <div class="clearfix"></div>
                </div>
                 </div> 
               </div><!-- row closed -->
                <!--/.nav-collapse -->
            </div>
        </nav>
    </div>


    <%-- <div class="container">
=======
          <%--  <div class="container">
>>>>>>> 9c48161bc79bc03a9b4969c24bd48dc072c35ae3
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 headeronly">
                <div class="pull-left header-top-select" id="divHeaderTopSelect" runat="server">
<<<<<<< HEAD
                    <asp:HiddenField ID="hdnUserId" runat="server" />
                    <asp:HiddenField ID="hdnRedirectUrl" runat="server" />
                 
                        <select name="" id="selectOption1" onchange="selectOption1Change(this)" class="form-control js_appoint_form js-select-list1">
                            <option value="">Online Facilities</option>
                            <option value="PatientRegistration" runat="server" id="drpPatient">Patient Registration</option>
                            <optgroup label="In-Patient">
                                <option value="bed-booking">Bed Reservation/Admission</option>
=======
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <asp:HiddenField ID="HiddenField2" runat="server" />
                  
                    <select name="" id="selectOption1" onchange="selectOption1Change(this)" class="form-control js_appoint_form js-select-list1">
                        <option value="">Online Facilities</option>
                        <option value="PatientRegistration" runat="server" id="drpPatient">Patient Registration</option>
                        <optgroup label="In-Patient">
                            <option value="bed-booking">Bed Reservation/Admission</option>
                            <option value="">View Lab Reports</option>
                            <option value="outstandingbillpayment">View Outstanding Bill (Interim Demand Note)</option>
                            <optgroup label="Out-Patient">
                                <option value="consultationappointment">Consultation Appointment</option>
                                <option value="consultationappointment/new" style="margin-left: 23px;">&nbsp;&nbsp;&nbsp;New Appointment</option>
                                <option value="consultationappointment/follow-up" style="margin-left: 23px;">&nbsp;&nbsp;&nbsp;Follow-up Appointment</option>
                                <option value="">Diagnostics Appointment</option>
>>>>>>> 9c48161bc79bc03a9b4969c24bd48dc072c35ae3
                                <option value="">View Lab Reports</option>
                                <option value="outstandingbillpayment">View Outstanding Bill (Interim Demand Note)</option>
                                <optgroup label="Out-Patient">
                                    <option value="consultationappointment">Consultation Appointment</option>
                                    <option value="consultationappointment/new" style="margin-left: 23px;">&nbsp;&nbsp;&nbsp;New Appointment</option>
                                    <option value="consultationappointment/follow-up" style="margin-left: 23px;">&nbsp;&nbsp;&nbsp;Follow-up Appointment</option>
                                    <option value="">Diagnostics Appointment</option>
                                    <option value="">View Lab Reports</option>
                                    <option value="health-check-up-comprehensive">Health Check-up</option>
                                </optgroup>
                            </optgroup>
                        </select>
                        <select name="" id="SelectPayment" onchange="selectOption1Change(this)" class="form-control js_appoint_form js-select-list2">
                            <option value="">Online Payment</option>
                            <option value="">Admission Deposit</option>
                            <option value="surgery-booking">Surgery Deposit</option>
                            <option value="outstandingbillpayment">Outstanding Bill</option>
                            <optgroup label="Doctor Consultation">
                                <option value="bed-booking" style="margin-left: 23px;">Bed Reservation/Admission</option>
                                <option value="" style="margin-left: 23px;">View Lab Reports</option>
                                <option value="outstandingbillpayment" style="margin-left: 23px;">View Outstanding Bill (Interim Demand Note)</option>
                            </optgroup>
                            <optgroup label="Diagnostic Services"></optgroup>
<<<<<<< HEAD
                        </select>
                   
                </div>
                <div class="pull-left">
                    <ul class="list cl-effect-2">
                        <li id="liLogin" visible="false" runat="server">
                            <a href="#" id="myBtn">
                                <img src="/images/lock2.png" alt="Login" class="login_icon">Login</a> </li>
                        <li id="liLogout" runat="server">
                            <a id="anchlogout" runat="server" href="/" causesvalidation="false" onserverclick="SignIn">
                                <img src="/images/lock2.png" alt="Login" class="login_icon">Logout</a>
                        </li>
                       
                        <li runat="server" id="liAhome">
                            <a runat="server" id="anchorAhome">
                                <asp:Label ID="lblAhome" runat="server" Visible="false"></asp:Label></a>
                        </li>
                    </ul>
                </div>
                <div class="pull-right header_top">
                    <button class="btn btn_number">
                        <img src="/images/car.png" class="" />022-2354 2354</button>
                    <span class="quick_connect hideonmobile"><a href="#" id="quick_connect01" style="vertical-align: middle;">Quick Connect <i class="glyphicon glyphicon-chevron-up"></i></a></span>
=======
                    </select>
                    
>>>>>>> 9c48161bc79bc03a9b4969c24bd48dc072c35ae3
                </div>
                 <div class="pull-left">
                        <ul class="list cl-effect-2">
                            <li id="liLogin" visible="false" runat="server">
                                <a href="#" id="myBtn">
                                    <img src="/images/lock2.png" alt="Login" class="login_icon">Login</a> </li>
                            <li id="liLogout" runat="server">
                                <a id="anchlogout" runat="server" href="/" causesvalidation="false" onserverclick="SignIn">
                                    <img src="/images/lock2.png" alt="Login" class="login_icon">Logout</a>
                            </li>
                            <li runat="server" id="liAhome">
                                <a runat="server" id="anchorAhome">
                                    <asp:Label ID="lblAhome" runat="server" Visible="false"></asp:Label></a>
                            </li>
                        </ul>
                    </div>
                    <div class="pull-right header_top  pulls">
                        <button class="btn btn_number">
                            <img src="/images/car.png" class="" />1800-22-1800</button>
                        <span class="quick_connect hideonmobile"><a href="#" id="quick_connect01" style="vertical-align: middle;">Quick Connect <i class="glyphicon glyphicon-chevron-up"></i></a></span>
                    </div>
</div>--%>

    <div class="line"></div>

    <nav id="header" class="navbar navbar-inverse mainnav container-menu">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a class="navbar-brand" href="/">
                    <img src="/images/logo3.png" alt="Juslok Hospital" class="img-responsive" /></a>
                <div class="serchi hidden-xs col-sm-8 col-xs-12">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder=" Site Search" name="q">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hdnUserId" runat="server" />
            <asp:HiddenField ID="hdnRedirectUrl" runat="server" />
            <div class="collapse navbar-collapse" id="navbar">
                <ul class="nav navbar-nav menu menu_fr">

                    <li class="dropdown main-menu-bar" role="presentation">
                        <a class="dropdown-toggle" id="idHome" href="/" role="button" aria-haspopup="true" aria-expanded="false">HOME
                        </a>
                    </li>

                    <li class="dropdown main-menu-bar" role="presentation">
                        <a class="dropdown-toggle" data-toggle="dropdown" id="licorporateProfile" href="/corporate-profile" role="button" aria-haspopup="true" aria-expanded="false">CORPORATE PROFILE<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-second-menu">
                            <li><a href="/corporate-profile/from-the-chairmans-desk">From The Chairman's Desk</a></li>
                            <li><a href="/corporate-profile/vision-and-mission">Vision And Mission</a></li>
                            <li><a href="/corporate-profile/trustees">Trustees</a></li>
                            <li><a href="/corporate-profile/management-team">Management</a></li>
                            <li><a href="/corporate-profile/hospital-facilities">Hospital Facilities</a></li>
                            <li><a href="/corporate-profile/certifications">Certifications</a></li>
                            <li><a href="/corporate-profile/jaslok-news">Jaslok in News</a></li>
                            <%--  <li><a href="/jasloktimes">Jaslok Times</a></li>--%>
                            <li><a href="/corporate-profile/scope-of-services">Scope Of Services</a></li>
                            <%--  <li><a href="/testimonial">Testimonial</a></li>--%>
                            <li><a href="/corporate-profile/frequently-asked-questions">Frequently Asked Questions</a></li>
                            <li><a href="/corporate-profile/quality-corner">Quality Corner</a></li>
                        </ul>
                    </li>
                    <li role="presentation" class="dropdown main-menu-bar">
                        <a class="dropdown-toggle" id="lispecialties" data-toggle="dropdown" href="javascript:void(0);" role="button" aria-haspopup="true" aria-expanded="false">SPECIALTIES <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-second-menu">
                            <li><a href="/specialties">Specialties</a></li>
                            <li><a href="/specialties/speciality-clinic">Speciality Clinic</a></li>
                            <li><a href="/health-check-up">Health Check up</a></li>
                            <li><a href="/specialitywise-opd">OPD Scheduler</a></li>
                            <li><a href="/doctorwise-opd">Our Specialists</a></li>
                        </ul>

                        <%-- <ul class="dropdown-menu dropdown-second-menu">
                                        <li><a href="/health-check-up">Health Check up</a></li>
                                        <li><a href="/specialties">Facilities & Services</a></li>
                                        <li><a href="/specialties">Doctors in attendance</a></li>
                                        <li><a href="/specialitywise-opd">Speciality OPD</a></li>
                                        <li><a href="/doctorwise-opd">Doctor OPD</a></li>
                                        <li><a href="/speciality-clinic-opd">Speciality Clinic OPD</a></li>
                                    </ul>--%>

                    </li>

                    <li role="presentation" class="dropdown main-menu-bar">
                        <a class="dropdown-toggle" id="lipatients" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">PATIENTS CARE & VISITORS <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-second-menu">
                            <li><a href="/patients/patient-facilities">Patient Facilities</a></li>
                            <li><a href="https://jaslokwebserver.jaslokhospital.net/jaslok_bill/User_Login.aspx">View Billing Details</a></li>
                            <li><a href="https://jaslokwebserver.jaslokhospital.net/jaslokwebreports/default.aspx">View Lab Reports</a></li>
                            <li><a href="/patients/feedback">Feedback Form</a></li>
                            <li><a href="/patients/complaint">Complaint Form</a></li>
                            <li><a href="/patients/quick-enquiry">Quick Inquiry</a></li>
                            <li><a href="/patients/estimate-request">Estimate request</a></li>
                        </ul>
                    </li>
                    <li role="presentation" class="dropdown main-menu-bar">
                        <a id="liinternational" class="dropdown-toggle" data-toggle="dropdown" href="/international-patients" role="button" aria-haspopup="true" aria-expanded="false">INTERNATIONAL PATIENTS <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-second-menu">
                            <li><a href="/international-patients">Hospital Facilities for International patients</a></li>
                            <%--<li><a href="/international-patients/hospital-facilities">Hospital Facilities</a></li>
                                        <li><a href="/international-patients/facilities-for-international-patients">Hospital Facilities for International patients</a></li>--%>
                            <li><a href="/international-patients/doctors-availability">Doctors Availability</a></li>
                            <li><a href="/international-patients/virtual-tour">Virtual Tour</a></li>
                            <li><a href="/international-patients/feedback">Feedback</a></li>
                            <li><a href="/international-patients/testimonial">Testimonials</a></li>
                            <li><a href="/international-patients/estimate-request">Estimate request</a></li>
                        </ul>
                    </li>

                    <li role="presentation" class="dropdown main-menu-bar">
                        <a id="lieducational" class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">EDUCATION & RESEARCH <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-second-menu">
                            <li><a href="/education-and-research/dnb-program">DNB Program</a></li>
                            <li><a href="/education-and-research/fellowship">Fellowship</a></li>
                            <li><a href="/education-and-research/internship">Internship</a></li>
                            <li><a href="/education-and-research/advance-courses">Advance Courses</a></li>
                            <li><a href="/education-and-research/nursing-program">Nursing Program</a></li>
                            <li><a href="/education-and-research/health-tips">Health Tips</a></li>
                            <li><a href="/education-and-research/research-paper">Research Paper</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>




    </nav>
</div>



<%--<JS:StickyFindDoctor runat="server" ID="StickyFindDoctor" />--%>
<div class="modal fade" id="permenantRegistrationModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="padding: 5px 50px;">
                <button id="Button1" type="button" class="close" onclick="sessionclear_Click" runat="server" data-dismiss="modal">&times;</button>
                <h4>Permanent Registration</h4>
            </div>
            <div class="modal-body mymodal" style="padding: 40px 50px;">
                <p>You have not yet permanently registerd with Jaslok hospital, please go for the permanent registration to get premium benifits.</p>
               <p> Click on Submit Button for permanent registration<a href="/payment.aspx?reg=pr" class="ble-btn" target="_blank">Submit</a></p> <%-- <asp:Button ID="btnSubmit" runat="server" CssClass="ble-btn"  Text="submit" OnClick="btnSubmit_Click" />--%>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" role="dialog">

    <div class="modal-dialog">
        <!-- Modal content-->
        <telerik:RadAjaxPanel ID="RadSearchPanel" LoadingPanelID="RadAjaxLoadingPanel2" runat="server" RestoreOriginalRenderDelegate="false">
            <asp:HiddenField ID="hdnStatus" runat="server" Value="login" />
            <div id="divLogin" class="modal-content">
                <div class="modal-header" style="padding: 5px 50px;">
                    <button id="Button2" type="button" class="close" onclick="sessionclear_Click" runat="server" data-dismiss="modal">&times;</button>
                    <h4>
                        <asp:Label ID="litPopUpTitle" runat="server" Text="Login"></asp:Label></h4>
                </div>
                <div class="modal-body" style="padding: 40px 50px;">
                    <div role="form">
                        <div id="divLoginForm" runat="server">
                            <div class="form-group">
                                <label>Visitor ID</label>
                                <asp:TextBox ID="txtLoginUsername" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Visitor ID" ControlToValidate="txtLoginUsername" ValidationGroup="loginVal"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <asp:TextBox ID="txtLoginPassword" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Password" ControlToValidate="txtLoginPassword" ValidationGroup="loginVal"></asp:RequiredFieldValidator>
                            </div>
                            <div id="divCheckbox" runat="server" visible="false" class="checkbox">
                                <label>
                                    <input type="checkbox" value="" checked>
                                    Remember me</label>
                            </div>
                            <asp:Button CssClass="btn btn-success btn-block" ID="LoginBtn" ValidationGroup="loginVal" OnClick="LoginBtn_Click" runat="server" Text="Login" />
                            <asp:Label ID="lblLoginError" runat="server"></asp:Label>
                        </div>
                        <div id="divForgotPassword" style="display: none;" runat="server">
                            <div class="form-group">
                                <label>Visitor ID</label>
                                <asp:TextBox ID="txtForgotPasswordUserName" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Visitor ID" ControlToValidate="txtForgotPasswordUserName" ValidationGroup="forgotpassVal"></asp:RequiredFieldValidator>
                            </div>
                            <asp:Button CssClass="btn btn-success btn-block" ID="btnForgotPasword" ValidationGroup="forgotpassVal" OnClick="btnForgotPasword_Click" runat="server" Text="Submit" />
                            <asp:Label ID="lblForgotPassError" runat="server"></asp:Label>
                        </div>
                        <div id="divOTPVerification" runat="server" style="display: none;">
                            <div class="row">
                                <div style="width: 16%; padding-right: 0px;" class="col-md-3">
                                    <div class="form-group">
                                        <label>Mobile No</label>
                                        <asp:DropDownList ID="ddlOTPCountryCode" DataSourceID="xmlDatasource1" DataTextField="text" DataValueField="value" class="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-10" style="padding-left: 5px;">
                                    <div class="form-group">
                                        <label style="padding-bottom: 20px;"></label>
                                        <asp:TextBox ID="txtOTPPhoneNumber" onkeypress="return Numeric(event);" MaxLength="10" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvOtpPhoneNumber" Enabled="false" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic"
                                            ErrorMessage="Enter Phone Number" ControlToValidate="txtOTPPhoneNumber" ValidationGroup="otpval"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rgvOTPPhoneNumber" Font-Size="11px" MinimumValue="1000000000" Type="Double" MaximumValue="9999999999" Display="Dynamic" ControlToValidate="txtOTPPhoneNumber" runat="server" ForeColor="Red"
                                            ValidationGroup="otpval" ErrorMessage="Please Enter valid Mobile Number"></asp:RangeValidator>
                                    </div>
                                </div>
                            </div>
                            <div id="divOtp" class="form-group">
                                <label>OTP</label>
                                <asp:TextBox ID="txtOTP" Style="text-transform: uppercase;" runat="server" class="form-control"></asp:TextBox>

                                <asp:LinkButton ID="lnkResendOTP" runat="server" Text="Resend OTP" OnClick="lnkResendOTP_Click"></asp:LinkButton>
                            </div>
                            <asp:Button CssClass="btn btn-success btn-block" ID="btnOTPVerification" ValidationGroup="otpval" OnClick="btnOTPVerification_Click" runat="server" Text="Submit" />
                            <asp:Label ID="lblOTPError" runat="server"></asp:Label>
                        </div>






                        <div id="divSignUp" runat="server" style="display: none;">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqFirstname" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic"
                                            ErrorMessage="Enter First Name" ControlToValidate="txtFirstName" ValidationGroup="valSignup"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rexFirstName" runat="server" ValidationExpression="[a-zA-Z]*$" Display="Dynamic" ForeColor="Red"
                                            ErrorMessage="Only characters are allowed in first name" ControlToValidate="txtFirstName" ValidationGroup="valSignup" Font-Size="11px"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <asp:TextBox ID="txtLastName" MaxLength="50" runat="server" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqLastname" ForeColor="Red" Font-Size="11px" runat="server"
                                            Display="Dynamic" ErrorMessage="Enter Last Name" ControlToValidate="txtLastName" ValidationGroup="valSignup"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rexLastName" runat="server" ValidationExpression="[a-zA-Z]*$" Display="Dynamic" ForeColor="Red"
                                            ErrorMessage="Only characters are allowed in last name" ControlToValidate="txtLastName" ValidationGroup="valSignup" Font-Size="11px"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <asp:DropDownList ID="ddlGender" class="form-control" runat="server">
                                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Age</label>
                                        <asp:TextBox ID="txtAge" onkeypress="return Numeric(event);" runat="server" MaxLength="3" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAge" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Age"
                                            ControlToValidate="txtAge" ValidationGroup="valSignup"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                                <div class="col-md-3 col-xs-4 mob1">
                                    <div class="form-group">
                                        <label>Mobile No</label>
                                        <asp:DropDownList ID="ddlCountryCode" DataSourceID="xmlDatasource1" DataTextField="text" DataValueField="value" class="form-control" runat="server">
                                        </asp:DropDownList>
                                        <asp:XmlDataSource ID="xmlDatasource1" runat="server" DataFile="~/CountryCodes.xml" XPath="CountryCodes/code"></asp:XmlDataSource>
                                    </div>
                                </div>
                                <div class="col-md-3 col-xs-8 mob2" style="padding-left: 3px;">
                                    <div class="form-group">
                                        <label style="color: #fff;">a</label>
                                        <asp:TextBox ID="txtMobileNumber" onkeypress="return Numeric(event);" runat="server" MaxLength="10" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvMobileNumber" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Mobile Number"
                                            ControlToValidate="txtMobileNumber" ValidationGroup="valSignup"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="rgvMob" Font-Size="11px" MinimumValue="1000000000" Type="Double" MaximumValue="9999999999" Display="Dynamic" ControlToValidate="txtMobileNumber" runat="server" ForeColor="Red"
                                            ValidationGroup="valSignup" ErrorMessage="Please Enter valid Mobile Number"></asp:RangeValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Email Address</label>
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqEmailAddress" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic"
                                    ErrorMessage="Enter Emailaddress" ControlToValidate="txtEmail" ValidationGroup="valSignup"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regEmailAddress" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Font-Size="11px" runat="server" Display="Dynamic" ValidationGroup="valSignup" ErrorMessage="Enter Valid Email address" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" class="form-control midiafor"></asp:TextBox>
                            </div>
                            <asp:Button CssClass="btn btn-success btn-block" ID="btnSignUp" ValidationGroup="valSignup" OnClick="btnSignUp_Click" runat="server" Text="Register" />
                            <asp:Label ID="lblSignUp" runat="server"></asp:Label>
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
                        <asp:LinkButton ID="lnkForgotPassword" runat="server" OnClick="lnkForgotPassword_Click" Text="Password?"></asp:LinkButton>
                    </p>
                    <p id="pVerifyUser" runat="server">
                        Already Registered?
                        <asp:LinkButton ID="lnkVerifyUser" runat="server" OnClick="lnkVerifyUser_Click" Text="Please Verify"></asp:LinkButton>
                    </p>
                </div>
            </div>
        </telerik:RadAjaxPanel>
    </div>

    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel2" runat="server" Transparency="30">
        <div class="modal-dialog" style="vertical-align: middle; text-align: center; background-color: white; height: 440px; margin-top: 0px !important;">
            <img alt="Loading..." src='/images/loading.gif' style="padding-top: 30% !important;" />
        </div>
    </telerik:RadAjaxLoadingPanel>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" RestoreOriginalRenderDelegate="false">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadSearchPanel">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadSearchPanel" LoadingPanelID="RadAjaxLoadingPanel2" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
</div>
<asp:HiddenField ID="hdnMrNumberexist" runat="server" />