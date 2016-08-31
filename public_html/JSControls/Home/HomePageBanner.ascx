<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" CodeFile="HomePageBanner.ascx.cs" Inherits="JSControls_Home_HomePageBanner" %>
<script src="/js/swipe.js"></script>
<script>
    $(document).ready(function () {
        $("#carousel_slider").swiperight(function () {
            $(this).carousel('prev');
        });
        $("#carousel_slider").swipeleft(function () {
            $(this).carousel('next');
        });
    });
</script>



<div class="container-fluid">

<div class="container-fluid banner_fluid">
    <div class="carousel slide" data-ride="carousel" id="carousel_slider">

        <div class="carousel-inner">
            <asp:Repeater ID="rptHomePagebanner" runat="server">
                <ItemTemplate>
                    <div class='<%# (Container.ItemIndex == 0) ? "item active" : "item" %>'>


                        <a id="A1" runat="server" target="_blank" href='<%#Eval("BannerLink")%>'>
                            <img class="second-slide" src='<%#Eval("ImageUrl")+"?scale=both&maxwidth=1877&maxheight=557"%>' alt='<%# "Slide" + (Container.ItemIndex + 1).ToString() %>' /></a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <a href="#carousel_slider" class="left carousel-control carosual_widthleft" data-slide="prev">
            <span>
                <img src="../../images/arrow_left.png" class="imgwidthleft" alt="homebanner_left" style="background-color:#00bcd4;"/>
            </span>
        </a>
        <a href="#carousel_slider" class="right carousel-control carosual_widthright" data-slide="next">
            <span>
                <img src="../../images/arrow_right.png" alt="homebanner_right" class="imgwidthright" style="background-color:#00bcd4;"/>
            </span>
        </a>
    </div>
</div>


     
</div>

 