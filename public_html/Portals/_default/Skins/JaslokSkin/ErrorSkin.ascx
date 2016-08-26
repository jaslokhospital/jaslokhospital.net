<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ErrorSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_ErrorSkin" %>

<%@ Register Src="~/JSControls/Home/HomePageBanner.ascx" TagName="HomePageBanner" TagPrefix="JS" %>

<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>


<div id="contentpaneHeader" runat="server"></div>
<JS:HomePageBanner runat="server" ID="HomePageBanner" />



<div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">

    <div id="contentpane" runat="server"></div>

</div>
<div class="row top">
    <div class="container containerspace">
    </div>
</div>

<div class="row top top-bt">
    <div class="container containerspace"> 
        <h1 style="font-weight: 100; font-size: 4em; line-height: 1; font-family: inherit;">Sorry, as an error has occured</h1>
        <p style="line-height: 1.5; font-size: 1.5em; margin: 10px 0px 128px;">We're working on getting this fixed as soon as we can.</p>
    </div>

</div>
<JS:Footer runat="server" ID="Footer" />
