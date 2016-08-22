<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InnerPagesSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_InnerPagesSkin" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register Src="~/JSControls/Common/AdminHeader.ascx" TagPrefix="JS" TagName="AdminHeader" %>
<%@ Register Src="~/JSControls/Common/PressRelease.ascx" TagPrefix="JS" TagName="PressRelease" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>

<JS:AdminHeader runat="server" ID="AdminHeader" />

<div class="row top">
    <div class="container">
        <div id="contentpane" runat="server"></div>
        <%--<div id="FooterSection" runat="server" visible="false">
            <center>
            <h2 style="color:#009999;">
            Welcome At Jaslok </h2></center>

            <span style="font-family: lucida sans unicode,lucida grande,sans-serif; color: #009999; font-weight: bold; font-size: 12px">Jaslok Hospital was set up in 1973 with a very simple mission. Our founders, Jasoti and Lokoomal Chanrai, wanted to ensure that we provide the best possible medical care using state-of-the-art technology to every single patient, irrespective of their social background or financial ability.
 
        Fortyone years after Jaslok's inception, I am happy to report that we strive every single day to live up to these goals. We  attract the best doctors who are internationally renowned in their field of expertise but still demonstrate empathy and care. The most compassionate and well-trained nurses are chosen so that every patient receives the best care. We  identify and install cutting-edge technology to help diagnose and cure the most complex and challenging illnesses. We have endeavoured to streamline our hospital processes so that the patient experience is paramount, from the time they check in to the time they are discharged.
 
        I look forward to your comments and suggestions as we strive to continually improve every aspect of our hospital and patient experience.
            </span>
        </div>--%>
    </div>
</div>
<JS:Footer runat="server" ID="Footer" />


