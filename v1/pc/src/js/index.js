/**
 * 居中定位
 */
var $win = $(window);
var $bd = $("#j-bd");
$win.bind('resize load', function() {
    $bd.css({
        "top": ($win.height() - $bd.height()) / 2
    }).fadeIn(600);
});


/**
 * 鼠标滚动检测
 */
// window.onmousewheel = document.onmousewheel = function(e) {
//  console.log(e);
// }

/**
 * 分页代码
 */
var card_html = $('#j-card');
var page_each = DATA.page_each;
var page_total = DATA.page_total;
var list = DATA['list'];
var page = DATA.page_init;
var timer = [];

function get_page(page, list) {
    var compiled = _.template($("#tpl").html());
    var array = []; // 当前页文章列表数据
    var append_item = function(i) {
            var item = list[i];
            var html = compiled(item);
            $("#j-list").append(html);
        }
        // 总页数
    $('#j-count-page').text(page_total);
    // 分页
    for (k in timer) {
        // console.log(timer[k]);
        clearTimeout(timer[k]);
    }

    if (0 == page) {
        // 第一页
        $("#j-list").html(card_html);
        for (var i = 0; i < page_each - 1; i++) {
            (function(i) {
                var timeout = 200 * i;
                timer_cell = setTimeout(function() {
                    append_item(i)
                }, timeout);
                timer.push(timer_cell);
            })(i);
        }
        $("#j-current-page").html(page + 1);
    } else if (page_total > page) {
        // 第二页 ~ 最后一页
        $("#j-list").empty();
        for (var i = 0; i < page_each; i++) {
            (function(i) {
                var id = page_each * page + i - 1;
                var timeout = 200 * i;
                timer_cell = setTimeout(function() {
                    append_item(id)
                }, timeout);
                timer.push(timer_cell);
            })(i);
        }
        $("#j-current-page").html(page + 1);
    } else {
        console.log('错误, 代码1。');
    }
}

get_page(page, list);

$("#j-page-next").click(function() {
    if (page_total - 1 > page) {
        page++;
        get_page(page, list);
    }
});

$("#j-page-prev").click(function() {
    if (0 < page) {
        page--;
        get_page(page, list);
    }
});

$("body").mousewheel(function(event, delta) {
    // console.log(event, delta)
    if (0 < delta) {

        if (0 < page) {
            page--;
            get_page(page, list);
        }
    } else {
        if (page_total - 1 > page) {
            page++;
            get_page(page, list);
        }
    }
});



/**
 * 下潜按钮
 */
! function dive() {
    var is_dive = 0;
    $("#j-btn-night").click(function() {
        if (1 == is_dive) {
            is_dive = 0;
            $("#j-shadow").removeClass('up-1000, down-1000').addClass('up-1000').css({
                "backgroundColor": "rgba(0,0,0,0)"
            });
            $(this).text('下潜1000米').animate({
                "top": "70px"
            }, 1000);
        } else {
            is_dive = 1;
            $("#j-shadow").removeClass('up-1000, down-1000').addClass('down-1000').css({
                "backgroundColor": "rgba(7,7,7,0.7)"
            });
            $(this).text('上浮1000米').animate({
                "top": "400px"
            }, 1000);
        }
    });
}();

/*头像loading*/
var $avator = $('#j-avatar');
var avator_src = $avator.data('src');

$avator.css({
    'display': 'none'
});

var img_loader = new Image();
img_loader.src = avator_src;
img_loader.onload = function() {
    $avator.attr('src', avator_src).fadeIn(300)
}

$avator.parents().one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
    $avator.parents().removeClass('animated rotate infinite');
});
