$.scrollUp({
    "scrollText": "回到顶部"
});


$("#j-go2list").click(function() {
    $("body, html").animate({
        "scrollTop": $("#j-list").offset().top
    });
});

var is_dive = 0;
$("#j-btn-night").click(function() {
    if (1 == is_dive) {
        is_dive = 0;
        $(".g-bd").removeClass('up-1000, down-1000').addClass('up-1000').css({
            "backgroundColor": "rgba(0,0,0,0.2)"
        });
        $(this).text('下潜1000米').animate({
            "top": "70px"
        }, 1000);
    } else {
        is_dive = 1;
        $(".g-bd").removeClass('up-1000, down-1000').addClass('down-1000').css({
            "backgroundColor": "rgba(7,7,7,0.7)"
        });
        $(this).text('上浮1000米').animate({
            "top": "400px"
        }, 1000);
    }
});

var $avator = $('#j-avatar');
var avator_src =  $avator.data('src');

$avator.css({'display': 'none'});

var img_loader = new Image();
img_loader.src = avator_src;
img_loader.onload = function() {
    $avator.attr('src', avator_src).fadeIn(300).parent().removeClass('infinite');
}