<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_LoginSkin" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/DesktopModules/Admin/Authentication/Login.ascx" TagPrefix="JS" TagName="login" %>

<div id="contentpaneHeader" runat="server"></div>
    <div class="CPane">
    <div id="ContentPane" runat="server">
        <JS:login runat="server" ID="login1" />
    </div>
</div>
<JS:Testimonials runat="server" ID="Testimonials1" />   
<JS:Footer runat="server" ID="Footer" />

   
 
   
 