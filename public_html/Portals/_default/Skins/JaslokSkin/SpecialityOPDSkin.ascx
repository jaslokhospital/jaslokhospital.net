<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SpecialityOPDSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_SpecialityOPDSkin" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagName="Testimonials" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>

<div id="contentpaneHeader" runat="server"></div>
<!-----header end->
            
    <!-- Carousel    ================================================== -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

            <asp:Image ID="imgbanner" ImageUrl="/Content/Banner/opd-web-banner-150216-20160215114721383.jpg" alt="opd web banner" class="img-div img-responsive" runat="server" />
        </div>
    </div>
</div>
<div class="row">
    <div class="container containerspace ">
        <ul class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a href="/specialties">Specialities</a></li>
            <li class="active">Speciality OPD</li>
        </ul>

        <div class="col-lg-4 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part" id="sidebar">
                <div id="nav-anchor"></div>
                <nav class="leftmenuweb leftmenuweb_scroll" style="position: relative;">
                    <ul class="opdlisting">
                        <asp:Repeater ID="rptSpecialtyNameSOPD" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a onclick='<%# string.Format("hidespeciality(\"{0}\")",Eval("SpecialtyId").ToString()) %>' href="#"><%# Eval("SpecialtyName") %></a>
                                    <asp:HiddenField ID="hdnSpecialityId" runat="server" Value='<%# Eval("SpecialtyId") %>' />

                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </nav>
            </div>
        </div>
        <div id="contentpane" runat="server"></div>
        <div class="col-lg-8 col-md-9 col-sm-8 col-xs-12">

            <div class="right_part specialitywiseOPD" id="content">
                <h3>Speciality OPD</h3>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <asp:Repeater ID="rptSpecialOpdDoctorMain" OnItemDataBound="rptSpecialOpdDoctorMain_ItemDataBound" runat="server">
                    <ItemTemplate>
                        <div class="media doctorcontent leftmenuweb_scroll1" style="display: none;" id='<%# Eval("SpecialtyId")%>'>
                            <asp:HiddenField ID="hdnSpecialityOPDId" runat="server" Value='<%# Eval("SpecialtyId") %>' />
                            <asp:Repeater ID="rptInnerDoctor" OnItemDataBound="rptInnerDoctor_ItemDataBound" OnItemCommand="rptSpecialOpdDoctorMain_ItemCommand1" runat="server">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnDoctorId" runat="server" Value='<%# Eval("DoctorId") %>' />
                                    <div class="media-body col-sm-12 col-xs-12">
                                        <footer class="panel-footer">
                                            <i class="fa fa-user-md"></i><span style="padding-left: 3%;" class="s-bold"><%# Eval("Name") %></span><span class="s-regular"><%# Eval("SpecialtyName") %></span>
                                            <asp:HiddenField ID="hdnSpecialityOPDInnerId" runat="server" Value='<%# Eval("SpecialtyId") %>' />
                                        </footer>
                                        <div class="opddoctors">
                                            <asp:Repeater ID="rptDoctorSchedule" runat="server">
                                                <ItemTemplate>
                                                    <div class="opddatalisting">
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label>Day    : </label>
                                                            <%# Eval("Day") %>
                                                        </div>
                                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                                            <label>Time   : </label>
                                                            <%# Eval("Time") %> 
                                                        </div>                                                        
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <%--<a data-parent="#media-accordion" style="margin-top: 5px;" href='<%# "fix-an-appointment/di/"+Eval("DoctorId").ToString()+"/si/" + Eval("SpecialtyID").ToString() %>' aria-expanded="true" aria-controls="collapseOne" class="btn btn-orange">Fix an Appointment &gt;--%>
                                             <asp:LinkButton ID="lkbAppointment" CommandName="AppointMentRedirect" CommandArgument='<%#"/fix-appointment/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("Name")))+"/"+(Eval("DoctorId"))%>' 
                                         style="margin-top:5px;" runat="server" Text="Fix an Appointment >" CssClass="btn btn-orange"></asp:LinkButton>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblEmptyData" runat="server" Font-Bold="true" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>' Text="No Doctors Found." />

                                    <div class="item active" id="dvPDF" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count > 0 %>'>
                                    <div class="row">
                                        <div class="col-lg-4 col-md-9 col-md-offset-1 col-sm-9 col-sm-offset-1 col-xs-10 col-xs-offset-1">
                                            <ul class="media-list">
                                                <li class="media">
                                                    <div class="media-left">
                                                        <a href="/UploadedFiles/TestFile.pdf">
                                                            <img class="media-object" src="images/pdf.png" alt="...">
                                                        </a>
                                                    </div>
                                                    <div class="media-body">
                                                        <h4 class="media-heading">Download PDF</h4>
                                                        <p>
                                                            <a href="/pdf/OPD schedule Final 071015.pdf" target="_blank">
                                                            <i class="glyphicon glyphicon-download"></i>
                                                            <span>Download </span>
                                                            </a>
                                                        </p>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            

            <!--/.media-->
            
            <div class="left_form hidden-lg visible-xs">
                <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />
            </div>
        </div>


    </div>
</div>


<!------testimonail start-------->
<JS:Testimonials runat="server" ID="Testimonials" />
<!----------Testimonial end---->

<JS:Footer runat="server" ID="Footer" />

<script type="text/javascript">
    function hidespeciality(fsspeciality) {
        $('.doctorcontent').hide();
        $('#' + fsspeciality).show();
    }
</script>
