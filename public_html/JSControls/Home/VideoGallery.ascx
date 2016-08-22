<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VideoGallery.ascx.cs" EnableViewState="false" Inherits="JSControls_Home_VideoGallery" %>

<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4 slider-hm-base">
    <div class="demo demo-border">
        <div class="gallery-caption right_part"><h3 class="dnn_h3header">Video Gallery</div>
        <div class="item">
            <ul id="image-gallery3" class="gallery list-unstyled cS-hidden">                
                <asp:Repeater ID="rptVideogallery" Visible="true" runat="server">
                    <ItemTemplate>
                        <a href="/video-gallery.aspx" runat="server">
                        <li data-thumb="">
                            <img src='<%#Eval("VideoThumbnail") %>' alt="Hospital Facilities" title="Hospital Facilities" />
                        </li>
                            </a>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
</div>

<%--<div class="col-md-4 col-lg-4 col-xs-12 col-sm-4 slider-hm-base">
    <div class="demo demo-border">
        <div class="gallery-caption right_part"><h3 class="dnn_h3header">Video Gallery</div>
        <div class="item">
            <ul id="image-gallery3" class="gallery list-unstyled cS-hidden">                
                
                        <a id="A1" href="/video-gallery.aspx" runat="server">
                        <li data-thumb="">
                            <img src="/Content/VideoThumbnailGallery/jaslok_home_video.jpg" alt="Hospital Facilities" title="Hospital Facilities" />
                        </li>
                            </a>
                   
            </ul>
        </div>
    </div>
</div>--%>



