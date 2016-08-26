<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InternationalPatientsSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_InternationalPatientsSkin" %>
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

<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right hidden-xs">--%>

<div class="row">
    <div class="container containerspace">
        <ul class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a id="rootbreadcrumb" runat="server" class="active" href="/international-patients"><span id="MainRoot" runat="server">International Patients</span></a></li>
            <li class="active" id="Subrootbreadcrumb" runat="server"><a id="SubRootAnchor" class="active" runat="server" href="javascript:void(0);"><span id="SubRootSpan" runat="server">Estimate request</span></a></li>
        </ul>
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part">
                <JS:LeftNavigation ID="leftNav" runat="server" />
            </div>
            <div class="left_form hidden-xs">
                <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />
            </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part">                
                <h3 id="h3header" runat="server"></h3>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <p id="innerParagraph" runat="server" style="width: 100%"></p>
                <asp:Panel ID="divcontentpane" runat="server"></asp:Panel>
               
            </div>
        </div>
         <div class="left_form hidden-lg visible-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment" />
                </div>
    </div>
</div>


<!------testimonail start-------->
<JS:Testimonials runat="server" ID="Testimonials" />
<!----------Testimonial end---->

<JS:Footer runat="server" ID="Footer" />
 <div id="contentpane" runat="server">
                </div> 
<%--<script type="text/javascript">
    $(document).ready(function () {
        if (window.location.pathname.includes("/international-patients/hospital-facilities")) {
            $("#liHospitalFacilities").closest("li").addClass("active");
            $("#anchSelectedMenu").html("Hospital Facilities<i class='fa fa-chevron-down'>");
        }
        else if (window.location.pathname.includes("/hospital-facilities")) {
            $("#liCorporateFacilities").closest("li").addClass("active");
            $("#anchSelectedMenu").html("Hospital Facilities<i class='fa fa-chevron-down'>");
        }
        else if (window.location.pathname.includes("/facilities-for-international-patients")) {
            $("#liFacilitiesforInternationalpatients").closest("li").addClass("active");
            $("#anchSelectedMenu").html("Facilities for International patients<i class='fa fa-chevron-down'>");
        }
        else if (window.location.pathname.includes("/doctors-availability")) {
            $("#liDoctorsAvailability").closest("li").addClass("active");
            $("#anchSelectedMenu").html("Doctors Availability<i class='fa fa-chevron-down'>");
        }
        else if (window.location.pathname.includes("/video-gallery")) {
            $("#liVirtualTour").closest("li").addClass("active");
            $("#anchSelectedMenu").html("Facilities for International patients<i class='fa fa-chevron-down'>");
        }
        else if (window.location.pathname == "/feedback") {
            $("#liFeedback").closest("li").addClass("active");
            $("#anchSelectedMenu").html("Feedback<i class='fa fa-chevron-down'>");
        }
        else if (window.location.pathname.includes("/testimonial")) {
            $("#liTestimonials").closest("li").addClass("active");
            $("#anchSelectedMenu").html("Testimonials<i class='fa fa-chevron-down'>");
        }
        else if (window.location.pathname.includes("/international-patients")) {
            $("#liInternationalPatients").closest("li").addClass("active");
            $("#anchSelectedMenu").html("International Patients<i class='fa fa-chevron-down'>");
        }

    });
</script>--%>

