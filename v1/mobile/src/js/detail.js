$.scrollUp({
    "scrollText": "回到顶部"
});
/* 懒加载 */
$("article").find(".lazy").lazyload({
    effect: "fadeIn"
});

$('#j-cover').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
	$(this).fadeOut(1000);
});

// var myElement = document.querySelector("header");
// var headroom = new Headroom(myElement, {
//     // vertical offset in px before element is first unpinned
//     offset: 0,
//     // scroll tolerance in px before state changes
//     tolerance: 0,
//     // or you can specify tolerance individually for up/down scroll
//     tolerance: {
//         up: 5,
//         down: 0
//     },
//     // css classes to apply
//     classes: {
//         // when element is initialised
//         initial: "animated",
//         // when scrolling up
//         pinned: "fadeInDown",
//         // when scrolling down
//         unpinned: "fadeOutUp",
//         // when above offset
//         top: "headroom--top",
//         // when below offset
//         notTop: "headroom--not-top"
//     }
// });
// headroom.init();
