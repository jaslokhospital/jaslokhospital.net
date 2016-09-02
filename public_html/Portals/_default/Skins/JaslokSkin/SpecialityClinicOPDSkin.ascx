<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SpecialityClinicOPDSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_SpecialityClinicOPDSkin" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagName="Testimonials" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>

<style type="text/css">
    .bjqs-markers {
        display: none;
    }

    #certification-banner-slider {
        margin-left: 16.6667%;
    }
</style>

<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/bjqs-1.3.js"></script>
<link rel="stylesheet" href="/Portals/_default/Skins/JaslokSkin/Styles/css/bjqs.css" />


<div id="contentpaneHeader" runat="server"></div>
<!-----header end->
            
    <!-- Carousel    ================================================== -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

            <asp:Image ID="imgbanner" alt="Cardiology" class="img-div img-responsive" runat="server" />
        </div>
    </div>
</div>
<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right hidden-xs">--%>

<div class="row">
    <div class="container containerspace ">
        <div class="col-lg-4 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part" id="sidebar">
                <div id="nav-anchor"></div>
                <nav style="position: relative; z-index: 0;" class="leftmenuweb">
                    <ul class="opdlisting">
                        <asp:Repeater ID="rptSpeciality" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a onclick='<%# string.Format("hidespeciality(\"{0}\")",CommonFn.RemoveBadCharForFolder(Eval("SpecialityClinicOPD").ToString())) %>' href="#"><%# Eval("SpecialityClinicOPD") %></a>
                                    <asp:HiddenField ID="hdnSpecialityClinicOPDId" runat="server" Value='<%# Eval("SpecialityClinicId") %>' />
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </nav>

            </div>
        </div>
        <div class="col-lg-8 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part specialitywiseOPD" id="content">
                <h1 class="desk">Speciality  <span class="desk1">Clinics OPD</span></h1>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <asp:Repeater ID="rptRightSpecialityClinic" OnItemDataBound="rptRightSpecialityClinic_ItemDataBound" runat="server">
                    <ItemTemplate>
                        <div class="media doctorcontent" style="display:none;" id='<%# CommonFn.RemoveBadCharForFolder(Eval("SpecialityClinicOPD").ToString()) %>'>
                            <asp:HiddenField ID="hdnSpecialityClinicOPDId" runat="server" Value='<%# Eval("SpecialityClinicId") %>' />
                            <asp:Repeater ID="rptInnerDoctor" OnItemDataBound="rptInnerDoctor_ItemDataBound" runat="server">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnDoctorId" runat="server" Value='<%# Eval("DoctorId") %>' />
                                    <div class="media-body col-sm-12 col-xs-12">
                                        <footer class="panel-footer">
                                            <i class="fa fa-user-md"></i><span style="padding-left:3%;" class="s-bold"><%# Eval("DoctorName") %></span><span class="s-regular"><%# Eval("SpecialityClinicOPD") %></span>
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
                                            <a data-parent="#media-accordion" style="margin-top: 5px;" href='<%# "fix-an-appointment/di/"+Eval("DoctorId").ToString() %>' aria-expanded="true" aria-controls="collapseOne" class="btn btn-orange">Fix an Appointment &gt;
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
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
        <div id="contentpane" class="inner-content" runat="server">
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

