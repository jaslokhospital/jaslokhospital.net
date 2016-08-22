<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="JSControls_Home_Header" %>
<!--//// FEATURED ARTICLES /////-->
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/JSControls/Common/StickyFindDoctor.ascx" TagPrefix="JS" TagName="StickyFindDoctor" %>

<div class="container-fluid quick-connect-hover">
    <div class="container">
        <div class="row">
                    
                            <div class="col-md-3  col-sm-6">
                                <div class="container-border">
                                        <div class="icon-image"><img src="/images/quick-connect-icon2.jpg" alt="quick-connect-icon"/></i></div>
                                        <div class="icon-content">
                                            <span class="email-line"> EMAIL ID </span>
                                            <span class="content-line">online@jaslokhospital.net</span>
                                        </div>
                                    </div>
                                </div>
                             <div class="col-md-3  col-sm-6">
                                <div class="container-border">
                                        <div class="icon-image"><img src="/images/quick-connect-icon3.jpg" alt="quick-connect-icon"/></i></div>
                                        <div class="icon-content">
                                            <span class="email-line">AMBULANCE NUMBER</span>
                                            <span class="content-line">022 6657 3010</span>
                                        </div>
                                    </div>
                                </div>

                              <div class="col-md-3  col-sm-6">
                                  <div class="container-border">
                                        <div class="icon-image"><img src="/images/quick-connect-icon1.jpg" alt="quick-connect-icon"/></i></div>
                                        <div class="icon-content">
                                            <span class="email-line">EMERGENCY NUMBER</span>
                                            <span class="content-line">1800 221 800</span>
                                        </div>
                                    </div>
                                </div>

                              <div class="col-md-3 col-sm-6">
                                 <div class="container-border right_border">
                                     <a href="/feedback">
                                        <div class="icon-image"><img src="/images/quick-connect-icon2.jpg" alt="quick-connect-icon"/></i></div>
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
    

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 headeronly">
                <div class="pull-left">
                    <ul class="list cl-effect-2">
                        <li id="liLogin" runat="server">
                            <a href="#" id="myBtn">
                                <img src="/images/lock2.png" alt="Login" class="login_icon">Login</a> </li>
                        <li id="liLogout" runat="server">
                            <a id="anchlogout" runat="server" href="/" causesvalidation="false" onserverclick="SignIn">
                                <img src="/images/lock2.png" alt="Login" class="login_icon">Logout</a>
                        </li>
                        <li class="dropdown"><a aria-expanded="true" aria-haspopup="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="about.html"><span data-hover="About">Select Language</span> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Hindi</a></li>
                                <li><a href="#">English</a></li>
                                <li><a href="#">Arabic </a></li>
                            </ul>
                        </li>
                        <li runat="server" id="liAhome">
                            <a runat="server" id="anchorAhome">
                                <asp:Label ID="lblAhome" runat="server" Visible="false"></asp:Label></a>
                        </li>
                    </ul>
                </div>
                <div class="pull-right header_top">
                    <span class="quick_connect hideonmobile"><a href="#" id="quick_connect01">Quick Connect <i class="glyphicon glyphicon-chevron-up"></i></a></span>
                    <button class="btn btn_number">
                        <img src="/images/car.png" class="" />1800-22-1800</button>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

    </div>
    <div class="line"></div>
   
                <nav class="navbar navbar-inverse mainnav">
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
                        <div id="navbar" class="collapse navbar-collapse">
                            <ul class="nav navbar-nav menu">

                                <li class="dropdown" role="presentation">
                                    <a class="dropdown-toggle" id="idHome" href="/" role="button" aria-haspopup="true" aria-expanded="false">HOME
                                    </a>
                                </li>

                                <li class="dropdown" role="presentation">
                                    <a class="dropdown-toggle" data-toggle="dropdown"  id="licorporateProfile" href="/corpotate-profile" role="button" aria-haspopup="true" aria-expanded="false">CORPORATE PROFILE<span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/from-the-chairmans-desk">From The Chairman's Desk</a></li>
                                        <li><a href="/vision-and-mission">Vision And Mission</a></li>
                                        <li><a href="/trustees">Trustees</a></li>
                                         <li><a href="/Management">Management Team</a></li>
                                          <li><a href="/corporate-profile/hospital-facilities">Hospital Facilities</a></li>
                                        <li><a href="/Certifications">Certifications</a></li>
                                        <li><a href="/jaslok-news">Jaslok in News</a></li>
                                      <%--  <li><a href="/jasloktimes">Jaslok Times</a></li>--%>
                                        <li><a href="/scope-of-services">Scope Of Services</a></li>
                                        <%--  <li><a href="/testimonial">Testimonial</a></li>--%>
                                        <li><a href="/faq">Frequently Asked question</a></li>
                                        <li><a href="/qualitycorner">Quality Corner</a></li>
                                    </ul>
                                </li>
                                <li role="presentation" class="dropdown">
                                    <a class="dropdown-toggle" id="lispecialties" data-toggle="dropdown" href="/specialties" role="button" aria-haspopup="true" aria-expanded="false">SPECIALTIES <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/health-check-up">Health Check up</a></li>
                                        <li><a href="/specialties">Facilities & Services</a></li>
                                        <li><a href="/specialties">Doctors in attendance</a></li>
                                        <li><a href="#">Speciality OPD</a></li>
                                        <li><a href="#">Doctor OPD</a></li>
                                        <li><a href="/speciality-clinic-opd">Speciality Clinic OPD</a></li>
                                    </ul>

                                </li>

                                <li role="presentation" class="dropdown">
                                    <a class="dropdown-toggle" id="lipatients" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">PATIENTS CARE & VISITORS <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/patientfacilities">Patient Facilities</a></li>
                                        <li><a href="https://jaslokwebserver.jaslokhospital.net/jaslok_bill/User_Login.aspx">View Billing Details</a></li>
                                        <li><a href="https://jaslokwebserver.jaslokhospital.net/jaslokwebreports/default.aspx">View Lab Reports</a></li>
                                        <li><a href="/feedback">Feedback Form</a></li>
                                        <li><a href="/complaint">Complaint Form</a></li>
                                        <li><a href="/quick-inquiry">Quick Inquiry</a></li>
                                        <li><a href="/estimate-request">Estimate request</a></li>


                                    </ul>
                                </li>
                                <li role="presentation" class="dropdown">
                                    <a id="liinternational" class="dropdown-toggle" data-toggle="dropdown" href="/international-patients" role="button" aria-haspopup="true" aria-expanded="false">INTERNATIONAL PATIENTS <span class="caret"></span>
                                    </a>

                                    <ul class="dropdown-menu">
                                        <li><a href="/international-patients">International Patients</a></li>
                                        <li><a href="/international-patients/hospital-facilities">Hospital Facilities</a></li>
                                        <li><a href="/Facilities-for-International-patients">Facilities for International patients</a></li>
                                        <li><a href="/doctors-availability">Doctors Availability</a></li>
                                        <li><a href="/virtual-tour">Virtual Tour</a></li>
                                        <li><a href="/Feedback">Feedback</a></li>
                                        <li><a href="/testimonial">Testimonials</a></li>
                                        <li><a href="/estimate-request">Estimate request</a></li>
                                    </ul>
                                </li>

                                <li role="presentation" class="dropdown">
                                    <a id="lieducational" class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">EDUCATION & RESEARCH <span class="caret"></span>
                                    </a>

                                    <ul class="dropdown-menu">
                                        <li><a href="/DNB-Program">DNB Program</a></li>
                                        <li><a href="/Fellowship">Fellowship</a></li>
                                        <li><a href="/Internship">Internship</a></li>
                                        <li><a href="/Advance-Courses">Advance Courses</a></li>
                                        <li><a href="/Nursing-Program">Nursing Program</a></li>
                                        <li><a href="/healthtips">Health Tips</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!--/.nav-collapse -->
                    </div>
                </nav>
</div>
<JS:StickyFindDoctor runat="server" ID="StickyFindDoctor" />

<div class="modal fade" id="myModal" role="dialog">

    <div class="modal-dialog">
        <!-- Modal content-->
        <telerik:RadAjaxPanel ID="RadSearchPanel" LoadingPanelID="RadAjaxLoadingPanel1" runat="server">
            <asp:HiddenField ID="hdnStatus" runat="server" Value="login" />
            <div id="divLogin" class="modal-content">
                <div class="modal-header" style="padding: 5px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-lock"></span>
                        <asp:Literal ID="litPopUpTitle" runat="server" Text="Login"></asp:Literal></h4>
                </div>
                <div class="modal-body" style="padding: 40px 50px;">
                    <div role="form">
                        <div class="form-group">
                            <label for="usrname"><span class="glyphicon glyphicon-user"></span>Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter Username" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqUSername" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Username" ControlToValidate="txtUsername" ValidationGroup="loginvalidate"></asp:RequiredFieldValidator>
                        </div>
                        <div id="divPassword" runat="server" class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>Password</label>
                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" placeholder="Enter password" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqPassword" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ValidationGroup="loginvalidate"></asp:RequiredFieldValidator>
                        </div>
                        <div id="divConfirmPassword" visible="false" runat="server" class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPassword" TextMode="Password" runat="server" placeholder="Re-enter password" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqConfirmPassword" Enabled="false" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Confirm Password" ControlToValidate="txtConfirmPassword" ValidationGroup="loginvalidate"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cmpConfirmPassword" Enabled="false" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Password and confirm password should be same" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ValidationGroup="loginvalidate"></asp:CompareValidator>
                        </div>
                        <div id="divEmail" visible="false" runat="server" class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-open"></span>Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email Address" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqEmailAddress" Enabled="false" ForeColor="Red" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Emailaddress" ControlToValidate="txtEmail" ValidationGroup="loginvalidate"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regEmailAddress" Enabled="false" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="11px" runat="server" Display="Dynamic" ErrorMessage="Enter Valid Emailaddress" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                        </div>
                        <div id="divCheckbox" runat="server" class="checkbox">
                            <label>
                                <input type="checkbox" value="" checked>
                                Remember me</label>
                        </div>
                        <asp:Button CssClass="btn btn-success btn-block" ID="btnLogin" ValidationGroup="loginvalidate" OnClick="btnLogin_Click" runat="server" Text="Login" />
                        <asp:Label ID="lblError" ForeColor="Red" Font-Size="11px" runat="server"></asp:Label>
                        <%--<button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span>Login</button>--%>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>Cancel</button>
                    <p id="pSignUp" runat="server">
                        Not a member?
                        <asp:LinkButton ID="lnkSignUp" runat="server" OnClick="lnkSignUp_Click" Text="Sign Up"></asp:LinkButton>
                    </p>
                    <p id="pSignIn" runat="server" visible="false">
                        Already User?
                        <asp:LinkButton ID="lnkBtnSignIn" runat="server" Text="Sign In" OnClick="lnkBtnSignIn_Click"></asp:LinkButton>
                    </p>
                    <p id="pForgotPassWord" runat="server">
                        Forgot
                        <asp:LinkButton ID="lnkForgotPassword" runat="server" OnClick="lnkForgotPassword_Click" Text="Password?"></asp:LinkButton>
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

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadSearchPanel">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadSearchPanel" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
</div>







<script type="text/javascript">
    $(document).ready(function () {

        document.getElementById("idHome").className = "";
        document.getElementById("licorporateProfile").className = "";
        document.getElementById("lispecialties").className = "";
        document.getElementById("lipatients").className = "";
        document.getElementById("liinternational").className = "";
        document.getElementById("lieducational").className = "";

        if (window.location.pathname == "/")
            $("#idHome").closest("li").addClass("active");
        else if (window.location.pathname.includes("/corporate-profile"))
            $("#licorporateProfile").closest("li").addClass("active");
        else if (window.location.pathname.includes("/specialties"))
            $("#lispecialties").closest("li").addClass("active");
        else if (window.location.pathname.includes("/patients"))
            $("#lipatients").closest("li").addClass("active");
        else if (window.location.pathname.includes("/international-patients"))
            $("#liinternational").closest("li").addClass("active");
        else if (window.location.pathname.includes("/education-research"))
            $("#lieducational").closest("li").addClass("active");

        $("#myBtn").click(function () {
            $("#myModal").modal();
            $("#dnn_Header_lblError").empty();
        });

        



    });


    $(document).ready(function () {

        var clickedOnBody = true;

        $("#quick_connect01").click(function () {
            clickedOnBody = false;
        });


        $(".quick-connect-hover").hide();

        $("#quick_connect01").hover(function () {
            clearTimeout(timeout);
            $(".quick-connect-hover").slideDown("slow");
        });

        var timeout;

        function hidepanel() {
            $('.quick-connect-hover').slideUp();
        }

        $('.quick-connect-hover').mouseleave(doTimeout);
        $('#quick_connect01').mouseleave(doTimeout);

        function doTimeout() {
            clearTimeout(timeout);
            timeout = setTimeout(hidepanel, 3000);
        }

        $("html").click(function () {
            if (clickedOnBody) {
                $('.quick-connect-hover').hide();
            }
            clickedOnBody = true;
        });
    });

</script>
<script type="text/javascript">
</script>

