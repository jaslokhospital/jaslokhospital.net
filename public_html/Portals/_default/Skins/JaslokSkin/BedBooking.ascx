<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BedBooking.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_BedBooking"%>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Home/WriteToUs.ascx" TagPrefix="JS" TagName="WriteToUs" %>
<%@ Register Src="~/JSControls/Home/PhotoGallery.ascx" TagPrefix="JS" TagName="PhotoGallery" %>
<%@ Register Src="~/JSControls/Home/VideoGallery.ascx" TagPrefix="JS" TagName="VideoGallery" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<script type="text/javascript">
    //function SetCategory() {
    //}

    function SetUniqueRadioButton(nameregex, current) {
        re = new RegExp(nameregex);
        //var id = $('#dnn_rptBedReservation_hdnDeposit_0').val();
        //alert(id);
        for (i = 0; i < document.forms[0].elements.length; i++) {
            elm = document.forms[0].elements[i]
            if (elm.type == 'radio') {
                if (re.test(elm.name)) {
                    elm.checked = false;
                }
            }
        }
        current.checked = true;
        var id = current.attributes.id.nodeValue;
        var price = $('#' + id).val();
        $('#dnn_txtAdmissionCharge').val(price);
    }

</script>


<div id="contentpaneHeader" runat="server"></div>
<!-- header end -->

 <!-- Carousel -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="item active">
                <asp:Image ID="imgbanner" ImageUrl="/Content/Banner/opd-web-banner-150216-20160215114721383.jpg" alt="Bed booking" runat="server" CssClass="img-div" />
            </div>
        </div>
    </div>
</div>
<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right">--%>
<div class="row">
    
  
    <div  class="container">
         <ul class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a id="rootbreadcrumb" runat="server" class="active" href="/patientfacilities"><span id="MainRoot" runat="server">Patients Care & Visitors</span></a></li>
            <li class="active" id="Subrootbreadcrumb" runat="server"><a id="SubRootAnchor" class="active" href="javascript:void(0);"><span id="SubRootSpan" runat="server"> Bed Reservation</span></a></li>
        </ul>
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part">
                <%--  <JS:LeftNavigation ID="leftNav" runat="server" />--%>
                <div class="left_form hidden-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment" />
                </div>
            </div>
        </div>
       

        <div class="media-body col-sm-9 col-xs-12" style="display: none;">
            <div class="form-horizontal">
                <footer class="panel-footer">
                    <i class="fa fa-user-md"></i>
                    <asp:Label class="fa fa-user-md s-bold" ID="lblDoctorName" runat="server"></asp:Label>
                    <asp:Label class="s-regular" ID="lblDocotrSpecialty" runat="server"></asp:Label>

                </footer>
                <div class="panel-body" id="DoctorDetails">
                    <p id="divDesignation" runat="server"></p>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <label>Time Shcedule    : </label>
                        <br />
                        <asp:Repeater ID="rpttimeShedule2" runat="server">

                            <ItemTemplate>
                                Day:-
                                        <p><%#Eval("Day") %></p>
                                Time:-
                                        <p><%#Eval("Time") %></p>
                                Room:-   
                                        <p><%#Eval("Room") %></p>

                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <label>Email    : </label>
                        <asp:Label ID="lblDEmail" runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <label>Mobile   : </label>
                        <asp:Label ID="lblDMobile" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                </div>
            </div>
            <br>
        </div>
             
        <div id="ContentPane" runat="server"></div>
       
   
                 <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <asp:PlaceHolder ID="placeRightPart" runat="server">
                 <div id="divContent" runat="server">

                <div class="right_part bedBooking">
                    <h3 id="dnn_h3header">Bed Reservation</h3>
                    <div class="border-3"></div>
                    <div class="border-3"></div>
                    <div class="border-3"></div>
                    <asp:Repeater ID="rptBedReservation" runat="server" OnItemDataBound="rptBedReservation_ItemDataBound">
                        <ItemTemplate>
                            <div class="col-md-4 col-sm-4 col-xs-12 js-zero-padding bed-reservation">
                                <div class='<%# String.Format("appreciation_title_grey {0}", ((Container.ItemIndex + 1) % 3 != 0)? "":"app_ttl_none") %>'>
                                    <%-- <asp:Label ID="lblBedType" runat="server" Text='<%#Eval("Room")%>' Style="text-align: center"></asp:Label>--%>
                                    <span style="color: 8a8b8a;"><%#Eval("Room")%></span><br>
                                    <img src='<%#"content/photogallery/"+Eval("Images")%>' alt="<%#Eval("Room")%>" class="bed-res-img"> <br>
                                    <div id="Div1" class="clearfix" runat="server" visible='<%#(Container.ItemIndex+1%3==0)?true:false %>'></div>
                                   <%-- <br>
                                    <asp:RadioButton ID="rdbPrice" GroupName="rdb" title='<%# DataBinder.Eval(Container.DataItem, "Room")%>' runat="server" CssClass="a_idc lable_box" Text='<%# "Price: ₹   "+ DataBinder.Eval(Container.DataItem,"Terrif") %>' value='<%# DataBinder.Eval(Container.DataItem, "Admission")%>'
                                        ToolTip='<%# DataBinder.Eval(Container.DataItem, "Room")%>' />--%>


                                     <label class="a_idc" for='rTechnicalSupport<%# Container.ItemIndex %>'>
                                        <input type="radio" id='rTechnicalSupport<%# Container.ItemIndex %>' data-index='<%# Container.ItemIndex %>' aria-valuetext="<%#Eval("Admission") %>" title="<%#Eval("Room") %>" name="quality" value='rTechnicalSupport<%# Container.ItemIndex %>'>
                                        <span class="lable_box"> </span>
                                    </label>
                                     <br>
                                 <span style="color:00bcd5; visibility:hidden" id='spanPrice<%# Container.ItemIndex %>'>Price: &#8377; <%#Eval("Admission") %> </span>


                                   
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:HiddenField ID="hdnDepositBB" runat="server" />






                    <div class="col-md-12 col-sm-12 col-xs-12 js-each-boxes">
                        <div class="col-md-4 col-sm-6 col-lg-4 col-xs-12 js-right-line js-right-spacing">
                            <%--<select class="form-control appoint_form" id="" name="dnn$LeftPaneBookAppointment1$ddlSpecialtyLPB">
                        <option value="0" selected="selected">Search by Doctor</option>
                        <option value="45">Accupressure</option>
                    </select>--%>
                            <asp:Label runat="server" ID="lbldoctor" Text="Doctors"></asp:Label>
                            <asp:DropDownList runat="server" ID="ddlDoctorbedbook" EnableViewState="true"  class="form-control doctorDropdown">
                            </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="rfvDoctor" runat="server" CssClass="errormsg" ErrorMessage="Please select Doctor" ControlToValidate="ddlDoctorbedbook" InitialValue="0" Display="Dynamic" ValidationGroup="BedBook" ForeColor="Red"></asp:RequiredFieldValidator><br />
              
                        </div>
                        <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12 js-right-line js-right-spacing bedreservation">
                            <asp:Label runat="server" ID="lblEnterdatetime" Text="Enter date time"></asp:Label>
                            <telerik:RadDateTimePicker ID="txtdatetime" DateInput-CssClass="riEmpty form-control" Style="height: 34px !important;" Width="100%" DateInput-EmptyMessageStyle-Font-Names="Roboto" runat="server"></telerik:RadDateTimePicker>
                            <asp:RequiredFieldValidator ID="rfvDate" runat="server" CssClass="errormsg" ErrorMessage="Please select Date" ControlToValidate="txtdatetime" Display="Dynamic" ValidationGroup="BedBook" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            <%-- <input type="text" value="Enter Date & time" class="riEmpty form-control" name="" id="Text1"> 
                    <span class="js-add-on"> <i class="fa fa-calendar" aria-hidden="true"></i></span>
                    <span class="js-add-on-clock"> <i class="fa fa-clock-o fa-lg" aria-hidden="true"></i></span>--%>
                        </div>


                        <div class="col-md-4 col-sm-12 col-xs-12">
                            <asp:Label runat="server" ID="lblDeposite" Text="Deposit Amount"></asp:Label>
                            <asp:TextBox ID="txtAdmissionCharge" type="text" class="riEmpty form-control" onkeypress="return Numeric(event);" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 js-zero-padding">

                        <div class="form-group write-each">
                            <%-- <a onclick="" id="A1" class="btn js-btn-primary3 pull-right">Submit</a>--%>
                            <asp:LinkButton ID="btnSubmit" class="btn js-btn-primary3 pull-right" runat="server" ValidationGroup="BedBook" OnClientClick="return validateBEDB()" OnClick="btnSubmit_Click">Submit</asp:LinkButton>

                        </div>
                    </div>

                </div>

                </div>
            </asp:PlaceHolder>



            <div class="left_form hidden-lg visible-xs">
                <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />
            </div>
        </div>
            
      
       
        
        
        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12 left_part">
         <asp:PlaceHolder ID="plcDivError" runat="server" Visible="false">                
                <div class="alert alert-danger">
                    <img src="/content/photogallery/cancel_24.png" width="24" height="24" class="img_check">
                    <strong>You are not Authorized to access this page!</strong>
                </div>

            </asp:PlaceHolder>
        </div>
    </div>
</div>
<JS:Testimonials runat="server" ID="Testimonials" />
<JS:Footer runat="server" ID="Footer" />

<%--<script type="text/javascript">
    var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
        var keyCode = e.which ? e.which : e.keyCode
        var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
    }

    function setRadioButtonBEDB(value, amount) {
        var radID = value.split(',');
        $('#dnn_txtAdmissionCharge').val(amount);
        $('#' + radID[0]).attr('checked', true);
    }

    $(".bed-reservation input[type='radio']").on("change", function () {

        $("[id^=spanPrice]").css("visibility", "hidden");
        $("#spanPrice" + $(this).attr("data-index")).css("visibility", "visible");

        $("#<=txtAdmissionCharge.ClientID%>").val($(this).attr("aria-valuetext"));
        //alert($('#dnn_txtAdmissionCharge').val());

        $("#<=hdnDeposit.ClientID%>").val($(this).attr("id") + "," + $(this).attr("title"));
        
    });
    function validateBEDB() {
        if ($('#dnn_txtAdmissionCharge').val() == null || $('#dnn_txtAdmissionCharge').val() == "") {
            alert("Please select bed reservation type first");
            return false;
        }
        if ($('#dnn_txtAdmissionCharge').val() < 10000) {
            alert('Minimum amount should be  10,000 ₹')
            return false;
        }

    }

    function showPopupWindow() {
        $("#myModal").modal();
        $("#dnn_Header_litPopUpTitle").html("Login");
        $("#dnn_Header_divLoginForm").show();
        $("#dnn_Header_divForgotPassword").hide();
        $("#dnn_Header_divOTPVerification").hide();
        $("#dnn_Header_divSignUp").hide();
        $("#dnn_Header_lblError").empty();

        $("#dnn_Header_pSignUp").show();
        $("#dnn_Header_pForgotPassWord").show();
        $("#dnn_Header_pSignIn").hide();
        $("#dnn_Header_pVerifyUser").show();

    }
</script>--%>

