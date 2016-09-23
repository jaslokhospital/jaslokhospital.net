<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InnerPhotoGallery.ascx.cs" Inherits="JSControls_MiddleContent_InnerPhotoGallery" %>

        
        <link rel="stylesheet" href="/Portals/_default/Skins/JaslokSkin/Styles/css/pgwslideshow.css" />
        <link rel="stylesheet" href="/Portals/_default/Skins/JaslokSkin/Styles/css/pgwslideshow.min.css" />
        <link rel="stylesheet" href="/Portals/_default/Skins/JaslokSkin/Styles/css/pgwslideshow_light.css" />
        <link rel="stylesheet" href="/Portals/_default/Skins/JaslokSkin/Styles/css/pgwslideshow_light.min.css" />

        <div class="search-form">
            <div class="form-horizontal well">
                <div class="input-group">
                    <label>Album  : </label>
                    <asp:DropDownList ID="dlAlbumCategory" runat="server" class="form-control" EnableViewState="true" ViewStateMode="Enabled">
                    </asp:DropDownList>
                </div>
                <div class="border-3"></div>
                <div class="border-3"></div>
                <div class="form-group">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-default btnstyle" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-default btnstyle" OnClick="btnReset_Click" />
                    <%--<button type="submit" name="submit" class="btn btn-default">Submit</button>
            <button type="reset" name="reset" class="btn btn-default">reset</button>--%>
                </div>
            </div>
        </div>
        <%-- <div class="row">
            <asp:Repeater ID="rptPHOTOGALLERY" runat="server">
                <ItemTemplate>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <img class="img-responsive center-block v1" src='<%#Eval("PhotoImageUrl")%>' alt='<%#Eval("PhotoImgAlternateText")%>' title='<%#Eval("PhotoTitle")%>'>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
           
        </div>--%>
   <%-- <asp:UpdatePanel ID="updatesPG" runat="server">
    <ContentTemplate>--%>
       <div class="demo col-md-10 col-xs-12 slider-space">
            
                    <ul class="pgwSlideshow">
                        <asp:Repeater ID="rptPHOTOGALLERY" runat="server">
                            <ItemTemplate>
                                <li>
                                    <img src='<%# Eval("PhotoImageUrl") + ".ashx?scale=both&maxwidth=775&maxheight=558" %>' title='<%#Eval("PhotoTitle")%>' alt='<%#Eval("PhotoDescription")%>' width='<%#Container.ItemIndex+1==0?"100%":"auto"%>' height='<%#Container.ItemIndex+1==0?"50%":"auto"%>'></li>                                    
                                 </ItemTemplate>
                        </asp:Repeater>                                             
                    </ul>
             <asp:Label ID="lblNoRec" runat="server" Text="No record found" Style="color: red; font-size: 16px; padding-left: 15px;" Visible="false"></asp:Label>
        </div>
   <%-- </ContentTemplate>
</asp:UpdatePanel>--%>
 

        <script src="/Portals/_default/Skins/JaslokSkin/Styles/js/pgwslideshow.min.js" defer="defer"></script>
        <script src="/Portals/_default/Skins/JaslokSkin/Styles/js/pgwslideshow.js"></script>
        
        <script>
            $(document).ready(function () {
                $('.pgwSlideshow').pgwSlideshow();
            });
           
		</script>