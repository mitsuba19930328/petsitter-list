

// $(document).ready(function() {
//     // $("p").text("jQuery稼働テスト(稼働中)");
//     $('.top-search-form').addClass("outline-bottom: ");
    // $('.selected-menu').addClsass("background: gray");
//     $('.selected-menu').css({'background':'linear-gradient(to top, #f5f5f5, #FFF)','background':'gray'});
//     // $('.selected-menu').addClass("border: none");
// });
//

//topページのsearchformクリック時の動作
$(function(){
    $('#top-search-form-area').focus(function(){
        $('#top-search-form-area').addClass('top-search-outline');
    });

    $('#top-search-form-area').blur(function(){
        $('#top-search-form-area').removeClass('top-search-outline');
    });

    $('#top-search-form-keyword').focus(function(){
        $('#top-search-form-keyword').addClass('top-search-outline');
    });

    $('#top-search-form-keyword').blur(function(){
        $('#top-search-form-keyword').removeClass('top-search-outline');
    });
});
