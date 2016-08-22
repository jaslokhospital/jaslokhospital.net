<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Complaint.ascx.cs" Inherits="JSControls_MiddleContent_Complaint" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>



<%--<div id="Para">
            <div id="ContentPlaceHolder1_FB_Form1_divIntroText_1" style="display: ;">
                The fields marked as
                <span class="red">*</span>
                are mandatory
            <table>
                <tr>
                    <td>Name<span style="color: #ff0000; font-size: 13px">*</span>
                    </td>
                    <td width="70%">
                         </td>
                </tr>               
                <tr>
                    <td width="20%">Email Id
                        <span style="color: #ff0000; font-size: 13px">*</span>
                    </td>
                    <td width="70%">
                       
                       
                    </td>
                </tr>
                <tr>
                    <td width="20%">Complaint Details
                        <span style="color: #ff0000; font-size: 13px">*</span>
                    </td>

                    <td width="70%">
                        <asp:TextBox ID="txtComplaint" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQues" runat="server" ControlToValidate="txtComplaint" ForeColor="Red" ErrorMessage="Please Enter FeedBack"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="SaveComplaint" />
                            </td>
                            <td class="btn">
                                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click1"   />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>--%>


<div class="">
    <div class="form-group">
        <label class="control-label col-xs-3" for="Name">Name:</label>
        <div class="col-xs-9">
            <%--  <input type="text" class="form-control" id="Name" placeholder="Name">--%>
            <asp:TextBox ID="txtName" type="text" class="form-control" MaxLength="200" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNm" ControlToValidate="txtName" runat="server" ForeColor="Red" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revnm" runat="server" ControlToValidate="txtName" ValidationExpression="[a-zA-Z]+" ForeColor="Red" ErrorMessage="Please Enter only alphabate"></asp:RegularExpressionValidator>

        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3" for="Email">Email:</label>

        <div class="col-xs-9">
            <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Please Enter Email ID"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter Valid Email ID" ValidationGroup="vgSubmit" ControlToValidate="txtEmail" CssClass="requiredFieldValidateStyle"
                ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
            </asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-3" for="phoneNumber">Complaint Details:</label>
        <div class="col-xs-9">
            <asp:TextBox ID="txtComplaint" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvQues" runat="server" ControlToValidate="txtComplaint" ForeColor="Red" ErrorMessage="Please Enter FeedBack"></asp:RequiredFieldValidator>

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
            <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Invalid. Please try again." OnServerValidate="ValidateCaptcha"
                runat="server" />
        </div>
    </div>
    <br>
    <div class="form-group">
        <div class="col-xs-offset-3 col-xs-9">
            <%-- <asp:Button ID="btnSubmitComp" runat="server" class="btn btn-primary" Text="Submit" OnClick="btnSubmitComp_Click" />--%>
            <asp:LinkButton ID="btnSubmitComp" runat="server" OnClick="btnSubmitComp_Click">Submit</asp:LinkButton>
              <asp:LinkButton ID="btnResetComp" runat="server" OnClick="btnResetComp_Click">Reset</asp:LinkButton>
            <%--<asp:Button ID="" runat="server" class="btn btn-default" Text="Reset" OnClick="btnResetComp_Click" />--%>
        </div>
    </div>
</div>
