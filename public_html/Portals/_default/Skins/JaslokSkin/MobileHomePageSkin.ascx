<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MobileHomePageSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_MobileHomePageSkin" %>

<%@ Register Src="~/JSControls/Mobile/MobileHeader.ascx" TagPrefix="JS" TagName="MobileHeader" %>
<%@ Register Src="~/JSControls/Home/HomePageBanner.ascx" TagName="HomePageBanner" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Home/BookAppointment.ascx" TagName="BookAppointment" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Home/HomePageSlider.ascx" TagPrefix="JS" TagName="HomePageSlider" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Home/WriteToUs.ascx" TagPrefix="JS" TagName="WriteToUs" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneFindDoctor.ascx" TagPrefix="JS" TagName="LeftPaneFindDoctor" %>

<JS:MobileHeader runat="server" ID="MobileHeader" />
<JS:HomePageBanner runat="server" ID="HomePageBanner" />
<div class="row top">
     
    <div class="container containerspace-mobile">
       
        <JS:BookAppointment ID="BookAppointment" runat="server" />
        <JS:LeftPaneFindDoctor runat="server" ID="LeftPaneFindDoctor" />
        <JS:HomePageSlider runat="server" ID="HomePageSlider" />
    </div>
</div>
<div style="height:40px;"></div>
<JS:Testimonials runat="server" ID="Testimonials" />
<div class="row top">
    <div class="container containerspace">
        <JS:WriteToUs runat="server" ID="WriteToUs" />
    </div>
</div>
<JS:Footer runat="server" ID="Footer" />
<div id="contentpane" runat="server"></div>


