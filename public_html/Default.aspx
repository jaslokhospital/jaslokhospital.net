<%@ Page Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Framework.DefaultPage" CodeFile="Default.aspx.cs" EnableViewState="true" ViewStateMode="Enabled"%>
<%@ Register TagPrefix="dnncrm" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client"%>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Common.Controls" Assembly="DotNetNuke"%>
<asp:literal id="skinDocType" runat="server" Visible="false" />
<!DOCTYPE html>
<html <asp:literal id="attributeList" runat="server" EnableViewState="true" ViewStateMode="Enabled"></asp:literal>>
<head id="Head" runat="server">
    <asp:PlaceHolder runat="server" ID="metaPanel"></asp:PlaceHolder>
    <title />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, user-scalable=no" />
    <meta id="MetaRefresh" runat="Server" http-equiv="Refresh" name="Refresh" Visible="False" />
    <meta id="MetaDescription" runat="Server" name="DESCRIPTION" Visible="False"/>
    <meta id="MetaKeywords" runat="Server" name="KEYWORDS" Visible="False"/>
    <meta id="MetaCopyright" runat="Server" name="COPYRIGHT" Visible="False"/>
    <meta id="MetaGenerator" runat="Server" name="GENERATOR" Visible="False"/>
    <meta id="MetaAuthor" runat="Server" name="AUTHOR" Visible="False"/>
    <meta id="MetaRobots" runat="server" name="ROBOTS" Visible="False" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name = "format-detection" content = "telephone=no">
     <link rel="shortcut icon" href="/Portals/_default/Skins/JaslokSkin/Styles/images/favicon.png">
    <asp:PlaceHolder runat="server" ID="ClientDependencyHeadCss"></asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="ClientDependencyHeadJs"></asp:PlaceHolder>
    <asp:placeholder id="CSS" runat="server" />
    <asp:placeholder id="SCRIPTS" runat="server" />
    <link href="/Portals/_default/Skins/JaslokSkin/Styles/css/specialties-style.css" rel="stylesheet" /> 
    <link href="/Portals/_default/Skins/JaslokSkin/Styles/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="/Portals/_default/Skins/JaslokSkin/Styles/css/carousel.css?web" rel="stylesheet"> 
    <link rel="stylesheet"  href="/Portals/_default/Skins/JaslokSkin/Styles/css/lightslider.css"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/Portals/_default/Skins/JaslokSkin/Styles/css/datetimepicker.min.css" rel="stylesheet" />
    <link href="/Portals/_default/Skins/JaslokSkin/Styles/css/carouseller.css" rel="stylesheet" />
    <link href="/Portals/_default/Skins/JaslokSkin/Styles/css/style.css?web" rel="stylesheet">
    <link href="/Portals/_default/Skins/JaslokSkin/Styles/css/common.css" rel="stylesheet">
    <link href="/Portals/_default/Skins/JaslokSkin/Styles/css/responsive.css?web" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic,100" rel="stylesheet" />
    <link href="/Portals/_default/Skins/JaslokSkin/Styles/css/mobilemenu.css?web" rel="stylesheet" />
    <link href="/Portals/_default/Skins/JaslokSkin/Styles/css/sprite.css?web" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#Carousel').carousel({
                interval: 5000
            })

        });
    </script>
</head>
<body id="Body" runat="server">
               <!--[if (gte IE 8)&(lte IE 9)]>
            <style type="text/css">
            #dnn_BookAppointment_updatesB select { width: 46%; }
            </style>
            <![endif]-->
    
    <dnn:Form ID="Form" runat="server" ENCTYPE="multipart/form-data">
        <asp:PlaceHolder ID="BodySCRIPTS" runat="server" />
        <asp:Label ID="SkinError" runat="server" CssClass="NormalRed" Visible="False"></asp:Label>
        <asp:PlaceHolder ID="SkinPlaceHolder" runat="server" />
        <input id="ScrollTop" runat="server" name="ScrollTop" type="hidden" />
        <input id="__dnnVariable" runat="server" name="__dnnVariable" type="hidden" autocomplete="off" />
        <asp:placeholder runat="server" ID="ClientResourcesFormBottom" />
    </dnn:Form>
    <asp:placeholder runat="server" id="ClientResourceIncludes" />
    <dnncrm:ClientResourceLoader runat="server" id="ClientResourceLoader">
        <Paths>
            <dnncrm:ClientResourcePath Name="SkinPath" Path="<%# CurrentSkinPath %>" />
            <dnncrm:ClientResourcePath Name="SharedScripts" Path="~/Resources/Shared/Scripts/" />
        </Paths>
    </dnncrm:ClientResourceLoader>
        <script type="text/javascript">
            $(function () {
                carouseller = new carousel('.carouseller');
            });
	</script>    

    <script>
        $(document).ready(function () {
            $("#myBtn").click(function () {
                $("#myModal").modal();
            });
        });
    </script> 
    <script type="text/javascript">
        /*------------------------popup box  -----------------------------*/
        $(document).ready(function () {
            $('.video-play').click(function () {

                $('.popup-back, .popup-div').fadeIn();
            });

            $('.close').click(function () {
                $('.popup-back, .popup-div').fadeOut();
            });
            $('.popup-back').click(function () {
                $('.popup-back, .popup-div').fadeOut();
            });
        });
</script>

<%--<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/jquery-1.9.1.min.js"></script>--%>
<script src="/js/BookAppointment.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/bootstrap.min.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/lightslider.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/datetimepicker.min.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/carouseller.min.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/jquery.jcarousel.min.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/jquery.scrollto.js"></script>
<script src="/js/common.js"></script>

</body>
</html>


