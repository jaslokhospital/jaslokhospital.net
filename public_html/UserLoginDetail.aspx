<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserLoginDetail.aspx.cs" Inherits="UserLoginDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>User Login Detail</h1>
        Please Enter Mobile Number below
        <asp:TextBox ID="txtMobileNumber" runat="server"></asp:TextBox><br />
        <asp:Button ID="btngetDetail" runat="server" Text="Get Detail" OnClick="btngetDetail_Click" /><br />
        <asp:Panel ID="pnloginDetail" runat="server" Visible="false">
            <table>
                <tr>
                    <td>
                        <b>OTP Code: </b>
                    </td>
                    <td>
                        <asp:Label ID="lblOTPCode" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Username: </b>
                    </td>
                    <td>
                        <asp:Label ID="lblUsername" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Password: </b>
                    </td>
                    <td>
                        <asp:Label ID="lblPAssword" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
    </div>
    </form>
</body>
</html>
