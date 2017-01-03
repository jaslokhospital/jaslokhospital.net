<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PasswordSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_PasswordSkin" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Common/Password.ascx" TagPrefix="JS" TagName="Password" %>

<div id="contentpaneHeader" runat="server"></div>
    <div class="CPane">
    <div id="ContentPane" runat="server">
        <JS:Password runat="server" ID="login1" />
    </div>
</div>

<JS:Footer runat="server" ID="Footer" />
