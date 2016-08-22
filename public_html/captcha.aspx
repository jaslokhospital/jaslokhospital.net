<%@ Page Language="C#" AutoEventWireup="true" CodeFile="captcha.aspx.cs" Inherits="captcha" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
        <telerik:RadScriptManager ID="radscriptManager" runat="server"></telerik:RadScriptManager>
		<telerik:RadCaptcha ID="captch001" ForeColor="Red" EnableRefreshImage="true" ValidationGroup="vgCaptcha" ErrorMessage="Enter valid captcha" runat="server"></telerik:RadCaptcha>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="vgCaptcha" />
    </div>
    </form>
</body>
</html>
