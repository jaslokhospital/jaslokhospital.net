


$(document).ready(function () {
    $("#myBtn").click(function () {
        $("#myModal").modal();
    });
    $(function () {
        carouseller = new carousel('.carouseller');
    });
    //2
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

    //$(window).scroll(function () {
    //    var window_top = $(window).scrollTop() + 12; // the "12" should equal the margin-top value for nav.stick
    //    var div_top = $('#nav-anchor').offset().top;
    //    if (window_top > div_top) {
    //        $('nav.leftmenuweb').addClass('stick');
    //    } else {
    //        $('nav.leftmenuweb').removeClass('stick');
    //    }
    //});


    $("nav.leftmenuweb a").click(function (evn) {
        evn.preventDefault();
        $('html,body').scrollTo(this.hash, this.hash);
    });


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
    /*Middle/applyjaslokcarreer*/
    //$('.datePickerTextBoxAJC').jdPicker({
    //    date_format: "dd/MM/YYYY"
    //});

    /*s/dps*/
    if (window.location.pathname.toLowerCase() == "/corporate-profile/certifications") {
        $('#certification-banner-slider').bjqs({
            animtype: 'slide',
            width: 500,
            height: 757,
            responsive: true,
            randomstart: false
        });
    }
    $('.collapse').on('shown.bs.collapse', function () {
        $(this).parent().find(".fa-plus").removeClass("fa-plus").addClass("fa-minus");
    }).on('hidden.bs.collapse', function () {
        $(this).parent().find(".fa-minus").removeClass("fa-minus").addClass("fa-plus");
    });

    /*s/ips*/
    if ($(window).width() < 767) {
        $('#lispecialties').attr('href', '#');

        $('#licorporateProfile').attr('href', '#');

        $('#liinternational').attr('href', '#');
        $('#image-gallery').lightSlider({
            gallery: true,
            item: 1,
            slideMargin: 0,
            speed: 150,
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








});



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

function pageLoad() {
    $(function () {
        $('#datepicker1').datetimepicker();
    });
}
//2



if ($(window).width() > 991) {
    jQuery(function ($) {
        $('.navbar .dropdown').hover(function () {
            $(this).find('.dropdown-menu').first().stop(true, true).delay(250).slideDown();

        }, function () {
            $(this).find('.dropdown-menu').first().stop(true, true).delay(100).slideUp();

        });

        $('.navbar .dropdown > a').click(function () {
            location.href = this.href;
        });

    });
}

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

/**header*/

$(window).on('resize', function () {
    if ($(window).width() < 1025) {
        $('body').on("click touchstart", "#quick_connect01", function (e) {
            e.stopPropagation();
            $(".quick-connect-hover").toggle();
        });
    }
});
if ($(window).width() < 1025) {
    $('body').on("click touchstart", "#quick_connect01", function (e) {
        e.stopPropagation();
        $(".quick-connect-hover").toggle();
    });
}

$("#myBtn").click(function () {
    loadUserPopup();
});


function loadUserPopup() {
    $("#myModal").modal();
    var RawUrl = window.location.href.replace("http://" + document.domain + "/", "");
    if (RawUrl.toLowerCase() == "paymentresponse.aspx") {
        $("#litPopUpTitle").html("Login");
        $("#divLoginForm").show();
        $("#divForgotPassword").hide();
        $("#divOTPVerification").hide();
        $("#divSignUp").hide();
        $("#lblError").empty();

        $("#pSignUp").show();
        $("#pForgotPassWord").show();
        $("#pSignIn").hide();
        $("#pVerifyUser").show();
    }
    else {
        $("#litPopUpTitle").html("Login");
        $("#divLoginForm").show();
        $("#divForgotPassword").hide();
        $("#divOTPVerification").hide();
        $("#divSignUp").hide();
        $("#lblError").empty();

        $("#pSignUp").show();
        $("#pForgotPassWord").show();
        $("#pSignIn").hide();
        $("#pVerifyUser").show();
    }
    
}


var menu = $('.quick-connect-hover')

var timeout = 0;
var hovering = false;
menu.hide();
$('#quick_connect01')
    .on("mouseenter", function () {
        hovering = true;
        // Open the menu
        $('.quick-connect-hover')
            .stop(true, true)
            .slideDown(300);

        if (timeout > 0) {
            clearTimeout(timeout);
        }
    })
    .on("mouseleave", function () {
        resetHover();
    });

$(".quick-connect-hover")
    .on("mouseenter", function () {

        hovering = true;

        startTimeout();
    })
    .on("mouseleave", function () {
        resetHover();
    });

function startTimeout() {
    timeout = setTimeout(function () {
        closeMenu();
    }, 300);
};

function closeMenu() {
    if (!hovering) {
        $('.quick-connect-hover').stop(true, true).slideUp(300);
    }
};

function resetHover() {

    hovering = false;

    startTimeout();
};

$(function () {
    // Check the initial Poistion of the Sticky Header
    var stickyHeaderTop = $('#header').offset().top;

    $(window).scroll(function () {
        if ($(window).scrollTop() > stickyHeaderTop) {
            $('#header').css({ position: 'fixed', top: '0px' });
            $('#header').addClass("headerBorder");
            $('#stickyalias').css('display', 'block');
        } else {
            $('#header').css({ position: 'static', top: '0px' });
            $('#header').removeClass("headerBorder");
            $('#stickyalias').css('display', 'none');
        }
    });
});

function PermanentRegReminderBox() {
    $(document).ready(function () {
        $("#permenantRegistrationModal").modal();
    });

}

$(".online-payment a, .online-facilities a, .online-facilities ul li, .online-payment ul li").click(function () {
    var _value = $(this).attr("data-value");
    if (typeof _value !== typeof undefined && _value !== false) {
        selectOption1Change(_value);
        $(".mobile-menu").toggle();
        $(".mobile-toggle").toggleClass("down");
    }
});

function selectOption1Change(selectControl, hdnValue) {


    //alert(selectControl);
    var hdnUserId = document.getElementById("hdnUserId");
    var hdnRedirectUrl = document.getElementById("hdnRedirectUrl");
   
    var RawUrl = window.location.href.replace("http://" + document.domain + "/", "");
    if (RawUrl.toLowerCase() == "paymentresponse.aspx") {
       // var hdnUserId = document.getElementById("Header_hdnUserId");
      //  var hdnRedirectUrl = $('#<%= hdnRedirectUrl.ClientID %>') //document.getElementById("Header_hdnRedirectUrl");
        if (hdnUserId != null) {
            if (hdnUserId.value > 0) {
                if (selectControl != "") {
                    window.location.href = "/" + selectControl;
                }
            }
            else {
                hdnRedirectUrl.value = selectControl;

                $("#lblError").empty();
                $("#lblLoginError").empty();
                $('#txtLoginUsername').attr("value", "");
                $('#txtLoginPassword').attr("value", "");
                $("#lblLoginError").hide();
                loadUserPopup();
            }
        }
    }
    else if (selectControl == "consultationappointment/new" || selectControl == "consultationappointment/follow-up") {
        
        window.location.href = "/" + selectControl;
    }
    else if (selectControl == "#") {
    }
    else {       

        if (hdnUserId != null && hdnUserId.value > 0) {

            var MRNumber = document.getElementById("hdnMrNumberexist").value;
            if (selectControl == "bed-booking" || selectControl == "outstandingbillpayment" || selectControl == "health-check-up-comprehensive" || selectControl == "surgery-booking") {
                
                //alert(MRNumber);
                if (MRNumber == "NotExist") {
                    PermanentRegReminderBox();
                    return;
                }
                else {
                    window.location.href = "/" + selectControl;
                }
            }
            else if (selectControl == "PatientRegistration") {
                PermanentRegReminderBox();
                if (MRNumber != "NotExist") {
                    $("#permenantRegistrationModal .modal-body p").html("You are already a Registered Member on this Portal.");
                    $("#permenantRegistrationModal .modal-body p").next("p").hide();
                }
                return;
            }
            else {
                if (selectControl != "") {
                    window.location.href = "/" + selectControl;
                }
            }
        }
        else {
           
            hdnRedirectUrl.value = selectControl;
            $("#lblError").empty();
            $("#lblLoginError").empty();
            $('#txtLoginUsername').attr("value", "");
            $('#txtLoginPassword').attr("value", "");
            $("#lblLoginError").hide();
           
            loadUserPopup();
        }
    }

}

/*middle/leftfinddoctor*/
function ValHomeLPFD() {
    if (document.getElementById("ddlDoctorLPD").selectedIndex == 0) {
        alert("Please select Doctor");
        return false;
    }
}

/*Home/writetous*/
function ValidationWTU() {
    var txtname = document.getElementById("txtname").value;
    var textemail = document.getElementById("txtemail").value; 

    if ($('#radioWTU input[type=radio]:checked').val() != 'feedback' && $('#radioWTU input[type=radio]:checked').val() != 'complaint') {
        alert("Please select Feedback or Complaint option");
        return false;
    }
    else if (txtname == "" || textemail == "") {

        alert("Please enter Name and Email !");
        return false;
    }
    else
        return true;
}

/*middle/LPBA*/
function ValidationLPBA() {    
    //if ($(".app_doctor option:selected").index() > 0)
        //return true;
    if ($("#ddlSpecialtyLPB option:selected").index() > 0 && $("#ddlDoctorLPBA option:selected").index() > 0)
        return true;
    //else if ($("#ddlDoctorLPBA option:selected").index() > 0)
   //     return true;
    else {
        alert("Please select Specialty and Doctor name");
        return false;
    }
}
/*m/OSBP*/
function validateOSBPay() {
    if ($('#txtAmount').val() < 1) {
        alert('Amount should not be 0 ₹')
        return false;
    }

}
/*M/SB*/

function validateSURBooking() {
    if ($('#txtSurgeryFee').val() == null || $('#txtSurgeryFee').val() == "" || $('#txtSurgeryFee').val() == "Please select surgery above type") {
        alert("Please select surgery type first1");
        return false;
    }
    if ($('#txtSurgeryFee').val() < 10000) {
        alert('Minimum amount should be  10,000 ₹1')
        return false;
    }
}
$('.surgeryBookingRadio input[type=radio]').on('change', function () {
    $('input[type=radio]').not(this).prop('checked', false);
});
$(".surgeryBookingRadio input[type='radio']").on("change", function () {
    $('#txtSurgeryFee').val(this.value)
    $("#SurgeryFeeSB").val(this.value);
    $("#hdnFacilityNameSB").val(this.title);
    $("#hdnCategorySB").val(this.getAttribute("aria-valuetext"));

});
//$('#accordion .panel:first-child a span').addClass("fa fa-chevron-down");
/*home/healtchecup*/
function validateHCC() {
    if ($('#txtAdmissionCharge').val() == null || $('#txtAdmissionCharge').val() == "") {
        alert("Please select package type first");
        return false;
    }
}
/*s/bb*/
function validateBEDB() {
    if ($('#dnn_txtAdmissionCharge').val() == null || $('#dnn_txtAdmissionCharge').val() == "") {
        alert("Please select bed reservation type first");
        return false;
    }
    if ($('#dnn_txtAdmissionCharge').val() < 10000) {
        alert('Minimum amount should be  10,000 ₹')
        return false;
    }
}
function setRadioButtonBEDB(value, amount) {
    var radID = value.split(',');
    $('#dnn_txtAdmissionCharge').val(amount);
    $('#' + radID[0]).attr('checked', true);
}
$(".bed-reservation input[type='radio']").on("change", function () {
    $("[id^=spanPrice]").css("visibility", "hidden");
    $("#spanPrice" + $(this).attr("data-index")).css("visibility", "visible");
    $("#dnn_txtAdmissionCharge").val($(this).attr("aria-valuetext"));
    $("#dnn_hdnDepositBB").val($(this).attr("id") + "," + $(this).attr("title"));
});

/*s/ca || faa*/
function GetSelectedTextValue(drpAppointmentType) {
   
    var selectedText = drpAppointmentType.options[drpAppointmentType.selectedIndex].innerHTML;
   
    if (selectedText == "Follow-Up") {
        var id = document.getElementById("dnn_hdnfollowup").value;
        if (id != "") {
            divAppointmentType.style.display = 'block';
            document.getElementById("dnn_lblAppointmentType").innerHTML = id;
        }
    }
    else if (selectedText == "New") {
        var id = document.getElementById("dnn_hdnconsulting").value;
        if (id != "") {
            divAppointmentType.style.display = 'block';

            document.getElementById("dnn_lblAppointmentType").innerHTML = id;
        }
    }
    else {
        divAppointmentType.style.display = 'none';
    }
}
/*s/dos not reflecting*/
//function hidespeciality(fsspeciality) {
//    alert("hi");
//    $('.doctorcontent').hide();
//    $('#' + fsspeciality).show();
//}

/*s/sds*/
//function openPanel(val) {
//    $("#dnn_divcontentpane").hide();
//    $("#dnn_divcontentpaneSpecialty").hide();
//    $("#dnn_divFacilities").hide();

//    $("#dnn_divAboutActive").className = 'doc_attendence';
//    $("#dnn_divFacilitiesActive").className = 'doc_attendence';
//    $("#dnn_divOurSpecialty").className = 'doc_attendence';

//    //document.getElementById('imgAbout').style.display = 'none';
//    //document.getElementById('imgFacilities').style.display = 'none';
//    //document.getElementById('imgSpecialities').style.display = 'none';

//    if (val == 'About') {
//        $("#dnn_divcontentpane").show();
//        $("#dnn_divAboutActive").className = 'about_dept';
//        $("#dnn_h3subheader").innerHTML = "<b> - About the Department</b>";
//        //document.getElementById('imgAbout').style.display = 'block';

//    }
//    else if (val == 'Facilities') {
//        $("#dnn_divFacilities").show();
//        $("#dnn_divFacilitiesActive").className = 'about_dept';
//        $("#dnn_h3subheader").innerHTML = "<b> - Facilities & Services</b>";            //document.getElementById('imgFacilities').style.display = 'block';
//    }
    
//    else if (val == 'Specialist') {
//        $("#dnn_divcontentpaneSpecialty").show();
//        $("#dnn_divOurSpecialty").className = 'about_dept';
//        $("#dnn_h3subheader").innerHTML = "<b> - Our Specialists</b>";
//        //document.getElementById('imgSpecialities').style.display = 'block';
//    }
//}

/*s/ss*/
//function openSISPanel(val) {
//    $("#dnn_pnlMedicalSISkinPane").hide();
//    $("#dnn_PnlSpecialitySISP").hide();
//    $("#dnn_PnlPatientSISP").hide();

//    $('divmMedical').className = 'doc_attendence';
//    $('divSpecialty').className = 'doc_attendence';
//    $('divPatient').className = 'doc_attendence';

//    if (val == 'Medical') {

//        $("#dnn_pnlMedicalSISkinPane").show();
//        $("#dnn_h3header").innerHTML = "Medical Specialties";
//        $('divmMedical').className = 'about_dept';
//        equalheight('.equal');
//    }
//    else if (val == 'Specialty') {

//        $("#dnn_PnlSpecialitySISP").show();
//        $("#dnn_h3header").innerHTML = "Specialty Clinics";
//        $('divSpecialty').className = 'about_dept';
//        equalheight('.equal');
//    }
//    else if (val == 'Patient') {

//        $("#dnn_PnlPatientSISP").show();
//        $("#dnn_h3header").innerHTML = "Patient Facilities";
//        $("#divPatient").className = 'about_dept';
//        equalheight('.equal');
//    }
//}
/*for all*/
var specialKeys = new Array(); specialKeys.push(8); function Numeric(e) {
    var keyCode = e.which ? e.which : e.keyCode
    var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1); return ret;
}

