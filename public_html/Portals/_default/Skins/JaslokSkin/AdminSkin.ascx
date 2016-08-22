<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_AdminSkin" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>


<div id="divLayout">
    <div id="divHeader" class="pageheader">      
          <a id="A1" href="/JaslokAdmin/home" runat="server"><img src="../images/jaslok/jaslok_logo.jpg" class="jasloklogo" /></a>
    </div>
  
    <div runat="server" id="ContentPane" class="AdminLoginSection">

    </div>
</div>
<style>
    #divLayout {
        width:600px;
        left: 25%;
        top:5%;
        position:absolute;
    }
    .AdminLoginSection{
        position: relative;
        margin-top:5%;
    }

    .dnnActionMenuBorder {
        opacity: 1 !important;
        border: 1px solid rgb(204, 204, 204) !important;
    }
</style>
<%--<dnn:DnnJsInclude ID="DnnJsInclude3" runat="server" FilePath="~/Resources/Scripts/jquery-1.10.2.min.js" />
<dnn:DnnJsInclude runat="server" FilePath="jquery.cycle.min.js" PathNameAlias="SkinPath" />--%>
<%--<dnn:DnnJsInclude runat="server" FilePath="DNNMega/jquery.dnnmega.debug.js" PathNameAlias="SkinPath" />
<dnn:DnnCssInclude runat="server" FilePath="DNNMega/dnnmega.css" PathNameAlias="SkinPath" />
<dnn:DnnJsInclude runat="server" FilePath="~/Resources/Shared/Scripts/jquery/jquery.hoverIntent.min.js" />--%>
