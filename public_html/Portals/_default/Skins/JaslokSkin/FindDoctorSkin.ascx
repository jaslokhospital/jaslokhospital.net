<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FindDoctorSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_FindDoctorSkin" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Home/WriteToUs.ascx" TagPrefix="JS" TagName="WriteToUs" %>
<%@ Register Src="~/JSControls/Home/PhotoGallery.ascx" TagPrefix="JS" TagName="PhotoGallery" %>
<%@ Register Src="~/JSControls/Home/VideoGallery.ascx" TagPrefix="JS" TagName="VideoGallery" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>


<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<div id="contentpaneHeader" runat="server"></div>
<!-----header end->

 <!-- Carousel    ================================================== -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="item active">
                <asp:Image ID="imgbanner" runat="server" CssClass="img-div img-responsive" />
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="container">
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part">
                <div id="contentpane" runat="server"></div>
                <div id="desktop-bookandapp" class="left_form hidden-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment" />
                </div>
            </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part" style="margin-top: -10px;">
                <h1>Find Doctor</h1>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="media">
                    <div class="media-left media-top col-sm-3 col-xs-12">
                        <asp:Image ID="imgDoctor" runat="server" class="media-object media-border img-responsive" />
                    </div>
                    <div class="media-body col-sm-9 col-xs-12">
                        <footer style="padding-left: 0px;" class="panel-footer">
                            <i class="fa fa-user-md"></i>
                            <asp:Label class="s-bold" ID="lblDoctorName" runat="server"></asp:Label>
                            <asp:Label class="s-regular" ID="lblDocotrSpecialty" runat="server"></asp:Label>
                        </footer>
                        <div class="panel-body" id="DoctorDetails">
                            <p id="divDesignation" runat="server"></p>
                           
                        </div>
                        <div class="bs-example scopeofservices">
                            <div class="panel-group" id="accordion">                               
                                <p ID="divDescription" runat="server"></p> 
                                <p ID="divBriefWriteUp" runat="server"></p> 
                                <p ID="divAwards" runat="server"></p> 
                            </div>
                        </div>
                        <asp:LinkButton Style="margin-bottom: 12px;" ID="lbtnFAD" class="btn btn-orange" runat="server" OnClientClick = "SetTarget();" OnClick="lbtnFAD_Click">Fix an Appointment ></asp:LinkButton>
                    </div>
                </div>
                <div id="mobile-bookandapp" class="left_form hidden-lg visible-xs">
                </div>
            </div>
        </div>

    </div>
</div>
<JS:Testimonials runat="server" ID="Testimonials" />
<JS:Footer runat="server" ID="Footer" />
<script type = "text/javascript">
    function SetTarget() {
        document.forms[0].target = "_blank";
    }
</script>
<script type="text/javascript">
    $("#desktop-bookandapp").dragDropPositions();
</script>
























