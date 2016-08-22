<meta http-equiv="X-UA-Compatible" content="IE=edge" /><%@ Page Language="C#" AutoEventWireup="false" Inherits="DotNetNuke.Framework.DefaultPage" CodeFile="Default.aspx.cs" EnableViewState="true" ViewStateMode="Enabled"%>
<%@ Register TagPrefix="dnncrm" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client"%>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Common.Controls" Assembly="DotNetNuke"%>
<asp:literal id="skinDocType" runat="server" />
<html <asp:literal id="attributeList" runat="server" EnableViewState="true" ViewStateMode="Enabled"></asp:literal>>
<head id="Head" runat="server" >
    <asp:PlaceHolder runat="server" ID="metaPanel"></asp:PlaceHolder>
    <title />
	<meta name="viewport" content="width=device-width, initial-scale=1
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
         <link rel="shortcut icon" href="Portals/_default/Skins/JaslokSkin/Styles/images/favicon.png">
    <asp:PlaceHolder runat="server" ID="ClientDependencyHeadCss"></asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="ClientDependencyHeadJs"></asp:PlaceHolder>
    <asp:placeholder id="CSS" runat="server" />
    <asp:placeholder id="SCRIPTS" runat="server" />
    <link href="Portals/_default/Skins/JaslokSkin/Styles/css/specialties-style.css" rel="stylesheet" /> 
    <link href="Portals/_default/Skins/JaslokSkin/Styles/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="Portals/_default/Skins/JaslokSkin/Styles/css/carousel.css?web" rel="stylesheet"> 
    <link rel="stylesheet"  href="Portals/_default/Skins/JaslokSkin/Styles/css/lightslider.css"/>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="Portals/_default/Skins/JaslokSkin/Styles/css/datetimepicker.min.css" rel="stylesheet" />
    <link href="Portals/_default/Skins/JaslokSkin/Styles/css/carouseller.css" rel="stylesheet" />
    <link href="Portals/_default/Skins/JaslokSkin/Styles/css/style.css?web" rel="stylesheet">
    <link href="Portals/_default/Skins/JaslokSkin/Styles/css/responsive.css?web" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic,100" rel="stylesheet" />
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
</body>
</html>
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
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/bootstrap.min.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/lightslider.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/datetimepicker.min.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/carouseller.min.js"></script>
<script src="/Portals/_default/Skins/JaslokSkin/Styles/js/jquery.jcarousel.min.js"></script>
  <script src="/Portals/_default/Skins/JaslokSkin/Styles/js/jquery.scrollto.js"></script>
 
  <script type="text/javascript">   
      (function ($) {

          $(function () {
              var jcarousel = $('.jcarousel');
              jcarousel
                  .on('jcarousel:reload jcarousel:create', function () {
                      var carousel = $(this),
                          width = carousel.innerWidth();
                      if (width >= 479) {
                          width = width / 2;
                      } else if (width >= 350) {
                          width = width / 1;
                      }
                      carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
                  })
                  .jcarousel({
                      wrap: 'circular'
                  });
              $('.jcarousel-control-prev')
                  .jcarouselControl({
                      target: '-=1'
                  });
              $('.jcarousel-control-next')
                  .jcarouselControl({
                      target: '+=1'
                  });
              $('.jcarousel-pagination')
                  .on('jcarouselpagination:active', 'a', function () {
                      $(this).addClass('active');
                  })
                  .on('jcarouselpagination:inactive', 'a', function () {
                      $(this).removeClass('active');
                  })
                  .on('click', function (e) {
                      e.preventDefault();
                  })
                  .jcarouselPagination({
                      perPage: 1,
                      item: function (page) {
                          return '<a href="#' + page + '">' + page + '</a>';
                      }
                  });
          });
      })(jQuery);

	  function pageLoad()
	  {
		$(function () {
			  $('#datepicker1').datetimepicker();
		  });
	  }
	  
      $(document).ready(function () {
          
          $("#myBtn").click(function () {
              $("#myModal").modal();
          });
          $(function () {
              carouseller = new carousel('.carouseller');
          });
      });
            </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {
                $('#datepicker1').datetimepicker();
                $('#datepicker2').datetimepicker();

            });

            $("#myBtn").click(function () {
                $("#myModal").modal();
            });
            $(function () {
                carouseller = new carousel('.carouseller');
            });
        });
    </script> 
    <script type="text/javascript">
        if ($(window).width() < 767) {
            $('#lispecialties').attr('href', '#');

            $('#licorporateProfile').attr('href', '#');

            $('#liinternational').attr('href', '#');
            $('#image-gallery').lightSlider({
                gallery: true,
                item: 1,
                slideMargin: 0,
                speed:150,
                auto: true,
                loop: true,
                onSliderLoad: function () {
                    $('#image-gallery').removeClass('cS-hidden');
                }
            });
        } else {
            $('#image-gallery').lightSlider({
                gallery: true,
                item: 2,
                slideMargin: 0,
                speed: 150,
                auto: true,
                loop: true,
                onSliderLoad: function () {
                    $('#image-gallery').removeClass('cS-hidden');
                }
            });
        }
        $('#image-gallery2').lightSlider({
            gallery: true,
            item: 1,
            slideMargin: 0,
            speed: 150,
            auto: true,
            loop: true,
            onSliderLoad: function () {
                $('#image-gallery2').removeClass('cS-hidden');
            }
        });
        $('#image-gallery3').lightSlider({
            gallery: true,
            item: 1,
            slideMargin: 0,
            speed: 150,
            auto: true,
            loop: true,
            onSliderLoad: function () {
                $('#image-gallery3').removeClass('cS-hidden');
            }
        });
        $('#CertificateImage-gallery').lightSlider({
            gallery: true,
            item: 1,
            slideMargin: 0,
            speed: 150,
            auto: false,
            loop: true,
            onSliderLoad: function () {
                $('#CertificateImage-gallery').removeClass('cS-hidden');
            }
        });
        
      if ($(window).width() > 991) {
        jQuery(function($) {
            $('.navbar .dropdown').hover(function() {
                $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();

            }, function() {
                $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp();

            });

            $('.navbar .dropdown > a').click(function() {
                location.href = this.href;
            });

        });
      }
        /*---Right Side Find a doctor tab---*/
        $(function () {

            $('.finder').on('mouseover', function (event) {
                $('.sliding-doc-info').stop().animate({ "top": "-230" }, 800, "easeOutCubic");
            });


            $('#gotoDocTab').on('click', function (event) {
                $('.sliding-doc-info').stop().animate({ "top": "-230" }, 800, "easeOutCubic");
            });



            $('.side-slider').on('mouseover', function (event) {
                $('.side-slider').stop().animate({ "right": "-78" }, 800, "easeOutCubic");
                $('.for').stop().animate({ "padding": "1.5em" }, 1500, "easeOutCubic");
            });

            $('.side-slider').on('mouseleave', function (event) {
                $('.side-slider').stop().animate({ "right": "-368px" }, 800, "easeOutCubic", function () {
                    $('.for').stop().animate({
                        "padding-top": "1.5em",
                        "padding-right": "1.5em",
                        "padding-bottom": "1.5em",
                        "padding-left": "3em"
                    }, 500, "easeOutCubic");
                });
            });

        });
        $('.collapse').on('shown.bs.collapse', function () {
            $(this).parent().find(".fa-chevron-right").removeClass("fa-chevron-right").addClass("fa-chevron-down");
        }).on('hidden.bs.collapse', function () {
            $(this).parent().find(".fa-chevron-down").removeClass("fa-chevron-down").addClass("fa-chevron-right");
        });

        $(function(){ 
            
            $('.finder').on('mouseover', function(event){
                $('.sliding-doc-info').stop().animate({ "top" : "-230" }, 800, "easeOutCubic");
            });
            
            
            $('#gotoDocTab').on('click', function(event){
                $('.sliding-doc-info').stop().animate({ "top" : "-230" }, 800, "easeOutCubic");
            });
            
            
            
            $('.side-slider').on('mouseover', function(event){ 
                $('.side-slider').stop().animate({ "right" : "-78" }, 800, "easeOutCubic");
                $('.for').stop().animate({ "padding" : "1.5em"}, 1500, "easeOutCubic"); 		
            }); 
            
            $('.side-slider').on('mouseleave', function(event){ 
                $('.side-slider').stop().animate({ "right" : "-368px" }, 800, "easeOutCubic", function(){
                    $('.for').stop().animate({ 
                        "padding-top" : "1.5em", 
                        "padding-right" : "1.5em", 
                        "padding-bottom" : "1.5em", 
                        "padding-left" : "3em"
                    }, 500, "easeOutCubic");
                });
            }); 
        });
          
        $(document).ready(function () {

            /** 
             * This part does the "fixed navigation after scroll" functionality
             * We use the jQuery function scroll() to recalculate our variables as the 
             * page is scrolled/
             */
            $(window).scroll(function () {
                var window_top = $(window).scrollTop() + 12; // the "12" should equal the margin-top value for nav.stick
                var div_top = $('#nav-anchor').offset().top;
                if (window_top > div_top) {
                    $('nav.leftmenuweb').addClass('stick');
                } else {
                    $('nav.leftmenuweb').removeClass('stick');
                }
            });


            /**
             * This part causes smooth scrolling using scrollto.js
             * We target all a tags inside the nav, and apply the scrollto.js to it.
             */
            $("nav.leftmenuweb a").click(function (evn) {
                evn.preventDefault();
                $('html,body').scrollTo(this.hash, this.hash);
            });



            /**
             * This part handles the highlighting functionality.
             * We use the scroll functionality again, some array creation and 
             * manipulation, class adding and class removing, and conditional testing
             */
            var aChildren = $("nav.leftmenuweb li").children(); // find the a children of the list items
            var aArray = []; // create the empty aArray
            for (var i = 0; i < aChildren.length; i++) {
                var aChild = aChildren[i];
                var ahref = $(aChild).attr('href');
                aArray.push(ahref);
            } // this for loop fills the aArray with attribute href values

            $(window).scroll(function () {
                var windowPos = $(window).scrollTop(); // get the offset of the window from the top of page
                var windowHeight = $(window).height(); // get the height of the window
                var docHeight = $(document).height();

                for (var i = 0; i < aArray.length; i++) {
                    var theID = aArray[i];
                    var divPos = $(theID).offset().top; // get the offset of the div from the top of page
                    var divHeight = $(theID).height(); // get the height of the div in question
                    if (windowPos >= divPos && windowPos < (divPos + divHeight)) {
                        $("a[href='" + theID + "']").addClass("nav-active");
                    } else {
                        $("a[href='" + theID + "']").removeClass("nav-active");
                    }
                }

                if (windowPos + windowHeight == docHeight) {
                    if (!$("nav.leftmenuweb li:last-child a").hasClass("nav-active")) {
                        var navActiveCurrent = $(".nav-active").attr("href");
                        $("a[href='" + navActiveCurrent + "']").removeClass("nav-active");
                        $("nav.leftmenuweb li:last-child a").addClass("nav-active");
                    }
                }
            });
        });
</script>


<div class="side-slider" id="sideSlider">

            <a class="click_for finder" href=""></a>

            <ul class="sliding-doc-info clearfix" style="top: -230px;">
                <li class="for scheduling" style="min-height: 230px; padding: 1.5em;">
                                            <!-- <h3>Schedule an <font class="bold white">Appointment</font></h3>
                              <ul class="clearfix">
                                <li class="call">1-800-221-166</li>
                                <li> <a href="frmBookAnAppointment.aspx">Book An Appointment</a> </li>
                              </ul>-->
                </li>
                <li class="for finding" style="padding: 1.5em;">
                    <h3>Find a Doctor</h3>
                    <select id="dept" onchange="deptChange();">
                        <option value="-1" title="-select one-">Select Department</option>
                        <option value="Bariatric Surgery" title="Bariatric Surgery">Bariatric Surgery</option>
                        <option value="Blood Bank" title="Blood Bank">Blood Bank</option>
                        <option value="Cardiac Surgery" title="Cardiac Surgery">Cardiac Surgery</option>
                        <option value="Neonatology" title="Neonatology">Neonatology</option>
                        <option value="Neurology" title="Neurology">Neurology</option>
                        <option value="Neuro Surgery" title="Neurosurgery">Neuro Surgery</option>
                    </select>
                    <select id="doc" onchange="doctorChange();">
                        <option value="-1" title="Doctor Name">Doctor Name</option>
                    </select>
                    <a class="submit" href="javascript:;" onclick="findDoctor()">SUBMIT</a>
                    <div class="sid_bar1 pull-right">
                        <a href="#">Doctors' Directory</a>
                    </div>
                    <div class="clear"></div>
                </li>
                <li class="for manual" style="min-height: 230px; padding: 1.5em;">
                                            <!-- <h3>The RFH Mobile <br>Healthcare App</h3>
                              <a class="submit" href="rapp-manual.php">More</a>-->
                </li>
            </ul>
        </div>


