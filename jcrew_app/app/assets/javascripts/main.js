$d = $(document);
$d.ready(function() {
    $s = $('.slider');
    $dim = $('.dimmer');
});


// Hover Effect on Navigation Bar Items

$(function(){
    $('.navbar-link').mouseenter(function(){
        $(this).addClass('hovered');
    });
    $('.navbar-link').mouseleave(function(){
        $(this).removeClass('hovered');
    });
});

// Sliding In/Out the Account Dropdown Menu

$(function(){
    $menu = $('.account-menu-div');
    $('#user').click(function(){
        toggleAccountMenu();
    });
});

function toggleAccountMenu() {
    $menu = $('.account-menu-div');
    var x = $('#user').offset();
    var width = $menu.width();
    if ($menu.is(':visible')){
            $menu.animate({opacity: 0, top:'2.5em'}, 'fast', function(){
            $menu.hide();
        });
    } else {
        $menu.css('left', x.left - width/2);
        $menu.css('opacity', '0');
        $menu.show();
        $menu.animate({opacity: 1, top:'3.2em'}, 'fast');
    }
}

// Hover Effect on Account Dropdown Menu Items

$(function (){
    $('.account-menu-item').mouseenter(function(){
        $(this).addClass('menu-item-highlighted');
    });
    $('.account-menu-item').mouseleave(function(){
        $(this).removeClass('menu-item-highlighted');
    });
});

// Slide Page to List Posts by Category

$(function (){
    $('.list-posts').click(function(){
        var $page = $('.container-container');
        if ($page.hasClass('slid')){
            $page.animate({top: '0em'}, 200);
            $page.removeClass('slid');
        } else {
            $page.animate({top: '5em'}, 200);
            $page.addClass('slid');
        }
    });
});

$(function(){
  $('.login-input').keyup(function(){
     $('.test').text($(this).val().simpleFormat);
  });
});

// Ask Before Deleting a Post

$(function (){
    $('.ask-delete').click(function(){
        var $dimmer = $('.dimmer');
        if ($dimmer.hasClass('display-none')){
            $dimmer.animate({opacity: 1}, 200);
            $dimmer.removeClass('display-none');
        } else {
            $dimmer.animate({opacity: 0}, 200);
            $dimmer.addClass('display-none');
        }
    });
});

$(function (){
    $('.cancel-delete').click(function(){
        var $dimmer = $('.dimmer');
        if ($dimmer.hasClass('display-none')){
            $dimmer.animate({opacity: 1}, 200);
            $dimmer.removeClass('display-none');
        } else {
            $dimmer.animate({opacity: 0}, 200, function(){
                $dimmer.addClass('display-none');
            });
        }
    });
});

// Includes Facebook SDK

window.fbAsyncInit = function() {
    FB.init({
      appId      : 'your-app-id',
      xfbml      : true,
      version    : 'v2.1'
    });
};

(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
