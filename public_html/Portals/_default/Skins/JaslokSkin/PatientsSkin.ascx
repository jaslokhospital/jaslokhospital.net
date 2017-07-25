<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PatientsSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_PatientsSkin" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagName="Testimonials" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/MiddleContent/InnerTestimonials.ascx" TagPrefix="JS" TagName="InnerTestimonials" %>
<%@ Register Src="~/JSControls/Home/HomePageBanner.ascx" TagName="HomePageBanner" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Common/LeftNavigation.ascx" TagPrefix="JS" TagName="LeftNavigation" %>

<%--<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>


<div id="contentpaneHeader" runat="server"></div>
<!-----header end->
            
    <!-- Carousel    ================================================== -->
<JS:HomePageBanner runat="server" ID="HomePageBanner" />
<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right hidden-xs">--%>

<div class="row">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a id="rootbreadcrumb" runat="server" class="active" href="/specialties"><span id="MainRoot">Specialties</span></a></li>
            <li class="active" id="Subrootbreadcrumb" runat="server"><a id="SubRootAnchor" class="active" href="javascript:void(0);"><span id="SubRootSpan" runat="server"></span></a></li>
        </ul>
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part">
                <JS:LeftNavigation ID="leftNav" runat="server" />
                <div id="desktop-bookandapp" class="left_form hidden-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />
                </div>
            </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part">
                <div id="contentpane" runat="server"></div>
                <h1 id="h3header" runat="server"></h1>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="search-form">
                    <p id="innerParagraph" runat="server" style="width: 100%"></p>
                </div>
                <asp:Panel ID="divcontentpane" runat="server"></asp:Panel>
                
            </div>
            <div id="mobile-bookandapp" class="left_form hidden-lg visible-xs">
                </div>
        </div>
    </div>
    <!------testimonail start-------->
    <JS:Testimonials runat="server" ID="Testimonials" />
    <!----------Testimonial end---->

    <JS:Footer runat="server" ID="Footer" />

</div>
<script type="text/javascript">
    $("#desktop-bookandapp").dragDropPositions();
</script>
<%--<script type="text/javascript">
    $(document).ready(function () {
        if (window.location.pathname.includes("/patient-facilities")) {
            document.getElementById("liPatientFacilities").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "Patient Facilities&nbsp;<i class='fa fa-chevron-down'></i>";
        }
            /*else if (window.location.pathname.includes("/facilities-for-international-patients")) {
                document.getElementById("liBillingDetails").className = "active";
                document.getElementById("anchSelectedMenu").innerHTML = "View Billing Details";
            }
            else if (window.location.pathname.includes("/doctors-availability")) {
                document.getElementById("liLabReports").className = "active";
                document.getElementById("anchSelectedMenu").innerHTML = "View Lab Reports";
            }*/
        else if (window.location.pathname.includes("/feedback")) {
            document.getElementById("liFeedbackform").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "Feedback Form&nbsp;<i class='fa fa-chevron-down'></i>";
        }
        else if (window.location.pathname == "/complaint") {
            document.getElementById("liComplainform").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "Complaint Form&nbsp;<i class='fa fa-chevron-down'></i>";
        }
        else if (window.location.pathname.includes("/quick-inquiry")) {
            document.getElementById("liQuickInquiry").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "Quick Inquiry&nbsp;<i class='fa fa-chevron-down'></i>";
        }
        else if (window.location.pathname.includes("/estimate-request")) {
            document.getElementById("liEstimateRequest").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "Estimate request&nbsp;<i class='fa fa-chevron-down'></i>";
        }

    });
</script>--%>
