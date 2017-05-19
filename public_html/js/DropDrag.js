$.fn.dragDropPositions = function () {
    var _pos = $(this).attr("id");
    if (_pos != null) {
        _pos = _pos.substring(_pos.lastIndexOf("-") + 1, _pos.length);
        if ($(window).width() < 768) {
            $("#mobile-" + _pos).append($("#desktop-" + _pos).html());
            $("#desktop-" + _pos).html("");
        }
        else {
            return false;
        }
    }
}