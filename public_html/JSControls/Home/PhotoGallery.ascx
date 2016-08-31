<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PhotoGallery.ascx.cs" Inherits="JSControls_Home_PhotoGallery" %>
<div class="col-md-4 col-sm-4 col-lg-4 col-xs-12 slider-hm-base">
    <div class="demo demo-border">
        <div class="gallery-caption right_part"><h3 class="dnn_h3header">Photo Gallery</h3></div>
        <div class="item">

            <ul id="image-gallery2" class="gallery list-unstyled cS-hidden">
               
                <asp:Repeater ID="rptPhotogallery" runat="server">
                    <ItemTemplate>
                        
                        <li data-thumb="">
                            <a href="/photo-gallery.aspx">
                                <img class="second-slide" alt="<%# String.IsNullOrEmpty(Convert.ToString(Eval("PhotoTitle"))) ? Convert.ToString(Eval("AlbumTitle")) : Convert.ToString(Eval("PhotoTitle")) %>" src='<%#Eval("PhotoImageUrl")+"?scale=both&maxwidth=302&maxheight=201"%>'/>
                            </a>
                        </li> 
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
</div>

<%--<div class="col-md-4 col-sm-4 col-lg-4 col-xs-12 slider-hm-base">
    <div class="demo demo-border">
        <div class="gallery-caption right_part"><h3 class="dnn_h3header">Photo Gallery</h3></div>
        <div class="item">

            <ul id="image-gallery2" class="gallery list-unstyled cS-hidden">
               
                
                        <a href="/photo-gallery.aspx">
                        <li data-thumb="">
                            <img class="second-slide" src="/Content/PhotoGallery/DSC_6796.JPG?scale=both&maxwidth=302&maxheight=201"/>
                        </li>
                            </a>
                 <a href="/photo-gallery.aspx">
                        <li data-thumb="">
                            <img class="second-slide" src="/Content/PhotoGallery/DSC_046465.JPG?scale=both&maxwidth=302&maxheight=201"/>
                        </li>
                            </a>
                 <a href="/photo-gallery.aspx">
                        <li data-thumb="">
                            <img class="second-slide" src="/Content/PhotoGallery/DSC_0793.JPG?scale=both&maxwidth=302&maxheight=201"/>
                        </li>
                            </a>
                 <a href="/photo-gallery.aspx">
                        <li data-thumb="">
                            <img class="second-slide" src="/Content/PhotoGallery/IMG_6666.JPG?scale=both&maxwidth=302&maxheight=201"/>
                        </li>
                            </a>
                 <a href="/photo-gallery.aspx">
                        <li data-thumb="">
                            <img class="second-slide" src="/Content/PhotoGallery/img776.JPG?scale=both&maxwidth=302&maxheight=201"/>
                        </li>
                            </a>
                   
            </ul>
        </div>
    </div>
</div>--%>
