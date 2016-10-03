<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ResearchPapersSkin.ascx.cs" Inherits="Portals__default_Skins_JaslokSkin_ResearchPapersSkin" %>
<%@ Register Src="~/JSControls/Common/Testimonials.ascx" TagName="Testimonials" TagPrefix="JS" %>
<%@ Register Src="~/JSControls/Common/Footer.ascx" TagPrefix="JS" TagName="Footer" %>
<%@ Register Src="~/JSControls/MiddleContent/LeftPaneBookAppointment.ascx" TagPrefix="JS" TagName="LeftPaneBookAppointment" %>
<%@ Register Src="~/JSControls/MiddleContent/InnerTestimonials.ascx" TagPrefix="JS" TagName="InnerTestimonials" %>
<%@ Register Src="~/JSControls/Common/LeftNavigation.ascx" TagPrefix="JS" TagName="LeftNavigation" %>


<div id="contentpaneHeader" runat="server"></div>

<div class="row">
    <div class="container containerspace">
        <ul class="breadcrumb">
            <li><a href="/">Home</a></li>
            <li><a id="rootbreadcrumb" runat="server" class="active" href="javascript:void(0);"><span id="MainRoot" runat="server">Education & Research</span></a></li>
            <li class="active" id="Subrootbreadcrumb" runat="server"><a id="SubRootAnchor" class="active" runat="server" href="javascript:void(0);"><span id="SubRootSpan" runat="server">Estimate request</span></a></li>
        </ul>
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
            <div class="left_part">
                <JS:LeftNavigation ID="leftNav" runat="server" />

                <div class="left_form hidden-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment1" />
                </div>
            </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
            <div class="right_part">

                <h1 id="h3header" runat="server"></h1>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="search-form">
                    <asp:Repeater ID="rptResearchPapers" runat="server">
                        <ItemTemplate>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <img class="img-responsive" src='<%#Eval("ThumbnailImageURL")%>' alt='<%#Eval("ThumbnailImage")%>' title='<%#Eval("ThumbnailImage")%>'>
                                <div class="appreciation_title">
                                    '<%#Eval("Title")%>'
                                    <br />
                                </div>
                                <div class="appreciation_view">
                                    <a href='<%#Eval("ResearchPaperPDFURL")%>' target="_blank" data-toggle="modal">
                                        <em class="glyphicon glyphicon-eye-open"></em>View
                                    </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                    <div id="contentpane" runat="server" style="width: 100%"></div>

                    <asp:Panel ID="divcontentpane" runat="server"></asp:Panel>

                </div>
                <div class="left_form hidden-lg visible-xs">
                    <JS:LeftPaneBookAppointment runat="server" ID="LeftPaneBookAppointment" />
                </div>
            </div>
        </div>
    </div>
</div>

<!-- testimonail start -->
<JS:Testimonials runat="server" ID="Testimonials" />
<!-- Testimonial end -->

<JS:Footer runat="server" ID="Footer" />
