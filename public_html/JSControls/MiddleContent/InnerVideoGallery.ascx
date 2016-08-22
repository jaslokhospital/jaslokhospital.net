<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InnerVideoGallery.ascx.cs" Inherits="JSControls_MiddleContent_InnerVideoGallery" %>
<%--<asp:UpdatePanel ID="updatesPG" runat="server">
                <ContentTemplate>
<div class="row">
    <asp:Repeater ID="rptVideoGALLERY" runat="server">
        <ItemTemplate>

           <div class="col-md-6 col-sm-6 col-xs-12">
                    <a class="player" style="height: 300px; width: 300px; display: block" href='<%# Eval("VideoUrl") %>'>
        </a>
                <p><%# Eval("VideoTitle") %></p>
            </div>


        </ItemTemplate>
    </asp:Repeater>
</div>
 </ContentTemplate>
            </asp:UpdatePanel>--%>



<script type='text/javascript' src='../../Portals/_default/Skins/JaslokSkin/Styles/js/amazingslider.js'></script>
<style>
    ul {
        padding: 0;
    }

    .ps-current .ps-prev {
        display: none !important;
    }
    .ps-current .ps-next {
        display: none !important;
    }
</style>
<div class="row">

    <div class="demo col-md-offset-1 col-md-10 col-xs-12 vd-slider-space">

        <div class="demo-slider-3">
            <div id="amazingslider-12" style="display: block; position: relative; margin: 0px auto 0px;">
                <ul class="amazingslider-slides" style="display: none;">
                    <asp:Repeater ID="rptVideoGALLERY" runat="server">
                        <ItemTemplate>
                            <li>
                                <a class="player" href='<%# Eval("VideoUrl") %>'>
                                    <img src='<%# Eval("VideoThumbnail") %>' />

                                </a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <ul class="amazingslider-thumbnails" style="display: none;">                   
                        <asp:Repeater ID="rptinnerVideoGALLERY" runat="server">
                        <ItemTemplate>
                            <li>
                                <a class="player" href='<%# Eval("VideoUrl") %>'>
                                    <img src='<%# Eval("VideoThumbnail") %>' />
                                </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <script src="../../Portals/_default/Skins/JaslokSkin/Styles/js/initslider.js"></script>
        </div>
    </div>
</div>
<script src="../../FlowPlayer/flowplayer-3.2.12.min.js"></script>

<script type="text/javascript">
    flowplayer("a.player", "../../FlowPlayer/flowplayer-3.2.16.swf", {
        plugins: {
            pseudo: { url: "../../FlowPlayer/flowplayer.pseudostreaming-3.2.12.swf" }
        },
        clip: { provider: 'pseudo', autoPlay: false },
    });

</script>
<style>
    .dnnSortable {
        min-height: 0px;
    }
</style>
<script>
    $(document).ready(function () {
        $("#myBtn").click(function () {
            $("#myModal").modal();
        });
    });
    $(function () {
        carouseller = new carousel('.carouseller');
    });
</script>
