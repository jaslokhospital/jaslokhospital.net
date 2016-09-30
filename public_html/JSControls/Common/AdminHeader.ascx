<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminHeader.ascx.cs" Inherits="JSControls_Home_AdminHeader" %>
<!--//// FEATURED ARTICLES /////-->


<div class="container-fluid header">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="pull-left">
                    <ul class="list cl-effect-2">
                        <li>
                            <%--    <a href="#" id="A1"><img src="/images/lock2.png" alt="Login" class="login_icon">Login</a>--%>

                            <a id="anchlogin" runat="server" href="/login">
                                <img src="/images/lock2.png" alt="Login" class="login_icon">Login</a>
                            <a id="anchlogout" runat="server" href="/" causesvalidation="false" onserverclick="SignIn">
                                <img src="/images/lock2.png" alt="Login" class="login_icon">Logout</a>
                        </li>
                    </ul>
                </div>
                <div class="pull-right header_top">
                    <span class="quick_connect"></span>
                    <button class="btn btn_number">
                        </button>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

    </div>
    <div class="line"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <nav class="navbar navbar-inverse">
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
                        <div id="Div1" class="collapse navbar-collapse">
                            <ul class="nav navbar-nav menu">

                                <li id="liMasters" runat="server" class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Masters <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="ManagePages.aspx">Manage Pages</a></li>
                                        <li><a href="ManageBanners.aspx">Manage Banners</a></li>
                                        <li><a href="ManageTestinomial.aspx">Manage Testimonials</a></li>
                                        <li><a href="ManageDoctor.aspx">Manage Doctors</a></li>
                                        <li><a href="ManageEnquiry.aspx">Manage Enquiries</a></li>
                                        <li><a href="ManageHomeSlider.aspx">Manage Homepage slider</a></li>
                                        <li><a href="ManageHealthTips.aspx">Manage Health Tips</a></li>
                                        <li><a href="ManageUsers.aspx">Manage Trustees/Management</a></li>
                                        <li><a href="Manage-News.aspx">Manage News</a></li>
                                        <li><a href="ManageBookAppointment.aspx">Manage Booked Appointments</a></li>
                                        <li><a href="ManageJaslokTimes.aspx">Manage Jaslok Times</a></li>
                                        <li><a href="/jaslokadmin/manageformsemail">Manage Forms Email</a></li>
                                      <%--  <li><a href="WhatsNew.aspx">Manage What's New</a></li>--%>
                                    </ul>
                                </li>

                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Specialties <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="ManageSpecialties">Manage Specialty</a></li>
                                       <%-- <li><a href="ManageSpecialityClinicsOPD.aspx">Manage Speciality Clinics OPD</a></li>--%>
                                        <%--<li><a href="ManageDoctorMapping.aspx">Manage Doctor Mapping</a></li>--%>
                                        <li><a href="ManageDoctorSchedule.aspx">Manage Doctor Schedule</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Media Room <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="ManageAlbums.aspx">Manage Albums</a></li>
                                        <li><a href="ManagePhotoGallery.aspx">Manage Photos</a></li>
                                        <li><a href="ManageVideoGallery.aspx">Manage Videos</a></li>
                                    </ul>
                                </li>


                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Career <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="ManageCareerCategory.aspx">Manage Job Category</a></li>
                                        <li><a href="ManageCareerPosition.aspx">Manage Positions</a></li>
                                        <li><a href="ViewCareerApplication.aspx">View Application</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Education & Research<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="/JaslokAdmin/ManageResearchPapers">Manage Research Papers</a></li>                                       
                                    </ul>
                                </li>
                                <%--<li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Seminars <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="ManageSeminars">Manage Seminars</a></li>
                                        <li><a href="ViewSeminarEntries">View Seminar Entries</a></li>
                                    </ul>
                                </li>--%>
                               <%-- <li class="dropdown">
                                    <a id="a1" runat="server" href="/login">
                                        <img src="/images/lock2.png" alt="Login" class="login_icon">Login</a>
                                    <a id="a2" runat="server" href="/" causesvalidation="false" onserverclick="SignIn">
                                        <img src="/images/lock2.png" alt="Login" class="login_icon">Logout</a>

                                </li>--%>


                            </ul>

                        </div>
                        <!--/.nav-collapse -->
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>



