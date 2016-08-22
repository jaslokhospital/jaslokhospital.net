<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Feedback.ascx.cs" Inherits="JSControls_MiddleContent_Feedback" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<%--<div class="inner_right">
    <div class="inner_center_cont">
        <div id="divTitle" class="pageHeading">Feedback Form</div>
        <div id="Para">
            <div id="ContentPlaceHolder1_FB_Form1_divIntroText_1" style="display: ;">
                The fields marked as
                <span class="red">*</span>
                are mandatory
            <table>
                <tr>
                    <td>Name<span style="color: #ff0000; font-size: 13px">*</span>
                    </td>
                    <td width="70%">
                        <asp:TextBox ID="txtName" type="text" MaxLength="200" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNm" ControlToValidate="txtName" runat="server" ForeColor="Red" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revnm" runat="server" ControlToValidate="txtName" ValidationExpression="[a-zA-Z]+" ForeColor="Red" ErrorMessage="Please Enter only alphabate"></asp:RegularExpressionValidator>
                    </td>
                </tr>
               
                <tr>
                    <td>Gender<span style="color: #ff0000; font-size: 13px">*</span>
                    </td>

                    <td width="50%">
                        <asp:RadioButtonList ID="rbGender" runat="server">
                            <asp:ListItem id="rbMale" runat="server" Value="M">Male</asp:ListItem>
                            <asp:ListItem id="rbFmale" runat="server" Value="F">Female</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="rbGender" ForeColor="Red" ErrorMessage="Please Select Gender"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Mobile Number<span style="color:#ff0000;font-size:13px">*</span></td>
                    <td width="70%">
                        <asp:TextBox ID="txtMob" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvmob" ControlToValidate="txtMob" runat="server" ForeColor="Red" ErrorMessage="Please Enter Mobile Number"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revmob" runat="server"  ControlToValidate="txtMob" ErrorMessage="Enter 10 digit number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Email Id
                        <span style="color: #ff0000; font-size: 13px">*</span>
                    </td>

                    <td width="70%">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Please Enter Email ID"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="vgSubmit" ControlToValidate="txtEmail" CssClass="requiredFieldValidateStyle"
                            ForeColor="Red"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Feed Back
                        <span style="color: #ff0000; font-size: 13px">*</span>
                    </td>

                    <td width="70%">
                        <asp:TextBox ID="txtFeedBack" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQues" runat="server" ControlToValidate="txtFeedBack" ForeColor="Red" ErrorMessage="Please Enter FeedBack"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
                <table>
                    <tbody>
                        <tr>
                            <td align="left" id="Td1">Type out the verification key exactly as it appears in the image below. If you have trouble reading this image, refresh your browser to get a new key </td>

                        </tr>
                        <tr>
                            <td id="Td2">
                                <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
                        </tr>
                        <tr>
                            <td>
                                <cc1:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
                                    CaptchaHeight="60" CaptchaWidth="200" CaptchaMinTimeout="5" CaptchaMaxTimeout="240"
                                    FontColor="#D20B0C" NoiseColor="#B1B1B1" />
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </td>
                        </tr>

                    </tbody>

                </table>
                <div>
                    <table id="bottom">
                        <tr>
                            <td class="btn">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            </td>
                            <td class="btn">
                                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click"  />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>--%>



<div class="form-horizontal">
    <div class="form-group">
        <label class="control-label col-xs-3" for="Name">Name:</label>
        <div class="col-xs-9">
            <%--  <input type="text" class="form-control" id="Name" placeholder="Name">--%>
            <asp:TextBox ID="txtName" type="text" class="form-control" MaxLength="200" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtName" runat="server" ForeColor="Red" ErrorMessage="Please Enter Name" ValidationGroup="FedbckSubmit"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtName" ValidationExpression="[a-zA-Z]+" ValidationGroup="FedbckSubmit" ForeColor="Red" ErrorMessage="Please Enter only alphabate"></asp:RegularExpressionValidator>

        </div>
    </div>
     <div class="form-group">
        <label class="control-label col-xs-3">Gender:</label>
        <asp:RadioButtonList ID="rdoGenderCom" runat="server" class="col-xs-9">
            <asp:ListItem class="col-xs-2 radio-inline" Text="Male" Value="Male"></asp:ListItem>
            <asp:ListItem class="col-xs-2 radio-inline" Text="Female" Value="Female"></asp:ListItem>
        </asp:RadioButtonList>

    </div>
    <div class="form-group">
        <label class="control-label col-xs-3" for="Mobile">Mobile:</label>

        <div class="col-xs-9">
            <asp:TextBox ID="txtMobile" class="form-control" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMobile" ForeColor="Red" ValidationGroup="FedbckSubmit" ErrorMessage="Please Enter Mobile"></asp:RequiredFieldValidator>
           
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3" for="Email">Email:</label>

        <div class="col-xs-9">
            <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Please Enter Email ID" ValidationGroup="FedbckSubmit"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="FedbckSubmit" ControlToValidate="txtEmail" CssClass="requiredFieldValidateStyle"
                ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
            </asp:RegularExpressionValidator>
        </div>
    </div>
   
    <div class="form-group">
        <label class="control-label col-xs-3" for="phoneNumber">FeedBack Details:</label>
        <div class="col-xs-9">
            <asp:TextBox ID="txtFeedBack" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFeedBack"  ValidationGroup="FedbckSubmit" ForeColor="Red" ErrorMessage="Please Enter FeedBack"></asp:RequiredFieldValidator>

        </div>
    </div>


    <div class="form-group">
        <div class="col-xs-offset-3 col-xs-9">
            <label class="">
                Type out the verification key exactly as it appears in the image below. If you have trouble reading this image, refresh your browser to get a new key
            </label>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3" for="phoneNumber">Enter text:</label>
        <div class="col-xs-9">
            <cc1:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
                CaptchaHeight="60" CaptchaWidth="200" CaptchaMinTimeout="5" CaptchaMaxTimeout="240"
                FontColor="#D20B0C" NoiseColor="#B1B1B1" />

            <%--    <asp:ImageButton ID="ImageButton1" ImageUrl="../../images/refresh.gif" runat="server" CausesValidation="false" />--%>

            <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCaptcha"  ValidationGroup="FedbckSubmit" ForeColor="Red" ErrorMessage="Please Enter above text"></asp:RequiredFieldValidator>

            <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Invalid. Please try again." ValidationGroup="FedbckSubmit" OnServerValidate="ValidateCaptcha"
                runat="server" />
        </div>
    </div>
    <br>
    <div class="form-group">
        <div class="col-xs-offset-3 col-xs-9">
            <asp:Button ID="btnSubmitFeedbck" runat="server" class="btn btn-primary" Text="Submit" ValidationGroup="FedbckSubmit" OnClick="btnSubmitFeedbck_Click" />
            <asp:Button ID="btnResetFeedbck" runat="server" class="btn btn-default" Text="Reset" OnClick="btnResetFeedbck_Click" />
        </div>
    </div>
</div>
