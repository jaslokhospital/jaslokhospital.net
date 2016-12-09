<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Password.ascx.cs" Inherits="JSControls_Common_Password" %>
<style>
    .btnSub {
        margin-top: 10px;
        margin-left: 16px;
    }
   
</style>
<div style="padding-left: 663px; margin-top: 40px;">
    <table>
        <tr >
            <td >Enter Password:</td>
            <td >
                <asp:TextBox ID="txtPassword" runat="server" required="requied"></asp:TextBox></td>
        </tr>
        <tr >
            <td >
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1" CssClass="btnSub" /></td>
        </tr>
        <tr >
            <td ></td>
            <td ></td>
        </tr>
        
    </table><br />
   
        <asp:Label ID="lblPassword" runat="server" ForeColor="Green" ></asp:Label>
        
    </div>
<br /><br /><br /><br />