<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ApplyJaslokCareer.ascx.cs" Inherits="JSControls_MiddleContent_ApplyJaslokCareer" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<%--<script lang="javascript" type="text/javascript" src="/DesktopModules/JaslokCareer/Scripts/valjavavalidate.js"></script>--%>
    <%--<link href="/css/jdpicker.css" rel="stylesheet" type="text/css" />--%>
    <%--<script type="text/javascript" src="/js/jquery.min.js"></script>--%>
    <%--<script src="/js/jquery.jdpicker.js"></script>--%>
 <%--   <script src="/DesktopModules/JaslokCareer/Scripts/ValidateCommon.js"></script>--%>
 <script>
     function getFileData(myFile) {
         debugger;
         var file = myFile.files[0];
         var filename = file.name;
         var lbl = document.getElementById("<%= listofuploadedResume.ClientID %>");
         lbl.innerHTML = filename;
     }
</script>   
<style type="text/css">
    .table trHeader {
    background-color: #EBF2F6!important;
    font-size: 12px;
    font-weight: 400;
    line-height: 20px;
    padding: 6px;
    text-align: left;
    vertical-align: top;
}

    .btn-primary2-back {
    background-color: #E8A537;
    width: 120px;
    height: 33px;
    font-size: 20px !important;
    font-weight: 400;
    color: #FFF;
    border: 1px solid transparent;
    border-radius: 4px;
}


</style>


<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="right_part">
        
        <div style="text-align:right !important;"><asp:Button ID="btnBack" runat="server" Text="Back" class="btn-primary2-back" OnClick="btnBack_Click" />  </div> <br />

        <div class="form-horizontal">
             <asp:Label ID="lblMessage" runat="server"></asp:Label>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">Function Applied For:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                     <asp:TextBox ID="txtFunction" runat="server" class="form-control"></asp:TextBox>
                    <asp:Label ID="lblFunctionID" runat="server" Visible="false"></asp:Label>
                     <asp:RequiredFieldValidator ID="rfvFunction" runat="server" ErrorMessage="Please Enter Function" ControlToValidate="txtFunction"
                            Display="Dynamic" ValidationGroup="career" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageDescription">Post:</label>
                <div class="col-xs-9">
                   <asp:TextBox ID="txtPost" runat="server" class="form-control"></asp:TextBox>
                    <asp:Label ID="lblJobId" runat="server" Visible="false"></asp:Label>
                </div>
            </div> 
            <br />
            <b>Personal Details :</b>
            <div class="form-group">
                <label class="control-label col-xs-3" for="PageTitle">First Name:<span style="color: red">*</span></label>
                <div class="col-xs-9">
                      <asp:TextBox ID="txtFirstName" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter First Name" ControlToValidate="txtFirstName"
                            Display="Dynamic" ValidationGroup="career" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>           
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Middle Name:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtMiddleName" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Last Name:<span style="color: red">*</span></label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtLastName" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Last Name" ControlToValidate="txtLastName"
                            Display="Dynamic" ValidationGroup="career" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Date Of Birth:<span style="color: red">*</span></label>
                <div class="col-xs-9">                   
                    <telerik:RadDatePicker ID="rdpDOB" runat="server" class="form-control"></telerik:RadDatePicker>
                   <asp:TextBox ID="txtDOB" runat="server" class="datePickerTextBoxAJC" Visible="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Enter DOB" ControlToValidate="rdpDOB"
                            Display="Dynamic" ValidationGroup="career" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ControlToValidate="rdpDOB" Display="Dynamic" style="font-size:12px; color: red;"
                      ErrorMessage="DOB must be less than today" ID="CompareValidator2" Operator="LessThan" Type="Date" runat="server" ValidationGroup="career" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Gender:<span style="color: red">*</span></label>
                <div class="col-xs-9">                   
                    <asp:DropDownList ID="ddlGender" runat="server" Height="27px">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ErrorMessage="Please Select Gender" ControlToValidate="ddlGender"
                            Display="Dynamic" InitialValue="--Select--" ValidationGroup="career" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Religion:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtReligion" runat="server" class="form-control"></asp:TextBox>                         
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Nationality:</label>
                <div class="col-xs-9">                   
                    <asp:DropDownList ID="ddlNationality" runat="server" Height="27px">
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
                    
                </div>
            </div>
            <br />
<b>Contact Details :</b>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Landline Number (office)with STD code:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtLandLineOffice1" runat="server" Width="50px" MaxLength="4" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return ture;"></asp:TextBox>
                    <asp:TextBox ID="txtLandLineOffice2" runat="server" MaxLength="10" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return ture;"></asp:TextBox>
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Landline Number (Residence)with STD code:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtLandLineRes1" runat="server" Width="50px" MaxLength="4" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return ture;"></asp:TextBox>
                    <asp:TextBox ID="txtLandLineRes2" runat="server" MaxLength="10" onkeypress="return Numeric(event);" ondrop="return false;" onpaste="return ture;"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Mobile Number:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtMobile" runat="server" class="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revmob" runat="server" ControlToValidate="txtMobile" ErrorMessage="Enter 10 digit number" ValidationGroup="career" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Email Id:<span style="color: red">*</span></label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="txtEmail"
                            Display="Dynamic" ValidationGroup="career" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="career" ControlToValidate="txtEmail" CssClass="requiredFieldValidateStyle"
                        ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Current Address (location):</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtCurrentAddress" runat="server" TextMode="MultiLine" class="form-control" MaxLength="500"></asp:TextBox>
                    <br />
                    <asp:CheckBox ID="chkSameAddress" runat="server" onclick="CopyAddress(this.checked);" />If permanant address same as above then tick here.
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Permanent Address:<span style="color: red">*</span></label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtPermanentAddress" runat="server" TextMode="MultiLine" class="form-control" MaxLength="500"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Address" ControlToValidate="txtPermanentAddress"
                            Display="Dynamic" ValidationGroup="career" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Qualification:</label>
                <div class="col-xs-9">                   
                    <asp:GridView ID="gdQualification" runat="server" OnRowDataBound="gdQualification_RowDataBound" Visible="false"></asp:GridView>

                    <table cellpadding="5" cellspacing="5" class="table">                       
                        <tr id="trHeader" style="background-color: #EBF2F6!important;">
                            <td>
                                 Qualification
                            </td>
                            <td>
                                 Degree
                            </td>
                            <td>
                                 University/<br />Institute
                            </td>
                            <td>
                                 Specialization
                            </td>
                            <td>
                                Percentage /<br />Grade
                            </td>
                        </tr>               
                        <tr>
                            <td>
                                 <asp:DropDownList ID="ddlQualification1" runat="server" Height="27px">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="HSC (XII Std)"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Graduation"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Post Graduation"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="B.Farm"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="M.Farm"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="Other"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDegree1" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUniversity1" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSpecialization1" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGrade1" runat="server" Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background-color: #F6F6F6;">
                            <td>
                                 <asp:DropDownList ID="ddlQualification2" runat="server" Height="27px">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="HSC (XII Std)"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Graduation"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Post Graduation"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="B.Farm"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="M.Farm"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="Other"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDegree2" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUniversity2" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSpecialization2" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGrade2" runat="server" Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:DropDownList ID="ddlQualification3" runat="server" Height="27px">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="HSC (XII Std)"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Graduation"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Post Graduation"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="B.Farm"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="M.Farm"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="Other"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDegree3" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUniversity3" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSpecialization3" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGrade3" runat="server" Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background-color: #F6F6F6;">
                            <td>
                                 <asp:DropDownList ID="ddlQualification4" runat="server" Height="27px">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="HSC (XII Std)"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Graduation"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Post Graduation"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="B.Farm"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="M.Farm"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="Other"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDegree4" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUniversity4" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSpecialization4" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGrade4" runat="server" Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:DropDownList ID="ddlQualification5" runat="server" Height="27px">
                                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="HSC (XII Std)"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Graduation"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Post Graduation"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="B.Farm"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="M.Farm"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="Other"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDegree5" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtUniversity5" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSpecialization5" runat="server" Width="120px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtGrade5" runat="server" Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>




                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Insert Additional Qualification:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtAddotionalQual" runat="server" TextMode="MultiLine" class="form-control" MaxLength="450"></asp:TextBox>
                </div>

            </div>
            <br />
<b>Work Experience Details :</b>
            
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Total Years of Experience in similar field:</label>
                <div class="col-xs-9">                   
                    <asp:DropDownList ID="ddlTotalExp" runat="server" Height="27px"></asp:DropDownList>
                    <asp:DropDownList ID="ddlTotalExpMonth" runat="server" Height="27px"></asp:DropDownList>
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Additional/Other Experience:</label>
                <div class="col-xs-9">                   
                    <asp:DropDownList ID="ddlOtherExp" runat="server" Height="27px"></asp:DropDownList>
                    <asp:DropDownList ID="ddlOtherExpMonth" runat="server" Height="27px"></asp:DropDownList>
                </div>

            </div>

      <br />
            <div class="heading">
            <asp:ImageButton ID="img1" runat="server" ImageUrl="~/Images/plus.gif" OnClientClick="return ShowFloorPlan();" style="height: 20px"/>
                <label class="control-label col-xs-3" for="redPageContent">             
                    Work Experience Details:</label>
            </div>
            <div id="pnlFloor" style="display:none" runat="server">
             <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent"></label>
                <div class="col-xs-9">
                </div>
            </div>
                           
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Company Name:<span style="color: red">*</span></label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtComapnyName" runat="server" class="form-control"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfvCName" runat="server" ErrorMessage="Please enter company name" ControlToValidate="txtComapnyName"
                            Display="Dynamic"  ValidationGroup="careerWorkExp" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Designation:<span style="color: red">*</span></label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtDesignation" runat="server" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter designation" ControlToValidate="txtDesignation"
                            Display="Dynamic"  ValidationGroup="careerWorkExp" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Location:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtLocation" runat="server" class="form-control"></asp:TextBox>
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Company Turn Over:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtTurnOver" runat="server" class="form-control"></asp:TextBox>
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">No Of Employees:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtNoOfEmployees" runat="server" class="form-control" MaxLength="7"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNoOfEmployees" Display="Dynamic" ErrorMessage="Only numbers" 
                        ValidationExpression="^\d+$" style="font-size:10px; color: red;" ValidationGroup="careerWorkExp"></asp:RegularExpressionValidator>
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Describe Job Responsibilities:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtJobRespons" runat="server" class="form-control" MaxLength="500"></asp:TextBox>
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Reporting to (position):</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtReporting" runat="server" class="form-control"></asp:TextBox>
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">From Date:<span style="color: red">*</span></label>
                <div class="col-xs-9"> 
                    <telerik:RadDatePicker ID="rdpFromDate" runat="server" class="form-control"></telerik:RadDatePicker> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="rdpFromDate"
                            Display="Dynamic"  ValidationGroup="careerWorkExp" ForeColor="Red"></asp:RequiredFieldValidator>
                                     
                    <asp:TextBox ID="txtFromDate" runat="server" class="datePickerTextBoxAJC" Visible="false"></asp:TextBox>
                    
                    <asp:TextBox ID="txtToDate" runat="server" class="datePickerTextBoxAJC" Visible="false"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;                    
                    <asp:Label ID="lblToDate" runat="server" Text="To Date" Font-Bold="true"></asp:Label><span style="color: red">*</span>
                    <telerik:RadDatePicker ID="rdpToDate" runat="server" class="form-control"></telerik:RadDatePicker> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="rdpToDate"
                            Display="Dynamic"  ValidationGroup="careerWorkExp" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ControlToCompare="rdpFromDate" ControlToValidate="rdpToDate" Display="Dynamic" style="font-size:12px; color: red;"
                      ErrorMessage="Invalid Date" ID="CompareValidator1" Operator="GreaterThan" Type="Date" runat="server" ValidationGroup="careerWorkExp" />
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Salary in lacs (PA):</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtSalPA" runat="server" class="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSalPA" Display="Dynamic" ErrorMessage="Only numbers" 
                        ValidationExpression="^\d+$" style="font-size:10px; color: red;" ValidationGroup="careerWorkExp"></asp:RegularExpressionValidator>
                </div>

            </div>
             <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Reason For Leaving:</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                </div>
            </div>
           <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent"></label>
                <div class="col-xs-9">                   
                    <asp:Button ID="btnSaveAdd" runat="server" Text="Save and Add More" ValidationGroup="careerWorkExp" OnClick="btnSaveAdd_Click" class="btn btn-primary2" Width="200px" />
                </div>
            </div>
     </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent"></label>
                <div class="col-xs-9">                  
                   
                </div>

            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Work Exp Details In Grid:</label>
                <div class="col-xs-9">                   
                    
                    <asp:GridView ID="gdWorkExp" runat="server" AutoGenerateColumns="False" HeaderStyle-Font-Size="10pt" HeaderStyle-BackColor="Gray" HeaderStyle-Height="28px" 
                             RowStyle-Font-Size="10px" RowStyle-Height="27px" HeaderStyle-BorderColor="#c0c0c0">
                        <Columns>
                            <asp:BoundField DataField="CompanyName" HeaderText="Company"></asp:BoundField>
                            <asp:BoundField DataField="empDesignation" HeaderText="Designation"></asp:BoundField>
                            <asp:BoundField DataField="Location" HeaderText="Location"></asp:BoundField>
                            <asp:BoundField DataField="FromDate" HeaderText="FromDate"></asp:BoundField>
                            <asp:BoundField DataField="ToDate" HeaderText="ToDate"></asp:BoundField>
                            <asp:BoundField DataField="CompanyTurnOver" HeaderText="CompanyTurnOver"></asp:BoundField>
                            <asp:BoundField DataField="NoOfEmployee" HeaderText="NoOfEmployee"></asp:BoundField>
                            <asp:BoundField DataField="JobResponsibilities" HeaderText="Responsibility"></asp:BoundField>
                            <asp:BoundField DataField="Reporting" HeaderText="Reporting"></asp:BoundField>
                            <asp:BoundField DataField="SalaryInLacs" HeaderText="Salary"></asp:BoundField>
                            <asp:BoundField DataField="ReasonForLeaving" HeaderText="Reeason"></asp:BoundField>
                        </Columns>
                    </asp:GridView>


                </div>

            </div>
            
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Current Salary pa (Lac):</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtCurrSal" runat="server" class="form-control"></asp:TextBox>
                </div>

            </div>
            <br />
    <b>Curriculum Vitae  :</b>
             <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Upload CV:</label>
                <div class="col-xs-9">                   
                    <%--<input id="Myfile" type="file" runat="server" name="Myfile" accept="image/jpeg,image/png,application/pdf,doc" data-max-size="20971520" data-buttontext="Upload..">--%>
               
                     <asp:FileUpload ID="UploadResume" runat="server" onchange="getFileData(this);" Style="color: transparent;" />
                    <asp:Label ID="listofuploadedResume" runat="server" />
                    <asp:RequiredFieldValidator CssClass="small" ID="rfvImgupload" runat="server" ErrorMessage="Please Upload CV" ControlToValidate="UploadResume"
                        Display="Dynamic" ValidationGroup="career" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="small" ID="rexp" runat="server" ControlToValidate="UploadResume" ForeColor="Red" ValidationGroup="career" ErrorMessage="Only .gif, .jpg,.doc,.pdf .png and .jpeg"
                        ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])|.*\.([Dd][Oo][Cc][Xx])|.*\.([Dd][Oo][Cc])|.*\.([pP][nN][gG])|.*\.([Jj][Pp][Ee][Gg])|.*\.([pP][dD][fF])$)"></asp:RegularExpressionValidator>
               
                     </div>

            </div>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Expected Salary pa (Lac):</label>
                <div class="col-xs-9">                   
                    <asp:TextBox ID="txtExpSal" runat="server" class="form-control"></asp:TextBox>
                </div>

            </div>
            <br />
    <br />
   <%-- <b>Declaration  :</b>--%>
            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent">Declaration:</label>
                <div class="col-xs-9">                   
                    <asp:CheckBox ID="chkDeclaration" runat="server" />
        The information given in the form is true and complete. I understand that if, this information is found not to be the case, my application will fail or, if i am employed, i will be liable to be terminated. 
                </div>

            </div>


            <div class="form-group">
                <label class="control-label col-xs-3" for="redPageContent"></label>
                <div class="col-xs-9">                   
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="career" class="btn btn-primary2" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" ValidationGroup="career" class="btn btn-primary2" />
                </div>
                 
            </div>
            
         
        </div>
    </div>
</div>


<script type="text/javascript">

    //$(document).ready(function () {
    //    $(".datePickerTextBoxAJC").jdPicker({
    //        date_format: "dd/MM/YYYY"
    //    });
    //});



    function CopyAddress(strflag) {
        if (strflag == true)
            document.getElementById("<%= txtPermanentAddress.ClientID %>").value = document.getElementById("<%= txtCurrentAddress.ClientID %>").value;
        else
            document.getElementById("<%= txtPermanentAddress.ClientID %>").value = "";

    }

    function ShowFloorPlan() {
        debugger;
        if (document.getElementById("<%=img1.ClientID %>").src.includes("plus.gif") == true) {
            document.getElementById("<%=pnlFloor.ClientID %>").style.display = "block";
            document.getElementById("<%= img1.ClientID %>").src = "/Images/minus.gif";
        }
        else {
            document.getElementById("<%=pnlFloor.ClientID %>").style.display = "none";
            document.getElementById("<%=img1.ClientID %>").src = "/Images/plus.gif";
        }
        return false;
    }

    </script>
<script type="text/javascript"> var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
     var keyCode = e.which ? e.which : e.keyCode
     var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
 } </script>
