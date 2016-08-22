<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HealthCheckUpComprehensive.ascx.cs" Inherits="JSControls_MiddleContent_HealthCheckUpComprehensive" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<div class="healthCheckup">
     <asp:PlaceHolder ID="plcDivError" runat="server" Visible="false">                
                <div class="alert alert-danger">
                    <img src="content/photogallery/cancel_24.png" width="24" height="24" class="img_check">
                    <strong>You are not Authorized to access this page!</strong>
                </div>

            </asp:PlaceHolder>
<div id="ContentPane" runat="server">

     

    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title mypanel-title">
                   <%-- <input type="radio" id="rdoPackageA" title="Package A" name="quality" value="5000" aria-valuetext="5000">--%>
                    <label class="a_idc" for="rdoPackageA">
                                         <input type="radio" id="rdoPackageA" title="Package A" name="quality" value="5000" aria-valuetext="5000">
                         <span class="lable_box"> </span>
                                    </label>
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false">

                        <span>Package A </span>
                        <span class="price">Price : &#8377; 5,000 </span>
                    </a>
                    <%-- <span class="price">Price : <del>र</del> 5,000 </span>

         <input type="radio" id="rdbtnpackege" class="pull-right" data-index="" aria-valuetext="5000" title="Package A" value="5000">
              <span class="lable_box"> </span>--%>
                </div>
            </div>
            <div class="panel-collapse collapse" id="collapseOne" aria-expanded="false">
                <div class="panel-body myPanelBody">

                    <div class="row">
                        <div class="col-lg-10 col-md-9 col-xs-12">
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <ul class="panel-list">
                                        <h5>BLOOD</h5>
                                        <li>CBC</li>
                                        <li>ESR</li>
                                        <li>Fasting Blood Sugar</li>
                                        <li>Postprandial/ Post-Glucose Blood Sugar</li>
                                        <li>Blood Group </li>
                                    </ul>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <ul class="panel-list">
                                        <h5>LIVER PROFILE</h5>
                                        <li>Total bilirubin</li>
                                        <li>SGOT</li>
                                        <li>SGPT</li>
                                        <li>Gamma GT</li>
                                        <li>Albumin </li>
                                        <li>Total Protien </li>
                                        <li>Alkaline Phospates </li>
                                    </ul>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <ul class="panel-list">
                                        <h5>RENAL PROFILE</h5>
                                        <li>Urea Nitrogen </li>
                                        <li>Serum Creatinine </li>
                                        <li>Uric Acid </li>
                                        <li>Serum Bicarbonates </li>
                                        <li>Calcium </li>
                                        <li>Phosphorous </li>
                                    </ul>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <ul class="panel-list">
                                        <h5>ELECTROLYTES</h5>
                                        <li>Serum Sodium</li>
                                        <li>Serum Potassium</li>
                                        <li>Serum Chloride </li>
                                        <h5>LIPID PROFILE </h5>
                                        <li>Serum Cholesterol </li>
                                        <li>HDL Cholesterol </li>
                                        <li>Cholesterol/HDL Ratio </li>
                                        <li>Serum Triglycerides </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-3 col-xs-12">
                            <ul class="panel-list-right">
                                <li>URINE ROUTINE</li>
                                <li>STOOL ROUTINE</li>
                                <li>X-RAY (CHEST)</li>
                                <li>E.C.G</li>
                                <li>PAP SMEAR(For Ladies)</li>
                                <li>SPIROMETERY TEST</li>
                            </ul>

                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title mypanel-title">
                   <%-- <input type="radio" id="rdoPackageB" title="Package B" name="quality" value="6500" aria-valuetext="6500">--%>
                    <label class="a_idc" for="rdoPackageB">
                                        <input type="radio" id="rdoPackageB" title="Package B" name="quality" value="6500" aria-valuetext="Price : &#8377; 6,500">
                         <span class="lable_box"> </span>
                                    </label>
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false">
                        <span>Package B </span><asp:Label id="lblPackage" runat="server" Style="float: right; width: 120px !important;"><span class="price">Price : &#8377; 6,500 </span></asp:Label>

                    </a>
                </div>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" aria-expanded="false">
                <div class="panel-body myPanelBody">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-xs-12">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-12">
                                    <ul class="panel-list">
                                        <li>All test in package A </li>
                                        <li>Stress test </li>
                                        <li>Ultrasonography (Abdomen) </li>
                                        <li>Ultrasonography (Pelvis) </li>
                                        <li>Mammography7 (Only for ladies) </li>
                                    </ul>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-12 box-l">
                                    <ul class="panel-list none-list" style="margin: 0; padding: 0px;">
                                        <h5>ADDITIONAL TESTS </h5>
                                        <p>
                                            The following additional tests
				if recommended by the physican
			are offered at half the OPD rates.
                                        </p>

                                    </ul>
                                </div>

                                <div class="col-lg-4 col-md-4 col-sm-12 box-l">
                                    <ul class="none-list" style="margin: 0; padding: 0px;">
                                        <h5>Concessional rates are as under: </h5>
                                        <li>2-D ECHOCARDIOGRAPHY <span>&#8377; 660/- </span></li>
                                        <li>HOLTER MONITORING <span> &#8377; 770/- </span></li>
                                        <li>GLYCOSYLATED HB G6PD <span> &#8377; 370/- </span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>


                    </div>

                    <div class="row check-row">
                        <div class="col-lg-8 col-md-8 col-sm-12">
                            <p>FOR COUPLES: 20% Concession</p>
                            <p>
                                FOR SENIOR CITIZENs: Above 65 years: 25% Concession(Please bring proof of age)
(Only one concession will be given)
                            </p>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12">

                            <%--<input type="checkbox" name="" value="Male"> 6500/-  (For Male)<br>
			<input type="checkbox" name="" value="Female"> 7500/- (For Female)--%>
                           <%-- <input type="radio" checked id="rdoMale" title="Male" name="packageb" value="6500" aria-valuetext="6500">
                            6500/-  (For Male)<br>
                            <input type="radio" id="rdoFemale" title="Female" name="packageb" value="7500" aria-valuetext="7500">
                            7500/- (For Female)--%>
                            <label  for="rdoMale">
                                       <input type="radio" checked id="rdoMale" title="Male" name="packageb" value="6500" aria-valuetext="Price : &#8377; 6,500">
                           
                         <span class="lable_box">  &#8377;  6500/- (For Male) </span>
                                    </label>
                            <label class="a_idc" for="rdoFemale">
                                       <input type="radio" id="rdoFemale" title="Female" name="packageb" value="7500" aria-valuetext="Price : &#8377; 7,500">
                           
                         <span class="lable_box"> &#8377;  7500/- (For Female)</span>
                                    </label>
		
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title mypanel-title">
                    <%--<input type="radio" id="rdoPackagec" title="Package C" name="quality" value="1500" aria-valuetext="1500">--%>
                    <label class="a_idc" for="rdoPackageC">
                                        <input type="radio" id="rdoPackageC" title="Package C" name="quality" value="1500" aria-valuetext="1500">
                         <span class="lable_box"> </span>
                                    </label>
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true">
                        <span>Package C </span><span class="price">Price : &#8377; 1,500 </span>
                    </a>
                </div>
            </div>
            <div id="collapseThree" class="panel-collapse collapse in" aria-expanded="true">
                <div class="panel-body myPanelBody">
                    <div class="row  ">
                        <div class="col-lg-10 col-md-9 col-xs-12">
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <ul class="panel-list">
                                        <h5>BLOOD</h5>
                                        <li>CBC</li>
                                        <li>ESR</li>
                                        <li>Fasting Blood Sugar</li>
                                        <li>Post-Glucose Blood Sugar</li>
                                    </ul>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <ul class="panel-list">
                                        <h5>LIVER PROFILE</h5>
                                        <li>Total bilirubin</li>
                                        <li>SGOT</li>

                                    </ul>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <ul class="panel-list">
                                        <h5>RENAL PROFILE</h5>
                                        <li>Urea Nitrogen </li>
                                        <li>Serum Creatinine </li>

                                    </ul>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-12">
                                    <ul class="panel-list">
                                        <h5>LIPID PROFILE</h5>
                                        <li>Serum Cholesterol</li>



                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-3 col-xs-12">
                            <ul class="panel-list-right">
                                <li>URINE ROUTINE</li>
                                <li>STOOL ROUTINE</li>
                                <li>X-RAY (CHEST)</li>
                                <li>E.C.G</li>
                            </ul>

                        </div>

                    </div>
                    <div class="row ">
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <p>The charges include a detailed physical examination by the medical officer.</p>
                            <p>Referral consultation services will be charged extra.
The following additional tests and needful further
evaluation of the status of the health of executives/visiting
person are also offered at concessional rate, if advised.
                            </p>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12">
                            <ul class="none-list" style="margin: 0; padding: 0px;">
                                       
                                        <li>Stress test <span> &#8377; 660/- </span></li>
                                        <li>2D Echocardiography <span> &#8377; 660/- </span></li>
                                        <li> Holter monitoring <span> &#8377; 770/- </span></li>
                                         <li> Ultra sonography (Abdomen) <span> &#8377; 730/- </span></li>
                                         <li> Ultra sonography <span> &#8377; 610/- </span></li>
                                         <li> Mammography <span> &#8377; 825/- </span></li>
                                        <li> Glycosylated HB+G6PD <span> &#8377; 370/- </span></li>
                                        <li> PSA  <span> &#8377; 840/- </span></li>
                                      </ul>
		
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="col-md-12 col-sm-12 col-xs-12 js-each-boxes">
        <div class="col-md-4 col-sm-6 col-lg-4 col-xs-12 js-right-line js-right-spacing">
            <%--<select class="form-control appoint_form" id="" name="dnn$LeftPaneBookAppointment1$ddlSpecialtyLPB">
                        <option value="0" selected="selected">Search by Doctor</option>
                        <option value="45">Accupressure</option>
                    </select>--%>
            <asp:Label runat="server" ID="lbldoctor" Text="Doctors"></asp:Label>
            <asp:DropDownList runat="server" ID="ddlDoctorbedbook" class="form-control doctorDropdown">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvDoctor" runat="server" CssClass="errormsg" ErrorMessage="Please select Doctor" ControlToValidate="ddlDoctorbedbook" InitialValue="0" Display="Dynamic" ValidationGroup="Hcc" ForeColor="Red"></asp:RequiredFieldValidator><br />

        </div>
        <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12 js-right-line js-right-spacing bedreservation">
            <asp:Label runat="server" ID="lblEnterdatetime" Text="Enter date time"></asp:Label>
            <telerik:RadDateTimePicker ID="txtdatetime" DateInput-CssClass="riEmpty form-control" Width="100%" DateInput-EmptyMessageStyle-Font-Names="Roboto" runat="server"></telerik:RadDateTimePicker>
            <asp:RequiredFieldValidator ID="rfvDate" runat="server" CssClass="errormsg" ErrorMessage="Please select Date" ControlToValidate="txtdatetime" Display="Dynamic" ValidationGroup="Hcc" ForeColor="Red"></asp:RequiredFieldValidator><br />
            <%-- <input type="text" value="Enter Date & time" class="riEmpty form-control" name="" id="Text1"> 
                    <span class="js-add-on"> <i class="fa fa-calendar" aria-hidden="true"></i></span>
                    <span class="js-add-on-clock"> <i class="fa fa-clock-o fa-lg" aria-hidden="true"></i></span>--%>
        </div>


        <div class="col-md-4 col-sm-12 col-xs-12">
            <asp:Label runat="server" ID="lblDeposite" Text="Deposit Amount"></asp:Label>
            <asp:TextBox ID="txtAdmissionCharge" type="text" class="riEmpty form-control" ReadOnly="true"  runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 js-zero-padding">

        <div class="form-group write-each">
            <%-- <a onclick="" id="A1" class="btn js-btn-primary3 pull-right">Submit</a>--%>
            <asp:LinkButton ID="btnSubmit" class="btn js-btn-primary3 pull-right" runat="server" ValidationGroup="Hcc" OnClientClick="return validate()" OnClick="btnSubmit_Click">Submit</asp:LinkButton>

        </div>
    </div>

  </div>
</div>
<asp:HiddenField ID="hdnDeposit" runat="server" />
<script type="text/javascript">
   
    function setRadioButton(value, amount) {
        var radID = value.split(',');
        $('#dnn_txtAdmissionCharge').val(amount);
        $('#' + radID[0]).attr('checked', true);

    }

    $(".healthCheckup input[type='radio']").on("change", function () {
     
        //$("[id^=spanPrice]").css("visibility", "hidden");
        //$("#spanPrice" + $(this).attr("data-index")).css("visibility", "visible");

        $("#<%=txtAdmissionCharge.ClientID%>").val($(this).attr("aria-valuetext"));

     

      //  $("#<%=lblPackage.ClientID%>").val($(this).attr("aria-valuetext"));

        //alert($('#dnn_txtAdmissionCharge').val());

        $("#<%=hdnDeposit.ClientID%>").val($(this).attr("id") + "," + $(this).attr("title"));
        //alert($("#<%=hdnDeposit.ClientID%>").val());
    });
    $(".healthCheckup input[name='packageb']").on("change", function () {
        $('#dnn_ctl01_lblPackage').text($(this).attr("aria-valuetext"));
        $('#rdoPackageB').attr('checked', true);
    });
    //function validate() {
    //    if ($('#dnn_txtAdmissionCharge').val() == null || $('#dnn_txtAdmissionCharge').val() == "") {
    //        alert("Please select bed reservation type first");
    //        return false;
    //    }

    //}

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
</script>

