<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Password.ascx.cs" Inherits="JSControls_Common_Password" %>
<style>
    .btnSub
    {
        margin-top: 10px;
        margin-left: 16px;
    }
</style>
<div class="container">
    <div class="row">
        <div class="col-md-6 text-center" style="margin: 10%; margin-left: 25%;">
            <div class="input-group">
                <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Please enter your plain password for MailBox"
                    runat="server" required="requied"></asp:TextBox>
                <span class="input-group-btn">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1"
                        CssClass="btn btn-default" />
                </span>
            </div>
            <br />
            <asp:Label ID="lblPassword" runat="server"></asp:Label>
        </div>
    </div>
</div>
