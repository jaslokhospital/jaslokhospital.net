<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DoctorOPDSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_DoctorOPDSkin" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagName="Testimonials" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>

<div id="contentpaneHeader" runat="server"></div>
<!-- header end -->
            
    <!-- Carousel -->
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
            <li class="active">Our Specialists</li>
        </ul>

        <div class="col-lg-4 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part" id="sidebar">
                <div id="nav-anchor"></div>
                <nav class="leftmenuweb leftmenuweb_scroll" style="position: relative;">
                    <ul class="opdlisting">
                        <asp:Repeater ID="rptDoctorNameSOPD" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a onclick='<%# string.Format("hidespeciality(\"{0}\")",Eval("DoctorId").ToString()) %>' href="#"><%# Eval("Name") %></a>
                                    <asp:HiddenField ID="hdnDoctorId" runat="server" Value='<%# Eval("DoctorId") %>' />

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
                <h3>Our Specialists</h3>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <asp:Repeater ID="rptDoctorMainOpd" OnItemDataBound="rptDoctorMainOpd_ItemDataBound" runat="server">
                    <ItemTemplate>
                        <div class="media doctorcontent leftmenuweb_scroll1" style="display: none;" id='<%# Eval("DoctorId")%>'>
                            <asp:HiddenField ID="hdnDoctorOPDId" runat="server" Value='<%# Eval("DoctorId") %>' />
                            <asp:Repeater ID="rptInnerDoctor" runat="server">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnDoctorId" runat="server" Value='<%# Eval("DoctorId") %>' />
                                   
                                    <div class="media-body col-sm-12 col-xs-12">
                                        <footer class="panel-footer">
                                            <i class="fa fa-user-md"></i><span style="padding-left: 3%;" class="s-bold"><%# Eval("Name") %></span><span class="s-regular"></span>
                                        </footer>
                                        <div class="opddoctors">


                                            <div class="panel-body">

                                                <%#string.IsNullOrEmpty(Convert.ToString(Eval("Designation")))?""+Eval("Designation"):"<p><b>Qualification & Experience</b></p><p>"+Eval("Designation")+"</p>" %>


                                                <div class="bs-example scopeofservices">
                                                    <div class="panel-group specialtyopddata">
                                                        <div id="divDescription" runat="server" visible='<%#!string.IsNullOrEmpty(Convert.ToString(Eval("Description")))?true:false%>'><%# Eval("Description") %></div>
                                                        <div id="divBriefWriteUp" runat="server" visible='<%#!string.IsNullOrEmpty(Convert.ToString(Eval("BriefWriteUp")))?true:false%>'><%# Eval("BriefWriteUp") %></div>
                                                        <div id="divAwards" runat="server" visible='<%#!string.IsNullOrEmpty(Convert.ToString(Eval("Awards")))?true:false%>'><%# Eval("Awards") %></div>
                                                    </div>
                                                </div>
                                            </div>


                                            <a data-parent="#media-accordion" target="_blank" style="margin-top: 5px;" href='<%#"/fix-appointment/"+CommonFn.RemoveSpecialCharacters(Convert.ToString(Eval("Name")))+"/"+(Eval("DoctorId"))%>' class="btn btn-orange">Fix an Appointment &gt;
                                            </a>

                                        </div>
                                    </div>
                                </ItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="Label1" runat="server" Text="No Doctors OPD Found." Font-Bold="true" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>'></asp:Label>
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


<!-- testimonail start -->
<JS:Testimonials runat="server" ID="Testimonials" />
<!-- Testimonial end -->

<JS:Footer runat="server" ID="Footer" />

<script type="text/javascript">
    function hidespeciality(fsspeciality) {
        $('.doctorcontent').hide();
        $('#' + fsspeciality).show();
    }
</script>
