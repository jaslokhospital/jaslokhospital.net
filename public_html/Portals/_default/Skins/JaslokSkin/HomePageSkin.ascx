<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HomePageSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_HomePageSkin" %>

<%@ Register Src="~/JSControls/Home/HomePageBanner.ascx" TagName="HomePageBanner" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Home/BookAppointment.ascx" TagName="BookAppointment" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Home/HomePageSlider.ascx" TagPrefix="JS" TagName="HomePageSlider" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagPrefix="JS" TagName="Testimonials" %>
<%@ Register Src="~/JSControls/Home/WriteToUs.ascx" TagPrefix="JS" TagName="WriteToUs" %>
<%@ Register Src="~/JSControls/Home/PhotoGallery.ascx" TagPrefix="JS" TagName="PhotoGallery" %>
<%@ Register Src="~/JSControls/Home/VideoGallery.ascx" TagPrefix="JS" TagName="VideoGallery" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneFindDoctor.ascx" TagPrefix="JS" TagName="LeftPaneFindDoctor" %>

<div id="contentpaneHeader" runat="server"></div>
<JS:HomePageBanner runat="server" ID="HomePageBanner" />

<JS:BookAppointment ID="BookAppointment" runat="server" />

        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
            
                <div id="contentpane" runat="server"></div>
           
        </div>
<div class="row top">
    <div class="container containerspace">
        <JS:LeftPaneFindDoctor runat="server" ID="LeftPaneFindDoctor" />
        <JS:HomePageSlider runat="server" ID="HomePageSlider" />
    </div>
</div>
<JS:Testimonials runat="server" ID="Testimonials" />
<div class="row top top-bt">
    <div class="container containerspace">
        <JS:WriteToUs runat="server" ID="WriteToUs" />
        <JS:PhotoGallery runat="server" ID="PhotoGallery" />
        <JS:VideoGallery runat="server" ID="VideoGallery" />
    </div>
</div>
<JS:Footer runat="server" ID="Footer" />


