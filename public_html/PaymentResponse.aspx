<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="PaymentResponse.aspx.cs" Inherits="PaymentResponse" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="paymentresponse">

        <div class="col-sm-12 col-md-12 col-lg-12 js-zero-padding">
            <asp:PlaceHolder ID="plcDivSucces" runat="server">
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
                                <span class="lable_text">Details</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 no_left_padding col-xs-6">
                                <%-- <span class="lable_text_ans">Jack McMilan</span>--%>
                                <asp:Label runat="server" ID="lblUserName" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6"">
                                <span class="lable_text">MRNO</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 no_left_padding col-xs-6"">
                                <asp:Label runat="server" ID="lblMNo" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6"">
                                <span class="lable_text">Mechant</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 no_left_padding col-xs-6"">
                                <span class="lable_text_ans">jaslok Hospital</span>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6"">
                                <span class="lable_text">Service</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 no_left_padding col-xs-6"">
                                <%-- <span class="lable_text_ans">Supra Major Plus</span>--%>
                                <asp:Label runat="server" ID="lblPaidAgainst" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6"">
                                <span class="lable_text">Txtn. ID</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 no_left_padding col-xs-6"">
                                <%--<span class="lable_text_ans">1234567890</span>--%>
                                <asp:Label runat="server" ID="lblTxtnId" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <%-- <div class="col-sm-6 col-lg-6 col-md-6">
                    <div class="row">
                        <div class="col-sm-4 col-md-4 col-lg-4">
                            <span class="lable_text">Txtn. Type</span>
                        </div>
                        <!--col 3 closed-->
                        <div class="col-sm-8 col-md-8 col-lg-8 no_left_padding">
                            <span class="lable_text_ans">Visa</span>
                        </div>
                        <!--col 9 closed-->
                    </div>
                    <!--row closed-->
                </div>--%>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6"">
                                <span class="lable_text">Date &amp; Time</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 no_left_padding col-xs-6"">
                                <%-- <span class="lable_text_ans">21/06/2016 10:14 PM</span>--%>
                                <asp:Label runat="server" ID="lblDateTime" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6"">
                                <span class="lable_text">Amount</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 no_left_padding col-xs-6"">
                                <%--<span class="lable_text_ans">75000.00 INR</span>--%>
                                <asp:Label runat="server" ID="lblAmount" class="lable_text_ans"></asp:Label>
                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>

                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6"">
                                <span class="lable_text">Status</span>
                            </div>
                            <!--col 3 closed-->
                            <div class="col-sm-8 col-md-8 col-lg-8 no_left_padding col-xs-6"">

                                <span runat="server" id="spnStatus" class="lable_text_ans green-color">Payment Successful</span>

                            </div>
                            <!--col 9 closed-->
                        </div>
                        <!--row closed-->
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div style="text-align:center">
                <asp:Label ID="lblMsg" style="font:14px;font-weight:bold;" runat="server" Visible="false"></asp:Label>
                </div>
                    <!--row closed-->






                <div class="clearfix"></div>


            </div>
            <!--doted_border_table closed-->


        </div>


        <%--<div class="col-md-12 col-sm-12 col-xs-12 js-each-boxes">
        <div class="col-md-2 col-sm-3 col-lg-2">
            <a onclick="" class="btn js-btn-primary3 no_top_margin ">PRINT</a>
        </div>
        <!--col 2 closed-->
        <div class="col-md-3 col-sm-3 col-lg-3">
            <a onclick="" class="btn js-btn-primary3 no_top_margin">E-MAIL</a>
        </div>
        <!--col 2 closed-->

        <div class="col-md-3 col-sm-3 col-lg-3 pull-right text-right">
            <a onclick="" class="btn js-btn-primary3 no_top_margin">DONE</a>
        </div>
        <!--col 2 closed-->
    </div>--%>

    </div>

</asp:Content>

   