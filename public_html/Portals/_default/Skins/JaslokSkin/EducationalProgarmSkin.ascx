<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EducationalProgarmSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_EducationalProgarmSkin" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagName="Testimonials" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/MiddleContent/InnerTestimonials.ascx" TagPrefix="JS" TagName="InnerTestimonials" %>
<%@ Register Src="~/JSControls/Common/LeftNavigation.ascx" TagPrefix="JS" TagName="LeftNavigation" %>


<%--<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>


<div id="contentpaneHeader" runat="server"></div>
<!-----header end->
            
    <!-- Carousel    ================================================== -->
<%--<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

            <asp:Image ID="imgbanner" alt="Cardiology" class="img-div img-responsive" runat="server" />
        </div>
    </div>
</div>--%>
<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right hidden-xs">--%>

<div class="row">
    <div class="container containerspace">
        <ul class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a id="rootbreadcrumb" runat="server" class="active" href="javascript:void(0);"><span id="MainRoot" runat="server">Education & Research</span></a></li>
            <li class="active" id="Subrootbreadcrumb" runat="server"><a id="SubRootAnchor" class="active" runat="server" href="javascript:void(0);"><span id="SubRootSpan" runat="server">Estimate request</span></a></li>
        </ul>
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part">
               <JS:LeftNavigation ID="leftNav" runat="server" />
              
                <div class="left_form hidden-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />
                </div>
            </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part">
                <%--  <div id="contentpane" runat="server" visible="false"></div>--%>
                <h3 id="h3header" runat="server"></h3>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="search-form">
                    <p id="contentpane" runat="server" style="width: 100%"></p>
                </div>
                <asp:Panel ID="divcontentpane" runat="server"></asp:Panel>

                
                <div class="left_form hidden-lg visible-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment" />
                </div>
            </div>
        </div>
    </div>
</div>


<!------testimonail start-------->
<JS:Testimonials runat="server" ID="Testimonials" />
<!----------Testimonial end---->

<JS:Footer runat="server" ID="Footer" />

</div>
<%--
<script type="text/javascript">

    $(document).ready(function () {

        if (window.location.pathname.includes("/dnb-program")) {
            document.getElementById("liDNBProgram").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "DNB Program&nbsp;<i class='fa fa-chevron-down'></i>";
        }
        else if (window.location.pathname.includes("/fellowship")) {
            document.getElementById("liFellowship").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "Fellowship&nbsp;<i class='fa fa-chevron-down'></i>";
        }
        else if (window.location.pathname.includes("/internship")) {
            document.getElementById("liInternship").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "Internship&nbsp;<i class='fa fa-chevron-down'></i>";
        }
        else if (window.location.pathname.includes("/advance-courses")) {
            document.getElementById("liAdvanceCourse").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "Advance Courses&nbsp;<i class='fa fa-chevron-down'></i>";
        }
        else if (window.location.pathname.includes("/nursing-program")) {
            document.getElementById("liNursingProgram").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "Nursing Program&nbsp;<i class='fa fa-chevron-down'></i>";
        }
        else if (window.location.pathname.includes("/healthtips") || window.location.pathname.includes("/healthdetails")) {
            document.getElementById("liHealthTips").className = "active";
            document.getElementById("anchSelectedMenu").innerHTML = "Health Tips&nbsp;<i class='fa fa-chevron-down'></i>";
        }
    });
</script>
--%>