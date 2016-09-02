($.fn.dragDropPositions = function () {
    var _pos = $(this).attr("id");
    if (_pos != null) {
        _pos = _pos.substring(_pos.lastIndexOf("-") + 1, _pos.length);
        if ($(window).width() < 720) {
            $("#mobile-tablet-" + _pos).append($("#desktop-" + _pos).html());
         
            $("#desktop-" + _pos).html("");
           
        }
        else {
            $("#desktop-" + _pos).append($("#mobile-tablet-" + _pos).html());
            $("#mobile-tablet-" + _pos).html("");
           
        }
    }
 });
$(function () {

    $("#desktop-position1").dragDropPositions();
 
});
$(window).on("orientationchange", function () {
    //location.reload();
    $("#desktop-position1").dragDropPositions();


});