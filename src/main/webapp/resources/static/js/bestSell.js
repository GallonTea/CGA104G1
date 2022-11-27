/*
 * Copyright (c) 2022. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

$(document).ready(function () {
    $('.response').slick({
        dots: true,
        infinite: true,
        speed: 500,
        slidesToShow: 4,
        slidesToScroll: 2,
        autoplay: true,
        autoplaySpeed: 5000,
        prevArrow: $('.prev'),
        nextArrow: $('.next'),
        appendDots: $('element'),
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    autoplaySpeed: 5000,
                    slidesToShow: 3,
                    slidesToScroll: 2,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 600,
                settings: {
                    autoplaySpeed: 4000,
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    autoplaySpeed: 3000,
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ]
    });

    /**
     * 自訂點擊事件
     * @Class .prev
     * @Class .next
     * 點擊時被景色改變
     * 離開時移除被景色
     * (hover 寫在 css)
     */

    $('.prev').click(function(){
        $(this).css("background-color", "rgba(255, 80, 80, 0.767)");
    })
    $('.prev').mouseleave(function(){
        $(this).css("background-color", "");
    })
    $('.next').click(function(){
        $(this).css("background-color", "rgba(255, 80, 80, 0.767)");
    })
    $('.next').mouseleave(function(){
        $(this).css("background-color", "");
    })
});
