<%@ Control Language="C#" AutoEventWireup="true" CodeFile="JaslokWhatsNew.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_JaslokWhatsNew" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register Src="~/JSControls/Common/AdminHeader.ascx" TagPrefix="JS" TagName="AdminHeader" %>
<%@ Register Src="~/JSControls/Common/PressRelease.ascx" TagPrefix="JS" TagName="PressRelease" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/DesktopModules/JaslokAdmin/ManageWhatsNew.ascx" TagPrefix="WN" TagName="WhatsNew" %>
<JS:AdminHeader runat="server" ID="AdminHeader" />
<div class="row top">
    <div class="container">
        <div id="contentpane" runat="server"></div>
        <WN:WhatsNew runat="server" ID="WhatsNew1" />
    </div>
</div>
<JS:Footer runat="server" ID="Footer" />