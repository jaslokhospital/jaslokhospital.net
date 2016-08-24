<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OutStandingBillPayment.ascx.cs" Inherits="JSControls_MiddleContent_OutStandingBillPayment" %>

<style>

    .left-inner-addon {
    position: relative;
}
.left-inner-addon input {
    padding-left: 22px;    
}
.left-inner-addon span {
    position: absolute;
    padding: 7px 12px;
    pointer-events: none;
}

.right-inner-addon {
    position: relative;
}
.right-inner-addon input {
    padding-right: 30px;    
}
.right-inner-addon span {
    position: absolute;
    right: 0px;
    padding: 7px 12px;
    pointer-events: none;
}




    /*.currencyinput {
    border: 1px inset #ccc;
}
.currencyinput input {
    border: 0;
}*/
</style>
<%--<img src="/images/icon.jpg" alt="Icon" class="icon-right">--%>
<div class="row">
    <div class="OutStandingBillPayment">

       <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible="false">                
                <div class="alert alert-danger">
                    <img src="../../../../images/cancel_24.png" width="24" height="24" class="img_check">
                    <strong>You are not Authorized to access this page!</strong>
                </div>

            </asp:PlaceHolder>
    <div class="container1">
       

    <div  id="ContentPane" runat="server" class="OutstandingBillPayment">

        <div class="col-sm-12 col-md-12 col-lg-12 js-zero-padding">
            <asp:PlaceHolder ID="plcDivSucces" runat="server" Visible="false">
                <div class="alert alert-success green_sucess_box">
                    <img src="content/photogallery/check.png" width="24" height="24" class="img_check">
                    <span class="sucess_msg"><strong>Thank you!</strong> Your payment was completed Successfully. </span>
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="plcDivError" runat="server" Visible="false">                
                <div class="alert alert-danger">
                    <img src="content/photogallery/cancel_24.png" width="24" height="24" class="img_check">
                    <strong>Payment Fail!</strong>
                </div>

            </asp:PlaceHolder>

        </div>



        <div class="col-sm-12 col-lg-12 col-md-12  js-zero-padding doted_border_table">



            <div class="dotted_box">
                <div class="row_block">
                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                                <span class="lable_text">Patient Name</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 col-xs-6 no_left_padding">
                                <%-- <span class="lable_text_ans">Jack McMilan</span>--%>
                                <asp:Label runat="server" ID="lblPatientName" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                                <span class="lable_text">Last Name</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 col-xs-6 no_left_padding">
                                <asp:Label runat="server" ID="lblLastName" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                                <span class="lable_text">MR Number</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 col-xs-6 no_left_padding">
                            <asp:Label runat="server" ID="lblMrNumber" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                                <span class="lable_text">Address</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 col-xs-6 no_left_padding">
                                <%-- <span class="lable_text_ans">Supra Major Plus</span>--%>
                                <asp:Label runat="server" ID="lblAddress" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                                <span class="lable_text">Country</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 col-xs-6 no_left_padding">
                                <%--<span class="lable_text_ans">75000.00 INR</span>--%>
                                <asp:Label runat="server" ID="lblCountry" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>





                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                                <span class="lable_text">Gender</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 col-xs-6 no_left_padding">
                                <%--<span class="lable_text_ans">75000.00 INR</span>--%>
                                <asp:Label runat="server" ID="lblGender" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                                <span class="lable_text">Email</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 col-xs-6 no_left_padding">
                                <%--<span class="lable_text_ans">75000.00 INR</span>--%>
                                <asp:Label runat="server" ID="lblEmail" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
                                <span class="lable_text">Mobile</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 col-xs-6 no_left_padding">
                                <%--<span class="lable_text_ans">75000.00 INR</span>--%>
                                <asp:Label runat="server" ID="lblMobile" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                  
                <!--row closed-->


                <div class="clearfix"></div>

            </div>
           
        </div>


        </div>


          <div class="col-md-12 col-sm-12 col-xs-12 js-each-boxes">
                <div class="col-md-2 col-sm-2 col-xs-4">
                   <span class="lable_text_ans top-spa">Amount Pay</span>
                </div><!--col 2 closed-->
            	
                <div class="col-md-3 col-sm-4 col-xs-6 ">

                        <div class="left-inner-addon">
                            <span>₹</span>
                            <input type="text" id="txtAmount" runat="server" class="riEmpty form-control price_bx text-right" onkeypress="return Numeric(event);" />
                              <asp:RequiredFieldValidator ID="rfvAmount" runat="server" CssClass="errormsg" ErrorMessage="Please Enter Amount" ControlToValidate="txtAmount" Display="Dynamic" ValidationGroup="OBP"  ForeColor="Red"></asp:RequiredFieldValidator><br />
         
                        </div>
                   

                    <%--<span id="spancontrol" runat="server">₹ </span>

                <%-- <span class="currencyinput">₹           <input type="text" name="currency"></span>--%>


                    <%--<asp:TextBox ID="txtAmount" type="text" Text="₹                 " Style="text-align: left;" class="riEmpty form-control price_bx text-right"  runat="server"></asp:TextBox>--%>
                    <%--<asp:TextBox ID="txtAmount" type="text"  class="riEmpty form-control price_bx text-right" Style="text-align: left;"  runat="server"></asp:TextBox>--%>
            	</div>
               
               
             </div>

            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 js-zero-padding">

                <div class="form-group write-each">
                    <asp:LinkButton ID="btnSubmit" class="btn js-btn-primary3 pull-right" runat="server" OnClientClick="return validateOSBPay();"  ValidationGroup="OBP" OnClick="btnSubmit_Click">Pay</asp:LinkButton>
                
                </div>
            </div>


      </div>
    </div>
    </div>
    </div>

<script type="text/javascript">
    var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
        var keyCode = e.which ? e.which : e.keyCode
        var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
    }
    function validateOSBPay() {
        
        if ($('#dnn_ctl01_txtAmount').val() < 1) {
            alert('Amount should not be 0 ₹')
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
  </script>
