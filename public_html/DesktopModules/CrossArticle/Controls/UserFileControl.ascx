<%@ Control Language="VB" AutoEventWireup="false" CodeFile="UserFileControl.ascx.vb"
    Inherits="Cross.UI.UserControls.UserFileControl" %>
<table cellspacing="0" cellpadding="0" border="0">
    <tr id="FileRow" runat="server">
        <td style="white-space: nowrap">
        
            <asp:Label ID="lblFolder" runat="server" EnableViewState="False" resourcekey="Folder"
                CssClass="NormalBold" />
            <asp:DropDownList ID="cboFolders" runat="server" AutoPostBack="True" CssClass="NormalTextBox"
                Width="300" />
            <br />
            <asp:Label ID="lblFile" runat="server" EnableViewState="False" resourcekey="File"
                CssClass="NormalBold" />
            <asp:DropDownList ID="cboFiles" runat="server" DataTextField="Text" DataValueField="Value"
                CssClass="NormalTextBox" Width="300" />
            <input id="txtFile" type="file" size="30" name="txtFile" runat="server" width="300"
                visible="false" />
            <br />
            <asp:LinkButton ID="cmdUpload" resourcekey="cmdUpload" CssClass="CommandButton" runat="server"
                CausesValidation="False" />
            <asp:LinkButton ID="cmdSave" resourcekey="cmdSave" CssClass="CommandButton" runat="server"
                CausesValidation="False" Visible="false" />&nbsp;&nbsp;
            <asp:LinkButton ID="cmdCancel" resourcekey="cmdCancel" CssClass="CommandButton" runat="server"
                CausesValidation="False"  Visible="false" />
        </td>
    </tr>
    <tr id="ErrorRow" runat="server" visible="false">
        <td>
            <asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="NormalRed" />
            <br />
        </td>
    </tr>
</table>
