<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ThankyouPageSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_ThankyouPageSkin" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagName="Testimonials" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/MiddleContent/InnerTestimonials.ascx" TagPrefix="JS" TagName="InnerTestimonials" %>
<%@ Register Src="~/JSControls/Common/LeftNavigation.ascx" TagPrefix="JS" TagName="LeftNavigation" %>

<div id="contentpaneHeader" runat="server"></div>
<!-----header end->
            
    <!-- Carousel    ================================================== -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

           <%-- <asp:Image ID="imgbanner" alt="Cardiology" class="img-div img-responsive" runat="server" />--%>
        </div>
    </div>
</div>
<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right hidden-xs">--%>

<div class="row">
    <div class="container containerspace ">
        <ul class="breadcrumb" runat="server" id="PageBreadCub">
            <li><a href="/">Home</a></li>
            <li><a id="rootbreadcrumb" runat="server" class="active" href="/corporate-profile"><span id="MainRoot" runat="server">Corporate Profile</span></a></li>
            <li class="active" id="Subrootbreadcrumb" runat="server"><a id="SubRootAnchor" class="active" href="javascript:void(0);"><span id="SubRootSpan" runat="server"></span></a></li>
        </ul>

        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part">
                <JS:LeftNavigation ID="leftNav" runat="server" />  
            </div>
            <div class="left_form hidden-xs">
                <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />
                <%--<JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />--%>
            </div>
            </div>

        <div id="divContactus" class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part">

               <%-- <h3 id="h3header" runat="server"></h3>--%>
                <%--<div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>--%>
                <div id="contentpane" class="inner-content" runat="server">
                </div>
                
               <%-- <asp:Panel ID="divcontentpane" runat="server"></asp:Panel>--%>
                <div class="form-horizontal">
                        <h3 style="color:green;text-align:center" id="h3Message" runat="server"></h3>
                         </div>

            </div>
        </div>
         <asp:Panel ID="divMap" class="col-lg-9" runat="server" Visible="false"></asp:Panel>
        <div class="left_form hidden-lg visible-xs">
            <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment" />
        </div>
    </div>
</div>

<%--<div style="overflow:hidden;height:500px;width:600px;padding-left:30%"><div id="gmap_canvas" style="height:500px;width:600px;"><style>#gmap_canvas img{max-width:none!important;background:none!important}</style><a class="google-map-code" href="http://www.themecircle.net" id="get-map-data">wordpress themes</a></div></div>--%>

<!------testimonail start-------->
<JS:Testimonials runat="server" ID="Testimonials" />
<!----------Testimonial end---->

<JS:Footer runat="server" ID="Footer" />

<%--<script class="secret-source">
    jQuery(document).ready(function ($) {
        if (window.location.pathname.toLowerCase() == "/corporate-profile/certifications") {
            $('#certification-banner-slider').bjqs({
                animtype: 'slide',
                width: 500,
                height: 757,
                responsive: true,
                randomstart: false
            });
        }
        $('.collapse').on('shown.bs.collapse', function () {
            $(this).parent().find(".fa-plus").removeClass("fa-plus").addClass("fa-minus");
        }).on('hidden.bs.collapse', function () {
            $(this).parent().find(".fa-minus").removeClass("fa-minus").addClass("fa-plus");
        });

    });
</script>--%>
