<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" CodeFile="HomePageBanner.ascx.cs" Inherits="JSControls_Home_HomePageBanner" %>
<script src="/js/swipe.js"></script>
<style>



    .banner_fluid {
   padding-left:0;
   padding-right:0;
}

.carousel-control {
    position: absolute;
    top: 50%; /* pushes the icon in the middle of the height */
     z-index: 5;
    display: inline-block;
}

    @media only screen and (max-width:767px) {
        .carosual_widthright {
            /*width: 17%!important;*/
        }

        .carosual_widthleft {
            width: 1%!important;
        }

        .carousel-control {
            top: 22%!important;
        }
        .imgwidthright {
            width:35px;
        }
        .imgwidthleft {
            width:35px;
        }
    }
    /*.carousel-control.right {
        background-image: none!important;
        position: absolute;
        top: 40%;
        text-align: right;
        font-size: 7em;
        font-weight: normal !important;
        color:#00bcd4;
        padding-right: 50px !important;
    }

    .carousel-control.left {
        background-image: none!important;
        position: absolute;
        top: 40%;
        text-align: left;
        font-size: 7em;
        font-weight: normal !important;
        color: #00bcd4;
        padding-left: 50px !important;
    }*/
    .carosual_widthright {width:auto;    }
    .carosual_widthleft {width:1%!important;    }
</style>

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
                            <img class="second-slide" src='<%#Eval("ImageUrl")+"?scale=both&maxwidth=1877&maxheight=557"%>' /></a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div href="#carousel_slider" class="left carousel-control carosual_widthleft" data-slide="prev">
            <span>
                <img src="../../images/arrow_left.png" class="imgwidthleft" style="background-color:#00bcd4;"/>
            </span>
        </div>
        <div href="#carousel_slider" class="right carousel-control carosual_widthright" data-slide="next">
            <span>
                <img src="../../images/arrow_right.png" class="imgwidthright" style="background-color:#00bcd4;"/>
            </span>
        </div>
    </div>
</div>


     
</div>

 