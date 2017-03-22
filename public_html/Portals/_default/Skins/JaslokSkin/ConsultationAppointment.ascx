<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ConsultationAppointment.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_ConsultationAppointment" %>
<%@ Register Src="~/JSControls/Common/Header.ascx" TagPrefix="JS" TagName="Header" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Home/WriteToUs.ascx" TagPrefix="JS" TagName="WriteToUs" %>
<%@ Register Src="~/JSControls/Home/PhotoGallery.ascx" TagPrefix="JS" TagName="PhotoGallery" %>
<%@ Register Src="~/JSControls/Home/VideoGallery.ascx" TagPrefix="JS" TagName="VideoGallery" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Src="~/JSControls/Common/LeftNavigation.ascx" TagPrefix="JS" TagName="LeftNavigation" %>--%>



<script type="text/javascript">
    Telerik.Web.UI.RadDatePicker.prototype._actionBeforeShowPopup_original = Telerik.Web.UI.RadDatePicker.prototype._actionBeforeShowPopup;
    Telerik.Web.UI.RadDatePicker.prototype._actionBeforeShowPopup = function () {
        this._actionBeforeShowPopup_original();
        if (Telerik.Web.UI.RadDateTimePicker) {
            Telerik.Web.UI.RadDateTimePicker.prototype._hideAllTimePopups();
        }
    }

    /*function GetSelectedTextValue(drpAppointmentType) {
        var selectedText = drpAppointmentType.options[drpAppointmentType.selectedIndex].innerHTML;
        if (selectedText == "Follow-Up") {

            var id = document.getElementById('<= hdnfollowup.ClientID %>').value;

            if (id != "") {
                divAppointmentType.style.display = 'block';
            }

        }

        else if (selectedText == "New") {
            var id = document.getElementById('<= hdnconsulting.ClientID %>').value;
            if (id != "") {
                divAppointmentType.style.display = 'block';

            }
        }

        else {
            divAppointmentType.style.display = 'none';
        }

        $('#<= lblAppointmentType.ClientID %>').html(id);

    }*/
   



   /* function CitrusSubmit() {
       var myForm = document.getElementById("Form");
       console.log(myForm);
       myForm.action = 'https://sandbox.citruspay.com/sslperf/jaslokhospital';
       //myForm.method = "POST";
       myForm.submit();
    }
     CitrusSubmit();*/
</script>
<style>
    .rbl {
        font-size: 14px;
    }

        .rbl input[type="radio"] {
            margin-left: 5px;
            margin-right: 3px;
        }

    .errormsg {
        color: red;
        font-size: 11px;
        font-weight: bold;
    }
</style>

<div id="contentpaneHeader" runat="server"></div>
<!-----header end->

 <!-- Carousel    ================================================== -->

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="item active">
                <asp:Image ID="imgbanner" ImageUrl="/Content/Banner/opd-web-banner-150216-20160215114721383.jpg" runat="server" CssClass="img-div" />
            </div>
        </div>
    </div>
</div>
<%-- <div>
  <input type="hidden" id="merchantTxnId" name="merchantTxnId" value="<%=merchantTxnId%>" />
    <input type="hidden" id="orderAmount" name="orderAmount" value="<%=orderAmount%>" />
    <input type="hidden" id="currency" name="currency" value="<%=currency%>" />
    <input type="hidden" name="returnUrl" value="<%= returnUrl %>" />
    <input type="hidden" id="notifyUrl" name="notifyUrl" value="<%= returnUrl %>" />
    <input type="hidden" id="secSignature" name="secSignature" value="<%=securitySignature%>" />

</div>--%>
<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right">--%>
<div class="row">
    <div class="container">
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
          <div id="contentpane" runat="server"></div>
        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <asp:PlaceHolder ID="placeRightPart" runat="server">
                <div class="right_part">
                    <h1>Consultation Appointment</h1>
                    <div class="border-3"></div>
                    <div class="border-3"></div>
                    <div class="border-3"></div>

                    <div id="divDoctorInfo" runat="server" enableviewstate="true">
                        <p class="doctorname">
                            <asp:Literal ID="litDoctormname" runat="server"></asp:Literal>
                        </p>
                        <p>
                            Please fill the below form carefully to fix your appointment, appointment confirmation will be done via call, email or SMS.
                        </p>

                        <p><strong>Appointment Schedule</strong></p>
                        <asp:HiddenField ID="hdnDoctorId" runat="server" />
                        <%--<form method="post" action="&lt;?php echo $base_url; ?&gt;user/register/check" class="form-horizontal" accept-charset="UTF-8">--%>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-3 col-xs-3" for="Name">Name:<span style="color: red">*</span></label>
                                <div class="col-xs-12 col-sm-9 col-xs-8">
                                    <asp:TextBox ID="txtName" type="text" class="form-control" MaxLength="100" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvNm" CssClass="errormsg" ControlToValidate="txtName" runat="server" ForeColor="Red" ValidationGroup="CA" Display="Dynamic" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revnm" runat="server" CssClass="errormsg" ControlToValidate="txtName" ValidationExpression="[a-zA-Z' ']+" ForeColor="Red" Display="Dynamic" ValidationGroup="CA" ErrorMessage="Please Enter only alphabate"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3 col-xs-3" for="txtdob">Date of Birth:<span style="color: red">*</span></label>
                                <div class="col-xs-12 col-sm-9 col-xs-8 cal-text">
                                    <telerik:RadDateTimePicker MinDate="1/1/1900" ID="txtdob" DateInput-ReadOnly="true" DateInput-DateFormat="dd/MM/yyyy" runat="server" TimePopupButton-Visible="false" Width="200px"></telerik:RadDateTimePicker>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="errormsg" ControlToValidate="txtdob" runat="server" ForeColor="Red" Display="Dynamic" ValidationGroup="CA" ErrorMessage="<br />Please Enter Date of Birth"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3 col-xs-3" for="txtEmail">Email:<span style="color: red">*</span></label>

                                <div class="col-xs-12 col-sm-9 col-xs-8">
                                    <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" CssClass="errormsg" ValidationGroup="CA" ForeColor="Red" ErrorMessage="Please Enter Email ID" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="errormsg" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="CA" Display="Dynamic" ControlToValidate="txtEmail"
                                        ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3 col-xs-3" for="txtPhoneNo">Phone No:</label>

                                <div class="col-xs-12 col-sm-9 col-xs-8">
                                    <asp:TextBox ID="txtPhoneNo" class="form-control" runat="server" onkeypress="return Numeric(event);" MaxLength="15" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                    
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtPhoneNo" runat="server" ForeColor="Red" ValidationGroup="CA" ErrorMessage="Please Enter phone Number"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3 col-xs-3" for="txtMobileNo">Mobile No:<span style="color: red">*</span></label>

                                <div class="col-xs-12 col-sm-9 col-xs-8">
                                    <asp:TextBox ID="txtMobileNo" runat="server" class="form-control" onkeypress="return Numeric(event);" MaxLength="10" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="errormsg" ControlToValidate="txtMobileNo" Display="Dynamic" runat="server" ForeColor="Red" ValidationGroup="CA" ErrorMessage="Please Enter Mobile Number"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" CssClass="errormsg" runat="server" ControlToValidate="txtMobileNo" Display="Dynamic" ErrorMessage="Enter 10 digit number" ValidationGroup="CA" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3 col-xs-3" for="ddlCountry">Country:<span style="color: red">*</span></label>

                                <div class="col-xs-12 col-sm-9 col-xs-8">
                                    <asp:DropDownList ID="ddlCountry" class="form-control" runat="server">
                                        <asp:ListItem Value="0" Text="-- Select Country --"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Afghanistan"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Albania"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="Algeria"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="American Samoa"></asp:ListItem>
                                        <asp:ListItem Value="5" Text="Andorra"></asp:ListItem>
                                        <asp:ListItem Value="6" Text="Angola"></asp:ListItem>
                                        <asp:ListItem Value="7" Text="Anguilla"></asp:ListItem>
                                        <asp:ListItem Value="8" Text="Antarctica"></asp:ListItem>
                                        <asp:ListItem Value="9" Text="Antigua and Barbuda"></asp:ListItem>
                                        <asp:ListItem Value="10" Text="Argentina"></asp:ListItem>
                                        <asp:ListItem Value="11" Text="Armenia"></asp:ListItem>
                                        <asp:ListItem Value="12" Text="Aruba"></asp:ListItem>
                                        <asp:ListItem Value="13" Text="Australia"></asp:ListItem>
                                        <asp:ListItem Value="14" Text="Austria"></asp:ListItem>
                                        <asp:ListItem Value="15" Text="Azerbaijan"></asp:ListItem>
                                        <asp:ListItem Value="16" Text="Bahamas"></asp:ListItem>
                                        <asp:ListItem Value="17" Text="Bahrain"></asp:ListItem>
                                        <asp:ListItem Value="18" Text="Bangladesh"></asp:ListItem>
                                        <asp:ListItem Value="19" Text="Barbados"></asp:ListItem>
                                        <asp:ListItem Value="20" Text="Belarus"></asp:ListItem>
                                        <asp:ListItem Value="21" Text="Belgium"></asp:ListItem>
                                        <asp:ListItem Value="22" Text="Belize"></asp:ListItem>
                                        <asp:ListItem Value="23" Text="Benin"></asp:ListItem>
                                        <asp:ListItem Value="24" Text="Bermuda"></asp:ListItem>
                                        <asp:ListItem Value="25" Text="Bhutan"></asp:ListItem>
                                        <asp:ListItem Value="26" Text="Bolivia"></asp:ListItem>
                                        <asp:ListItem Value="27" Text="Bosnia and Herzegowina"></asp:ListItem>
                                        <asp:ListItem Value="28" Text="Botswana"></asp:ListItem>
                                        <asp:ListItem Value="29" Text="Bouvet Island"></asp:ListItem>
                                        <asp:ListItem Value="30" Text="Brazil"></asp:ListItem>
                                        <asp:ListItem Value="31" Text="British Indian Ocean Territory"></asp:ListItem>
                                        <asp:ListItem Value="32" Text="Brunei Darussalam"></asp:ListItem>
                                        <asp:ListItem Value="33" Text="Bulgaria"></asp:ListItem>
                                        <asp:ListItem Value="34" Text="Burkina Faso"></asp:ListItem>
                                        <asp:ListItem Value="35" Text="Burundi"></asp:ListItem>
                                        <asp:ListItem Value="36" Text="Cambodia"></asp:ListItem>
                                        <asp:ListItem Value="37" Text="Cameroon"></asp:ListItem>
                                        <asp:ListItem Value="38" Text="Canada"></asp:ListItem>
                                        <asp:ListItem Value="39" Text="Cape Verde"></asp:ListItem>
                                        <asp:ListItem Value="40" Text="Cayman Islands"></asp:ListItem>
                                        <asp:ListItem Value="41" Text="Central African Republic"></asp:ListItem>
                                        <asp:ListItem Value="42" Text="Chad"></asp:ListItem>
                                        <asp:ListItem Value="43" Text="Chile"></asp:ListItem>
                                        <asp:ListItem Value="44" Text="China"></asp:ListItem>
                                        <asp:ListItem Value="45" Text="Christmas Island"></asp:ListItem>
                                        <asp:ListItem Value="46" Text="Cocos (Keeling) Islands"></asp:ListItem>
                                        <asp:ListItem Value="47" Text="Colombia"></asp:ListItem>
                                        <asp:ListItem Value="48" Text="Comoros"></asp:ListItem>
                                        <asp:ListItem Value="49" Text="Congo"></asp:ListItem>
                                        <asp:ListItem Value="50" Text="Cook Islands"></asp:ListItem>
                                        <asp:ListItem Value="51" Text="Costa Rica"></asp:ListItem>
                                        <asp:ListItem Value="52" Text="Cote DIvoire"></asp:ListItem>
                                        <asp:ListItem Value="53" Text="Croatia"></asp:ListItem>
                                        <asp:ListItem Value="54" Text="Cuba"></asp:ListItem>
                                        <asp:ListItem Value="55" Text="Cyprus"></asp:ListItem>
                                        <asp:ListItem Value="56" Text="Czech Republic"></asp:ListItem>
                                        <asp:ListItem Value="57" Text="D.P.R. Korea"></asp:ListItem>
                                        <asp:ListItem Value="58" Text="Denmark"></asp:ListItem>
                                        <asp:ListItem Value="59" Text="Djibouti"></asp:ListItem>
                                        <asp:ListItem Value="60" Text="Dominica"></asp:ListItem>
                                        <asp:ListItem Value="61" Text="Dominican Republic"></asp:ListItem>
                                        <asp:ListItem Value="62" Text="East Timor"></asp:ListItem>
                                        <asp:ListItem Value="63" Text="Ecuador"></asp:ListItem>
                                        <asp:ListItem Value="64" Text="Egypt"></asp:ListItem>
                                        <asp:ListItem Value="65" Text="El Salvador"></asp:ListItem>
                                        <asp:ListItem Value="66" Text="Equatorial Guinea"></asp:ListItem>
                                        <asp:ListItem Value="67" Text="Eritrea"></asp:ListItem>
                                        <asp:ListItem Value="68" Text="Estonia"></asp:ListItem>
                                        <asp:ListItem Value="69" Text="Ethiopia"></asp:ListItem>
                                        <asp:ListItem Value="70" Text="Falkland Islands"></asp:ListItem>
                                        <asp:ListItem Value="71" Text="Faroe Islands"></asp:ListItem>
                                        <asp:ListItem Value="72" Text="Fiji"></asp:ListItem>
                                        <asp:ListItem Value="73" Text="Finland"></asp:ListItem>
                                        <asp:ListItem Value="74" Text="France"></asp:ListItem>
                                        <asp:ListItem Value="75" Text="France, Metropolitan"></asp:ListItem>
                                        <asp:ListItem Value="76" Text="French Guiana"></asp:ListItem>
                                        <asp:ListItem Value="77" Text="French Polynesia"></asp:ListItem>
                                        <asp:ListItem Value="78" Text="French Southern Territories"></asp:ListItem>
                                        <asp:ListItem Value="79" Text="Gabon"></asp:ListItem>
                                        <asp:ListItem Value="80" Text="Gambia"></asp:ListItem>
                                        <asp:ListItem Value="81" Text="Georgia"></asp:ListItem>
                                        <asp:ListItem Value="82" Text="Germany"></asp:ListItem>
                                        <asp:ListItem Value="83" Text="Ghana"></asp:ListItem>
                                        <asp:ListItem Value="84" Text="Gibraltar"></asp:ListItem>
                                        <asp:ListItem Value="85" Text="Greece"></asp:ListItem>
                                        <asp:ListItem Value="86" Text="Greenland"></asp:ListItem>
                                        <asp:ListItem Value="87" Text="Grenada"></asp:ListItem>
                                        <asp:ListItem Value="88" Text="Guadeloupe"></asp:ListItem>
                                        <asp:ListItem Value="89" Text="Guam"></asp:ListItem>
                                        <asp:ListItem Value="90" Text="Guatemala"></asp:ListItem>
                                        <asp:ListItem Value="91" Text="Guinea"></asp:ListItem>
                                        <asp:ListItem Value="92" Text="Guinea-Bissau"></asp:ListItem>
                                        <asp:ListItem Value="93" Text="Guyana"></asp:ListItem>
                                        <asp:ListItem Value="94" Text="Haiti"></asp:ListItem>
                                        <asp:ListItem Value="95" Text="Heard and McDonald Islands"></asp:ListItem>
                                        <asp:ListItem Value="96" Text="Honduras"></asp:ListItem>
                                        <asp:ListItem Value="97" Text="Hong Kong SAR, PRC"></asp:ListItem>
                                        <asp:ListItem Value="98" Text="Hungary"></asp:ListItem>
                                        <asp:ListItem Value="99" Text="Iceland"></asp:ListItem>
                                        <asp:ListItem Value="100" Text="India"></asp:ListItem>
                                        <asp:ListItem Value="101" Text="Indonesia"></asp:ListItem>
                                        <asp:ListItem Value="102" Text="Iran"></asp:ListItem>
                                        <asp:ListItem Value="103" Text="Iraq"></asp:ListItem>
                                        <asp:ListItem Value="104" Text="Ireland"></asp:ListItem>
                                        <asp:ListItem Value="105" Text="Israel"></asp:ListItem>
                                        <asp:ListItem Value="106" Text="Italy"></asp:ListItem>
                                        <asp:ListItem Value="107" Text="Jamaica"></asp:ListItem>
                                        <asp:ListItem Value="108" Text="Japan"></asp:ListItem>
                                        <asp:ListItem Value="109" Text="Jordan"></asp:ListItem>
                                        <asp:ListItem Value="110" Text="Kazakhstan"></asp:ListItem>
                                        <asp:ListItem Value="111" Text="Kenya"></asp:ListItem>
                                        <asp:ListItem Value="112" Text="Kiribati"></asp:ListItem>
                                        <asp:ListItem Value="113" Text="Korea"></asp:ListItem>
                                        <asp:ListItem Value="114" Text="Kuwait"></asp:ListItem>
                                        <asp:ListItem Value="115" Text="Kyrgyzstan"></asp:ListItem>
                                        <asp:ListItem Value="116" Text="Lao Peoples Republic"></asp:ListItem>
                                        <asp:ListItem Value="117" Text="Latvia"></asp:ListItem>
                                        <asp:ListItem Value="118" Text="Lebanon"></asp:ListItem>
                                        <asp:ListItem Value="119" Text="Lesotho"></asp:ListItem>
                                        <asp:ListItem Value="120" Text="Liberia"></asp:ListItem>
                                        <asp:ListItem Value="121" Text="Libyan Arab Jamahiriya"></asp:ListItem>
                                        <asp:ListItem Value="122" Text="Liechtenstein"></asp:ListItem>
                                        <asp:ListItem Value="123" Text="Lithuania"></asp:ListItem>
                                        <asp:ListItem Value="124" Text="Luxembourg"></asp:ListItem>
                                        <asp:ListItem Value="125" Text="Macau"></asp:ListItem>
                                        <asp:ListItem Value="126" Text="Macedonia"></asp:ListItem>
                                        <asp:ListItem Value="127" Text="Madagascar"></asp:ListItem>
                                        <asp:ListItem Value="128" Text="Malawi"></asp:ListItem>
                                        <asp:ListItem Value="129" Text="Malaysia"></asp:ListItem>
                                        <asp:ListItem Value="130" Text="Maldives"></asp:ListItem>
                                        <asp:ListItem Value="131" Text="Mali"></asp:ListItem>
                                        <asp:ListItem Value="132" Text="Malta"></asp:ListItem>
                                        <asp:ListItem Value="133" Text="Marshall Islands"></asp:ListItem>
                                        <asp:ListItem Value="134" Text="Martinique"></asp:ListItem>
                                        <asp:ListItem Value="135" Text="Mauritania"></asp:ListItem>
                                        <asp:ListItem Value="136" Text="Mauritius"></asp:ListItem>
                                        <asp:ListItem Value="137" Text="Mayotte"></asp:ListItem>
                                        <asp:ListItem Value="138" Text="Mexico"></asp:ListItem>
                                        <asp:ListItem Value="139" Text="Micronesia"></asp:ListItem>
                                        <asp:ListItem Value="140" Text="Moldova"></asp:ListItem>
                                        <asp:ListItem Value="141" Text="Monaco"></asp:ListItem>
                                        <asp:ListItem Value="142" Text="Mongolia"></asp:ListItem>
                                        <asp:ListItem Value="143" Text="Montserrat"></asp:ListItem>
                                        <asp:ListItem Value="144" Text="Morocco"></asp:ListItem>
                                        <asp:ListItem Value="145" Text="Mozambique"></asp:ListItem>
                                        <asp:ListItem Value="146" Text="Myanmar"></asp:ListItem>
                                        <asp:ListItem Value="147" Text="Namibia"></asp:ListItem>
                                        <asp:ListItem Value="148" Text="Nauru"></asp:ListItem>
                                        <asp:ListItem Value="149" Text="Nepal"></asp:ListItem>
                                        <asp:ListItem Value="150" Text="Netherlands"></asp:ListItem>
                                        <asp:ListItem Value="151" Text="Netherlands Antilles"></asp:ListItem>
                                        <asp:ListItem Value="152" Text="New Caledonia"></asp:ListItem>
                                        <asp:ListItem Value="153" Text="New Zealand"></asp:ListItem>
                                        <asp:ListItem Value="154" Text="Nicaragua"></asp:ListItem>
                                        <asp:ListItem Value="155" Text="Niger"></asp:ListItem>
                                        <asp:ListItem Value="156" Text="Nigeria"></asp:ListItem>
                                        <asp:ListItem Value="157" Text="Niue"></asp:ListItem>
                                        <asp:ListItem Value="158" Text="Norfolk Island"></asp:ListItem>
                                        <asp:ListItem Value="159" Text="Northern Mariana Islands"></asp:ListItem>
                                        <asp:ListItem Value="160" Text="Norway"></asp:ListItem>
                                        <asp:ListItem Value="161" Text="Oman"></asp:ListItem>
                                        <asp:ListItem Value="162" Text="Pakistan"></asp:ListItem>
                                        <asp:ListItem Value="163" Text="Palau"></asp:ListItem>
                                        <asp:ListItem Value="164" Text="Panama"></asp:ListItem>
                                        <asp:ListItem Value="165" Text="Papua New Guinea"></asp:ListItem>
                                        <asp:ListItem Value="166" Text="Paraguay"></asp:ListItem>
                                        <asp:ListItem Value="167" Text="Peru"></asp:ListItem>
                                        <asp:ListItem Value="168" Text="Philippines"></asp:ListItem>
                                        <asp:ListItem Value="169" Text="Pitcairn"></asp:ListItem>
                                        <asp:ListItem Value="170" Text="Poland"></asp:ListItem>
                                        <asp:ListItem Value="171" Text="Portugal"></asp:ListItem>
                                        <asp:ListItem Value="172" Text="Puerto Rico"></asp:ListItem>
                                        <asp:ListItem Value="173" Text="Qatar"></asp:ListItem>
                                        <asp:ListItem Value="174" Text="Reunion"></asp:ListItem>
                                        <asp:ListItem Value="175" Text="Romania"></asp:ListItem>
                                        <asp:ListItem Value="176" Text="Russian Federation"></asp:ListItem>
                                        <asp:ListItem Value="177" Text="Rwanda"></asp:ListItem>
                                        <asp:ListItem Value="178" Text="Saint Kitts and Nevis"></asp:ListItem>
                                        <asp:ListItem Value="179" Text="Saint Lucia"></asp:ListItem>
                                        <asp:ListItem Value="180" Text="Saint Vincent and the Grenadines"></asp:ListItem>
                                        <asp:ListItem Value="181" Text="Samoa"></asp:ListItem>
                                        <asp:ListItem Value="182" Text="San Marino"></asp:ListItem>
                                        <asp:ListItem Value="183" Text="Sao Tome and Principe"></asp:ListItem>
                                        <asp:ListItem Value="184" Text="Saudi Arabia"></asp:ListItem>
                                        <asp:ListItem Value="185" Text="Senegal"></asp:ListItem>
                                        <asp:ListItem Value="186" Text="Seychelles"></asp:ListItem>
                                        <asp:ListItem Value="187" Text="Sierra Leone"></asp:ListItem>
                                        <asp:ListItem Value="188" Text="Singapore"></asp:ListItem>
                                        <asp:ListItem Value="189" Text="Slovakia"></asp:ListItem>
                                        <asp:ListItem Value="190" Text="Slovenia"></asp:ListItem>
                                        <asp:ListItem Value="191" Text="Solomon Islands"></asp:ListItem>
                                        <asp:ListItem Value="192" Text="Somalia"></asp:ListItem>
                                        <asp:ListItem Value="193" Text="South Africa"></asp:ListItem>
                                        <asp:ListItem Value="194" Text="South Georgia and the South Sandwich Islands"></asp:ListItem>
                                        <asp:ListItem Value="195" Text="Spain"></asp:ListItem>
                                        <asp:ListItem Value="196" Text="Sri Lanka"></asp:ListItem>
                                        <asp:ListItem Value="197" Text="St Helena"></asp:ListItem>
                                        <asp:ListItem Value="198" Text="St Pierre and Miquelon"></asp:ListItem>
                                        <asp:ListItem Value="199" Text="Sudan"></asp:ListItem>
                                        <asp:ListItem Value="200" Text="Suriname"></asp:ListItem>
                                        <asp:ListItem Value="201" Text="Svalbard and Jan Mayen Islands"></asp:ListItem>
                                        <asp:ListItem Value="202" Text="Swaziland"></asp:ListItem>
                                        <asp:ListItem Value="203" Text="Sweden"></asp:ListItem>
                                        <asp:ListItem Value="204" Text="Switzerland"></asp:ListItem>
                                        <asp:ListItem Value="205" Text="Syrian Arab Republic"></asp:ListItem>
                                        <asp:ListItem Value="206" Text="Taiwan Region"></asp:ListItem>
                                        <asp:ListItem Value="207" Text="Tajikistan"></asp:ListItem>
                                        <asp:ListItem Value="208" Text="Tanzania"></asp:ListItem>
                                        <asp:ListItem Value="209" Text="Thailand"></asp:ListItem>
                                        <asp:ListItem Value="210" Text="Togo"></asp:ListItem>
                                        <asp:ListItem Value="211" Text="Tokelau"></asp:ListItem>
                                        <asp:ListItem Value="212" Text="Tonga"></asp:ListItem>
                                        <asp:ListItem Value="213" Text="Trinidad and Tobago"></asp:ListItem>
                                        <asp:ListItem Value="214" Text="Tunisia"></asp:ListItem>
                                        <asp:ListItem Value="215" Text="Turkey"></asp:ListItem>
                                        <asp:ListItem Value="216" Text="Turkmenistan"></asp:ListItem>
                                        <asp:ListItem Value="217" Text="Turks and Caicos Islands"></asp:ListItem>
                                        <asp:ListItem Value="218" Text="Tuvalu"></asp:ListItem>
                                        <asp:ListItem Value="219" Text="Uganda"></asp:ListItem>
                                        <asp:ListItem Value="220" Text="Ukraine"></asp:ListItem>
                                        <asp:ListItem Value="221" Text="United Arab Emirates"></asp:ListItem>
                                        <asp:ListItem Value="222" Text="United Kingdom"></asp:ListItem>
                                        <asp:ListItem Value="223" Text="United States"></asp:ListItem>
                                        <asp:ListItem Value="224" Text="United States Minor Outlying Islands"></asp:ListItem>
                                        <asp:ListItem Value="225" Text="Uruguay"></asp:ListItem>
                                        <asp:ListItem Value="226" Text="Uzbekistan"></asp:ListItem>
                                        <asp:ListItem Value="227" Text="Vanuatu"></asp:ListItem>
                                        <asp:ListItem Value="228" Text="Vatican City State (Holy See)"></asp:ListItem>
                                        <asp:ListItem Value="229" Text="Venezuela"></asp:ListItem>
                                        <asp:ListItem Value="230" Text="Viet Nam"></asp:ListItem>
                                        <asp:ListItem Value="231" Text="Virgin Islands (British)"></asp:ListItem>
                                        <asp:ListItem Value="232" Text="Virgin Islands (US)"></asp:ListItem>
                                        <asp:ListItem Value="233" Text="Wallis and Futuna Islands"></asp:ListItem>
                                        <asp:ListItem Value="234" Text="Western Sahara"></asp:ListItem>
                                        <asp:ListItem Value="235" Text="Yemen"></asp:ListItem>
                                        <asp:ListItem Value="236" Text="Zaire"></asp:ListItem>
                                        <asp:ListItem Value="237" Text="Zambia"></asp:ListItem>
                                        <asp:ListItem Value="238" Text="Zimbabwe"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvDrpUsertype" CssClass="errormsg" runat="server" ErrorMessage="Please select Country" Display="Dynamic" ControlToValidate="ddlCountry" InitialValue="0"
                                        ValidationGroup="CA" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-3 col-xs-3" for="txtState">State:<span style="color: red">*</span></label>

                                <div class="col-xs-12 col-sm-9 col-xs-8">
                                    <asp:TextBox ID="txtState" class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvState" CssClass="errormsg" ControlToValidate="txtState" runat="server" ForeColor="Red" Display="Dynamic" ValidationGroup="CA" ErrorMessage="Please Enter state"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revState" runat="server" CssClass="errormsg" ControlToValidate="txtState" Display="Dynamic" ValidationExpression="[a-zA-Z' ']+" ValidationGroup="CA" ForeColor="Red" ErrorMessage="Please Enter only alphabate"></asp:RegularExpressionValidator>

                                </div>
                            </div>

                            <telerik:RadAjaxPanel ID="RadSearchPanelCA" LoadingPanelID="RadAjaxLoadingPanelCA" runat="server" RestoreOriginalRenderDelegate="false">
                                <div class="form-group">
                                    <label class="control-label col-sm-3 col-xs-3" for="lblFixDoctor">Doctor:<span style="color: red">*</span></label>
                                    <div class="col-xs-12 col-sm-9 col-xs-8">
                                        <%-- <asp:Label ID="lblFixDoctor" Font-Bold="true" runat="server"></asp:Label>--%>
                                        <asp:DropDownList ID="ddlDoctorName" runat="server" OnSelectedIndexChanged="ddlDoctorName_SelectedIndexChanged" class="form-control" AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvDoctor" runat="server" CssClass="errormsg" ErrorMessage="Please select Doctor" ControlToValidate="ddlDoctorName" InitialValue="0" Display="Dynamic" ValidationGroup="CA" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:HiddenField ID="hdnSpecialty" runat="server" Value="0" />
                                    <label class="control-label col-sm-3 col-xs-3" for="drpSpecialty">Specialty:</label>

                                    <div class="col-xs-12 col-sm-9 col-xs-8">
                                        <asp:DropDownList runat="server" class="form-control" ID="drpSpecialty" AutoPostBack="true" OnSelectedIndexChanged="drpSpecialty_SelectedIndexChanged" />

                                        <asp:RequiredFieldValidator ID="rfvJobCategoryName" CssClass="errormsg" runat="server" ErrorMessage="Please select Specialty" ControlToValidate="drpSpecialty" InitialValue="0"
                                            Display="Dynamic" ValidationGroup="CA" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3 col-xs-3" for="drpSpecialty">Appointment Day:<span style="color: red">*</span></label>

                                    <div class="col-xs-12 col-sm-9 col-xs-8">
                                        <asp:DropDownList runat="server" class="form-control" ID="ddlAppointmentDay" AutoPostBack="true" OnSelectedIndexChanged="ddlAppointmentDay_SelectedIndexChanged">
                                            <asp:ListItem Text="Select Day" Value="0"></asp:ListItem>
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="errormsg" ErrorMessage="Please select day for appointment" ControlToValidate="ddlAppointmentDay" InitialValue="0"
                                            Display="Dynamic" ValidationGroup="CA" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3 col-xs-3" for="drpSpecialty">Appointment Date:<span style="color: red">*</span></label>

                                    <div class="col-xs-12 col-sm-9 col-xs-8">
                                        <asp:DropDownList runat="server" class="form-control" ID="ddlAppointMentDate" AutoPostBack="true" OnSelectedIndexChanged="ddlAppointMentDate_SelectedIndexChanged">
                                            <asp:ListItem Text="Select Date" Value="0"></asp:ListItem>
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="errormsg" runat="server" ErrorMessage="Please select day for appointment" ControlToValidate="ddlAppointMentDate" InitialValue="0"
                                            Display="Dynamic" ValidationGroup="CA" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-3 col-xs-3" for="drpSpecialty">Select Time Slot:<span style="color: red">*</span></label>
                                    <div class="col-xs-12 col-sm-9 col-xs-8">
                                        <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpTimeSlot_SelectedIndexChanged" class="form-control" ID="drpTimeSlot">
                                            <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="errormsg" runat="server" ErrorMessage="Please select time slot" ControlToValidate="drpTimeSlot" InitialValue="0"
                                            Display="Dynamic" ValidationGroup="CA" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:Label ID="lblTimeSlotError" runat="server" CssClass="errormsg" Visible="false" ForeColor="Red"></asp:Label>
                                        
                                    </div>
                                </div>
                               
                            <asp:HiddenField ID="hdnfollowup" runat="server" />
                                    <asp:HiddenField ID="hdnconsulting" runat="server" />
                          <asp:PlaceHolder ID="plcAppointmentType" runat="server" Visible="false">
                            <div class="form-group" id="divAppointmentType">
                                <label class="control-label col-sm-3 col-xs-3" for="drpSpecialty">Select Appointment type:<span style="color: red">*</span></label>
                                <div class="col-xs-12 col-sm-9 col-xs-8">
                                    <asp:DropDownList runat="server" class="form-control" ID="drpAppointmentType" onchange="GetSelectedTextValue(this)">
                                        <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Follow-Up" Value="Follow-Up"></asp:ListItem>
                                        <asp:ListItem Text="New" Value="New"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvAppointmentType" Enabled="false" CssClass="errormsg" runat="server" ErrorMessage="Please select appointment type" ControlToValidate="drpAppointmentType" InitialValue="0"
                                        Display="Dynamic" ValidationGroup="CA" ForeColor="Red"></asp:RequiredFieldValidator>
                                   
                                </div>
                            </div>
                            </asp:PlaceHolder>



                               <div class="form-group"> 
                                <label class="control-label col-sm-3 col-xs-3" for="txtInquiry">Amount:<span style="color: red"></span></label>
                                <div class="col-xs-12 col-sm-9 col-xs-8">
                                    <asp:Label ID="lblAppointmentType" Text="0.00"  runat="server" Style="font-weight:bold;color:black;font:12px;" ></asp:Label>
                                    
                                </div>
                            </div>

                          

                            <div class="form-group">
                                <label class="control-label col-sm-3 col-xs-3" for="txtInquiry">Inquiry:<span style="color: red">*</span></label>
                                <div class="col-xs-12 col-sm-9 col-xs-8">
                                    <asp:TextBox ID="txtInquiry" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="errormsg" ControlToValidate="txtInquiry" runat="server" ForeColor="Red" ErrorMessage="Please Enter Inquiry" ValidationGroup="CA" Display="Dynamic"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                                </telerik:RadAjaxPanel>
                            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanelCA" runat="server" Transparency="30">
                                <div class="modal-dialog" style="vertical-align: middle; text-align: center; background-color: white; margin-top: 0px !important; height: 100%; width: 100%; padding-top: 10%;">
                                    <img alt="Loading..." src='/images/loading.gif' style="margin-top: 1%;" />
                                </div>
                            </telerik:RadAjaxLoadingPanel>
                            <%--
                                <div class="form-group">
                                    <div class="col-xs-offset-3 col-xs-9">
                                        <label class="">
                                            Type out the verification key exactly as it appears in the image below. If you have trouble reading this image, refresh your browser to get a new key
                                        </label>
                                    </div>
                                </div>

                                <asp:UpdatePanel ID="updatesB" runat="server">
                                    <ContentTemplate>
                                        <div class="form-group">
                                            <label class="control-label col-xs-3" for="phoneNumber"></label>
                                            <div class="col-xs-9">
                                                <cc1:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
                                                    CaptchaHeight="60" CaptchaWidth="200" CaptchaMinTimeout="5" CaptchaMaxTimeout="240"
                                                    FontColor="#D20B0C" NoiseColor="#B1B1B1" />

                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label col-sm-3 col-xs-12" for="phoneNumber">Enter text:<span style="color: red">*</span></label> 
                                            <div class="col-xs-offset-3 col-xs-9">
                                                <asp:TextBox ID="txtCaptcha" runat="server">&nbsp;</asp:TextBox><asp:ImageButton ID="ImageButton1" ImageUrl="../../../../images/refresh.gif" runat="server" CausesValidation="false" class="glyphicon glyphicon-refresh" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtCaptcha" runat="server" ForeColor="Red" ErrorMessage="Please Enter above code" Display="Dynamic" ValidationGroup="CA"></asp:RequiredFieldValidator>

                                                <asp:CustomValidator ID="CustomValidator2" Display="Dynamic" ErrorMessage="Invalid. Please try again." ValidationGroup="CA" ControlToValidate="txtCaptcha" OnServerValidate="ValidateCaptcha" runat="server" ForeColor="Red" />

                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            --%>
                            <div class="form-group" style="text-align:center;">
                                <div class="col-xs-offset-0 col-sm-offset-3 col-xs-12 ">
                                    <asp:HiddenField ID="hdnUserId" Value='<%# CommonFn.UserID.ToString() %>' runat="server" />
                                    <asp:LinkButton ID="btnSubmitFAA" class="btn btn-primary" runat="server" ValidationGroup="CA" OnClick="btnSubmit_Click">Pay Later</asp:LinkButton>
                                    <asp:LinkButton ID="btnPayNow" runat="server" class="btn btn-primary" OnClick="btnSubmit_Click"  ValidationGroup="CA">Pay Now</asp:LinkButton>
                                    <asp:LinkButton ID="btnResetFAA" class="btn btn-primary" runat="server" OnClick="btnResetFAA_Click">Reset</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="divEmpty" runat="server" style="color: red; font-size: 18px;" visible="false">Please select doctor for appointment</div>
                </div>
            </asp:PlaceHolder>

            <asp:PlaceHolder ID="PlaceMessage" runat="server" Visible="false">
                <div class="right_part">
                    <div class="border-3"></div>
                    <div class="border-3"></div>
                    <div class="border-3"></div>
                    <h3 style="color: green; text-align: center">We have received your appointment request, you should receive a reply or a call shortly</h3>

                </div>
            </asp:PlaceHolder>
            <script type="text/javascript" src="&lt;?php echo $recaptcha_url; ?&gt;">
            </script>
            <div class="left_form hidden-lg visible-xs">
                <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />
            </div>
        </div>


      <%--  <div class="modal fade" id="permenantRegistration" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" style="padding: 5px 50px;">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4>Permanent Registration</h4>
                    </div>
                    <div class="modal-body mymodal" style="padding: 40px 50px;">
                        <p>You have not yet permanently registerd with Jaslok hospital, please go for the permanent registration to get premium benifits.</p>
                    </div>
                </div>
            </div>
        </div>--%>

    </div>

</div>



<JS:Testimonials runat="server" ID="Testimonials" />
<JS:Footer runat="server" ID="Footer" />
<telerik:RadScriptBlock runat="server">
   <%-- <script type="text/javascript"> var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
     var keyCode = e.which ? e.which : e.keyCode
     var ret = ((keyCode >= 48 && keyCode <= 57) || keyCode == 9 || keyCode == 46 || keyCode == 37 || keyCode == 39 || specialKeys.indexOf(keyCode) != -1); return ret;
 }
        function getDoctorId(doctorscheduleID) {
            var hdnDoctorId = document.getElementById('<%=hdnDoctorId.ClientID%>');
            hdnDoctorId.value = doctorscheduleID;
        }
        $(function () {
            $('[name$="$FixAnApp"]').attr("name", $('[name$="$FixAnApp"]').attr("name"));

            $('[name$="$FixAnApp"]').click(function () {
                //set name for all to name of clicked 
                $('[name$="$FixAnApp"]').attr("name", $(this).attr("name"));
            });
        });
        function fillHiddenField() {
            var ddl = document.getElementById('<%= drpSpecialty.ClientID%>');
            var hdn = document.getElementById('<%= hdnSpecialty.ClientID%>');
            hdn.value = ddl.value;
        }

       

        function showPopup() {
            if (Page_ClientValidate('CA')) {
                var hdnUserId = document.getElementById('<%= hdnUserId.ClientID%>');
                if (hdnUserId.value > 0) {
                    return true;
                }
                else {
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
                    return false;
                }
            }
            else {
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

         //function PermanentRegReminderBox() {
        //    $(document).ready(function () {
        //        $("#permenantRegistration").modal();
        //    });
        //}
    </script>--%>
</telerik:RadScriptBlock>
