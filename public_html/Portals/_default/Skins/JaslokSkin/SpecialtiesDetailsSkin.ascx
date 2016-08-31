<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SpecialtiesDetailsSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_SpecialtiesDetailsSkin" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Home/WriteToUs.ascx" TagPrefix="JS" TagName="WriteToUs" %>
<%@ Register Src="~/JSControls/Home/PhotoGallery.ascx" TagPrefix="JS" TagName="PhotoGallery" %>
<%@ Register Src="~/JSControls/Home/VideoGallery.ascx" TagPrefix="JS" TagName="VideoGallery" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<style>
    .h3headernew {
        font-size:25px; font-family:'Sansation-Bold'; color:#3a3c41;
    }
</style>
<link rel="stylesheet" href="/Portals/_default/Skins/JaslokSkin/Styles/css/pgwslideshow.css" />
        <link rel="stylesheet" href="/Portals/_default/Skins/JaslokSkin/Styles/css/pgwslideshow.min.css" />
        <link rel="stylesheet" href="/Portals/_default/Skins/JaslokSkin/Styles/css/pgwslideshow_light.css" />
        <link rel="stylesheet" href="/Portals/_default/Skins/JaslokSkin/Styles/css/pgwslideshow_light.min.css" />


<div id="contentpaneHeader" runat="server"></div>
<!-- header end -->

 <!-- Carousel -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="item active">
                <%--<asp:Image ID="imgbanner" runat="server" CssClass="img-div" />--%>
                <asp:Image id="imgAbout" alt="specialtydetail" runat="server" class="img-div" />
               <%-- <img id="imgFacilities" src="/images/inner-slider2.jpg" class="img-div" style="display:none;" />
                <img id="imgSpecialities" src="/images/inner-slider3.jpg" class="img-div" style="display:none;" />--%>
            </div>
        </div>
    </div>
</div>
<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right">--%>
<div class="row">
    <div class="container">
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part">
                <asp:Panel ID="leftPanelTab" runat="server">
                <div id="divAboutActive" class="about_dept" style="cursor: pointer" onclick="openPanel('About')">
                    <b>About the Department</b> <i class="fa fa-chevron-right"></i>
                </div>
                <div id="divFacilitiesActive" class="doc_attendence" style="cursor: pointer" onclick="openPanel('Facilities')">
                    <b>Facilities & Services</b> <i class="fa fa-chevron-right"></i>
                </div>
                <div id="divOurSpecialty" class="doc_attendence" style="cursor: pointer" onclick="openPanel('Specialist')">
                    <b>Our Specialists</b>
                </div>
                <div class="doc_attendence" id="leftVideopane"><a href="/video-gallery"><b>Videos</b></a></div>
                    </asp:Panel>               
                <div class="left_form  visible-lg visible-md  visible-sm hidden-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment" />
                </div>
            </div>
        </div>

        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part specialty_header">
                <div id="contentpane" runat="server"></div>
               
                <label id="h3header1" class="h3headernew" runat="server"></label><span runat="server" id="h3subheader" class="h3headernew"> - About the Department</span>
               <div class="specialtyBorder">
               <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div></div>
                <div class="search-form" runat="server" id="innerParaDiv">

                    <p id="innerParagraph" runat="server" visible="false"></p>

                </div>

                <asp:Panel ID="divcontentpane" runat="server">
                   <%-- <h3 id="aboutheader" runat="server"></h3>--%>
                    <div id="PAboutSD" class="specialityDetailContent" runat="server"></div>
                    <asp:Label ID="lblAboutmsg" runat="server" Text="No Records Found" style="color:red; font-size:16px; padding-top:10px;"></asp:Label>
                </asp:Panel>

                <asp:Panel ID="divFacilities" runat="server" Style="display: none">  
                                   
                    <div id="PFacilities" class="specialityDetailContent" runat="server"></div>
                     <asp:Label ID="lblFacilitiesMsg" runat="server" Text="No Records Found" style="color:red; font-size:16px; padding-top:10px;" Visible="false"></asp:Label>
                </asp:Panel>

                <asp:Panel ID="divcontentpaneSpecialty" runat="server" Style="display: none">
                   
                   <%-- <div class="border-3"></div>
                    <div class="border-3"></div>--%>
                      <asp:Repeater ID="datalistOurSpecialtyDs" OnItemCommand="datalistOurSpecialtyDs_ItemCommand" OnItemDataBound="datalistOurSpecialtyDs_ItemDataBound" runat="server">
                        <ItemTemplate>

                            <div class="media">
                                <div class="media-left media-top col-sm-3 col-xs-12" >

                                    <a data-toggle="collapse" data-parent="#accordion" href="" aria-expanded="true">
                                        <asp:Image style="width: 150px !important;" runat="server" class="media-object media-border img-responsive" ID="imgDoctorSDSkin" AlternateText=' <%#Eval("Title")%>' ImageUrl='<%#(string.IsNullOrEmpty(Convert.ToString(Eval("ImageUrl")))? CommonFn.DefaultImagePath : Eval("ImageUrl")) %>' />
                                    </a>
                                </div>
                                <div class="media-body col-sm-9 col-xs-12" style="background:#ebf0f3;">

                                    <footer class="panel-footer">
                                        <i class="fa fa-user-md"></i>
                                        <span class="s-bold"><%#Eval("Name")%></span>
                                    </footer>
                                    <div class="panel-body" Id="MainPanel" visible="false" runat="server">
                                       
                                         <asp:Panel visible="false" runat="server" ID="panelArea">
                                             <table>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="litDoctorDesc" runat="server" Text='<%#Eval("DoctorDescription")%>'></asp:Literal>
                                                </td>
                                            </tr>
                                        </table>
                                        </asp:Panel>
                                        <asp:Panel visible="false" runat="server" ID="pnlBriefWriteUp">
                                             <table>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="litBriefWriteUp" runat="server" Text='<%#Eval("BriefWriteUp")%>'></asp:Literal>
                                                </td>
                                            </tr>
                                        </table>
                                        </asp:Panel> 
                                         <asp:Panel visible="false" runat="server" ID="panelAwards">
                                             <table>
                                            <tr>
                                                <td>
                                                    <asp:Literal ID="litAwards" runat="server" Text='<%#Eval("Awards")%>'></asp:Literal>
                                                </td>
                                            </tr>
                                        </table>
                                        </asp:Panel>                                       
                                     <br>
                                        <a href='<%#"/find-doctor/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("Name")))+"/"+(Eval("DoctorId"))%>' style="text-align:right;" class="read-more pull-right">Read More <i class="fa fa-chevron-circle-right"></i>
                                        </a>
                                    </div>
                                    <%--<div id="divEmail" runat="server" visible='<%# !string.IsNullOrEmpty(Convert.ToString(Eval("EmailId")))%>' class="col-lg-12 col-md-12 col-sm-12">
                                        <label>Email    : </label>
                                        <a href="#"> <%# Eval("EmailId") %></a>
                                    </div>
                                    <div id="divMobile" runat="server" visible='<%# !string.IsNullOrEmpty(Convert.ToString(Eval("MobileNo")))%>' class="col-lg-12 col-md-12 col-sm-12">
                                        <label>Mobile    : </label>
                                        <a href="#"> <%# Eval("MobileNo") %></a>
                                    </div>
                                    <ul style="margin-bottom:10px;" class="pull-left">
                                        <i class="fa fa-linkedin circle"></i>
                                        <i class="fa fa-facebook circle"></i>
                                        <i class="fa fa-twitter circle"></i>
                                        <i class="fa fa-google-plus circle"></i>
                                    </ul>--%>
                                    <asp:LinkButton ID="lkbAppointment" CommandName="AppointMentRedirect" CommandArgument='<%#"/fix-appointment/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("Name")))+"/"+(Eval("DoctorId"))%>' 
                                        style='<%#Convert.ToString(Eval("DoctorDescription")).Length>10? "" : "margin-top:10px;" %>' OnClick="lkbAppointment_Click" runat="server" Text="Fix an Appointment >" CssClass="btn btn-orange"></asp:LinkButton>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Label ID="lblNoRec" runat="server" Text="<br/>No Doctors Found" style="color:red; font-size:16px; padding-top:10px;" Visible="false"></asp:Label>
                </asp:Panel>

                <asp:Panel ID="divcontentpaneSpecialtyVideo" runat="server" Style="display: none">
                </asp:Panel>

                 
                <div class="left_form hidden-lg visible-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />
                </div>
            </div>

        </div>
    </div>
</div>

<JS:Testimonials runat="server" ID="Testimonials" />
<JS:Footer runat="server" ID="Footer" />

<script src="../../Portals/_default/Skins/JaslokSkin/Styles/js/pgwslideshow.min.js" defer="defer"></script>
<script src="../../Portals/_default/Skins/JaslokSkin/Styles/js/pgwslideshow.js"></script>
<script type="text/javascript">
 //   var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
 //    var keyCode = e.which ? e.which : e.keyCode
 //    var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
 //}
    $(document).ready(function () {
        $('.pgwSlideshow').pgwSlideshow();
    });
    function openPanel(val) {
        document.getElementById('<%=divcontentpane.ClientID%>').style.display = 'none';
        document.getElementById('<%=divcontentpaneSpecialty.ClientID%>').style.display = 'none';
        document.getElementById('<%=divFacilities.ClientID%>').style.display = 'none';

        document.getElementById('divAboutActive').className = 'doc_attendence';
        document.getElementById('divFacilitiesActive').className = 'doc_attendence';
        document.getElementById('divOurSpecialty').className = 'doc_attendence';

        //document.getElementById('imgAbout').style.display = 'none';
        //document.getElementById('imgFacilities').style.display = 'none';
        //document.getElementById('imgSpecialities').style.display = 'none';

        if (val == 'About') {
            document.getElementById('<%=divcontentpane.ClientID%>').style.display = 'block';
            document.getElementById('divAboutActive').className = 'about_dept';
            document.getElementById('<%=h3subheader.ClientID%>').innerHTML = "<b> - About the Department</b>";
            //document.getElementById('imgAbout').style.display = 'block';

        }
        else if (val == 'Facilities') {
            document.getElementById('<%=divFacilities.ClientID%>').style.display = 'block';
            document.getElementById('divFacilitiesActive').className = 'about_dept';
            document.getElementById('<%=h3subheader.ClientID%>').innerHTML = "<b> - Facilities & Services</b>";            //document.getElementById('imgFacilities').style.display = 'block';
        }
        else if (val == 'Specialist') {
            document.getElementById('<%=divcontentpaneSpecialty.ClientID%>').style.display = 'block';
            document.getElementById('divOurSpecialty').className = 'about_dept';
            document.getElementById('<%=h3subheader.ClientID%>').innerHTML = "<b> - Our Specialists</b>";
            //document.getElementById('imgSpecialities').style.display = 'block';
            }
}
</script>
 
        
       