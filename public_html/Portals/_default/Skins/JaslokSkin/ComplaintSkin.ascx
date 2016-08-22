<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ComplaintSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_ComplaintSkin" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Home/WriteToUs.ascx" TagPrefix="JS" TagName="WriteToUs" %>
<%@ Register Src="~/JSControls/Home/PhotoGallery.ascx" TagPrefix="JS" TagName="PhotoGallery" %>
<%@ Register Src="~/JSControls/Home/VideoGallery.ascx" TagPrefix="JS" TagName="VideoGallery" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register Src="~/JSControls/Common/LeftNavigation.ascx" TagPrefix="JS" TagName="LeftNavigation" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>

<div id="contentpaneHeader" runat="server"></div>
<!-----header end->

 <!-- Carousel    ================================================== -->
<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right">--%>
<div class="row">
    <div class="container containerspace">
        <ul class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a id="rootbreadcrumb" runat="server" class="active" href="/patientfacilities"><span id="MainRoot" runat="server">Patients Care & Visitors</span></a></li>
            <li class="active" id="Subrootbreadcrumb" runat="server"><a id="SubRootAnchor" class="active" href="javascript:void(0);"><span id="SubRootSpan" runat="server">Complaint Form</span></a></li>
        </ul>
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part">
                <JS:LeftNavigation ID="leftNav" runat="server" />
                <div class="left_form hidden-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment2" />


                </div>
            </div>
        </div>

        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part">
                <div id="contentpane" runat="server"></div>
                <%--<h3 id="h3header" runat="server" class="desk">Complain <span class="desk1">Form</span></h3>--%>
                <h3 id="h3header" runat="server">Complaint Form</h3>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="search-form">
                    <p id="innerParagraph" runat="server"></p>
                </div>
              
                <asp:Panel ID="divcontentpane" runat="server">
                     <div id="fdback">The fields marked as * are mandatory</div></br>
                    <div class="form-horizontal">
                         
                       <%-- <div>
                            <asp:Label ID="lblMessage"  runat="server" />
                        </div>--%>
                        
                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12" for="Name">Name:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <%--  <input type="text" class="form-control" id="Name" placeholder="Name">--%>
                                <asp:TextBox ID="txtName" type="text" class="form-control" placeholder="Name" MaxLength="200" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvNm" ControlToValidate="txtName" ValidationGroup="vgSubmit" runat="server" ForeColor="Red" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator Display="Dynamic" ID="revnm" runat="server" ValidationGroup="vgSubmit" ControlToValidate="txtName" ValidationExpression="^(?!_  )[a-zA-Z_ ]*$" ForeColor="Red" ErrorMessage="Please Enter only alphabate"></asp:RegularExpressionValidator>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12" for="Email">Email Address:<span style="color: red">*</span></label>

                            <div class="col-xs-12 col-sm-9">
                                <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email Address" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ValidationGroup="vgSubmit" ForeColor="Red" ErrorMessage="Please Enter Email ID"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Email Address" ValidationGroup="vgSubmit" ControlToValidate="txtEmail" 
                                    ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12" for="phoneNumber">Complaint Details:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <asp:TextBox ID="txtComplaint" runat="server" placeholder="Complaint Details" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvQues" runat="server" ControlToValidate="txtComplaint" ValidationGroup="vgSubmit" ForeColor="Red" ErrorMessage="Please Enter FeedBack"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12" for="phoneNumber">Enter text:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <telerik:RadCaptcha ID="cptchComplaint" ForeColor="Red" EnableRefreshImage="true" ValidationGroup="vgSubmit" ErrorMessage="Enter valid captcha" runat="server"></telerik:RadCaptcha>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="col-xs-offset-0 col-sm-offset-3 col-xs-9">
                                <asp:LinkButton ID="btnSubmitComp" class="btn btn-primary" runat="server" ValidationGroup="vgSubmit" OnClick="btnSubmitComp_Click1">Submit</asp:LinkButton>
                                <asp:LinkButton ID="btnResetComp" class="btn btn-primary" runat="server" OnClick="btnResetComp_Click1">Reset</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </asp:Panel> 
                
                <asp:Panel ID="PanelMessage" runat="server" Visible="false">
                     <div class="form-horizontal">
                        <h3 style="color:green;text-align:center">We have received your complain !!!</h3>
                         </div>
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

<%--
<script type="text/javascript"> 
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
         else if (window.location.pathname.includes("/complaint")) {
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

     var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
         var keyCode = e.which ? e.which : e.keyCode
         var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
 } </script>
--%>