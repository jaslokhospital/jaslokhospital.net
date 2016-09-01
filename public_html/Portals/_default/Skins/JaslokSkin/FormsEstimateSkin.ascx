<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FormsEstimateSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_FormsEstimateSkin" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Home/WriteToUs.ascx" TagPrefix="JS" TagName="WriteToUs" %>
<%@ Register Src="~/JSControls/Home/PhotoGallery.ascx" TagPrefix="JS" TagName="PhotoGallery" %>
<%@ Register Src="~/JSControls/Home/VideoGallery.ascx" TagPrefix="JS" TagName="VideoGallery" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/JSControls/Common/LeftNavigation.ascx" TagPrefix="JS" TagName="LeftNavigation" %>

<%--<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>

<div id="contentpaneHeader" runat="server"></div>
<!-- header end -->

 <!-- Carousel -->

<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right">--%>
<div class="row">
    <div class="container containerspace">
        <ul class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a id="rootbreadcrumb" runat="server" class="active" href="/patientfacilities"><span id="MainRoot" runat="server">Patients Care & Visitors</span></a></li>
            <li class="active" id="Subrootbreadcrumb" runat="server"><a id="SubRootAnchor" class="active" href="javascript:void(0);"><span id="SubRootSpan" runat="server"> Estimate request</span></a></li>
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
              <%--  <div id="" runat="server" visible="false"></div>--%>
                <h3 id="h3header" runat="server"></h3>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="search-form">
                    <p id="contentpane" runat="server"></p>
                </div>
                
                <asp:Panel ID="divcontentpane" runat="server">
                     <div id="fdback">The fields marked as * are mandatory</div><br/>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12">Name:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <asp:TextBox ID="txtName" type="text" class="form-control" MaxLength="200" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtName" runat="server" ForeColor="Red" ErrorMessage="Please Enter Name" ValidationGroup="EstimatForm"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="txtName" ValidationExpression="^(?!_  )[a-zA-Z_ ]*$" ValidationGroup="EstimatForm" ForeColor="Red" ErrorMessage="Please Enter only alphabate"></asp:RegularExpressionValidator>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12">Age:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <asp:TextBox ID="txtAge" type="text" class="form-control" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return false;" MaxLength="2" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" ControlToValidate="txtAge" runat="server" ForeColor="Red" ErrorMessage="Please Enter Age" ValidationGroup="EstimatForm"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12">Gender:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                            <asp:RadioButtonList ID="rdoGenderCom" runat="server"  RepeatDirection="Horizontal" >
                                <asp:ListItem class="col-xs-2 radio-inline" Text="Male" Value="Male" Selected="True"></asp:ListItem>
                                <asp:ListItem class="col-xs-2 radio-inline" Text="Female" Value="Female"></asp:ListItem>
                            </asp:RadioButtonList>
                                </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12">Email Address:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Please Enter Email ID" ValidationGroup="EstimatForm"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="EstimatForm" ControlToValidate="txtEmail" CssClass="requiredFieldValidateStyle"
                                    ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12">Mobile Number:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <asp:TextBox ID="txtMobile" runat="server" class="form-control" onkeypress="return Numeric(event);" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ControlToValidate="txtMobile" ForeColor="Red" ValidationGroup="EstimatForm" ErrorMessage="Please Enter Mobile"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12">Which Health Check Up would you opt for:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <asp:TextBox ID="txtWhichHealth" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ControlToValidate="txtWhichHealth" ValidationGroup="EstimatForm" ForeColor="Red" ErrorMessage="Please Enter your comment"></asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12">Number of Individuals for which package is required:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <asp:TextBox ID="txtNumberofPackage" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ControlToValidate="txtNumberofPackage" ValidationGroup="EstimatForm" ForeColor="Red" ErrorMessage="Please Enter your comment"></asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12">1st Preferred day of Health Check appointment:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <asp:TextBox ID="txt1stPreffed" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ControlToValidate="txt1stPreffed" ValidationGroup="EstimatForm" ForeColor="Red" ErrorMessage="Please Enter your comment"></asp:RequiredFieldValidator>

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12">Comments:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <asp:TextBox ID="txtComment" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic" ControlToValidate="txtComment" ValidationGroup="EstimatForm" ForeColor="Red" ErrorMessage="Please Enter comment"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                       <div class="form-group">
                            <label class="control-label col-sm-3 col-xs-12">Enter text:<span style="color: red">*</span></label>
                            <div class="col-xs-12 col-sm-9">
                                <telerik:RadCaptcha ID="cptchEstimate" ForeColor="Red" EnableRefreshImage="true" ValidationGroup="EstimatForm" ErrorMessage="Enter valid captcha" runat="server"></telerik:RadCaptcha>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <div class="col-xs-offset-0 col-sm-offset-3 col-xs-9">
                                <asp:Button ID="btnSubmitEstimateS" runat="server" class="btn btn-primary" Text="Submit" ValidationGroup="EstimatForm" OnClick="btnSubmitEstimateS_Click" />
                                <asp:Button ID="btnResetEstimateS" runat="server" class="btn btn-primary" Text="Reset" OnClick="btnResetEstimateS_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                 <%--<asp:Panel ID="PanelMessage" runat="server" Visible="false">
                     <div class="form-horizontal">
                        <h3 style="color:green;text-align:center">Thank you for your request, you should receive a reply or a call shortly!!!</h3>
                         </div>
                    </asp:Panel>--%>


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
<script type="text/javascript"> var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
     var keyCode = e.which ? e.which : e.keyCode
     var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
 }

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
</script>
--%>