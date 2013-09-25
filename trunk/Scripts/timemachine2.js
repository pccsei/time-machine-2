var disabled_hidden = 1;

function toggle_user_status(user_id) {
    var user_row = $("#tr_" + user_id);
    var disabled = user_row.hasClass("disabled_user");
    var toggle_link = user_row.find(".enable_disable_link");
    
    if (disabled) {
        user_row.removeClass('disabled_user');
        toggle_link.text("disable");
    }
    else {
        user_row.addClass('disabled_user');
        if (disabled_hidden) user_row.hide();
        toggle_link.text("enable");
    }

    $.ajax({
        url: "UserToggleEnabled/",
        type: "POST",
        data: { user_id: user_id }
    });
}

$(window).load(function () {
    console.log("helloe");
    $('.disabled_user').hide();
    $('.disabled_user').find(".enable_disable_link").text('enable');
    
    $("#show_hide_button").toggle(
      function () {
        $(this).text("hide disabled");
        $('.disabled_user').show();
        disabled_hidden = 0;
      },
      function () {
        $(this).text("show all");
        $('.disabled_user').hide();
        disabled_hidden = 1;
      }
    );
    
});


// var show_disabled = 0;

// function toggle_user_status(user_id) {
    // var user_row = $("#tr_" + user_id);
    // if (user_row.class == "disabled_user") {
        // user_row.removeClass('disabled_user');
    // }
    // else {
        // user_row.addClass('disabled_user');
        // if (!show_disabled) user_row.toggle();
    // }

    // $.ajax({
        // url: "UserToggleEnabled/",
        // type: "POST",
        // data: { user_id: user_id }
    // });
// }

// $(window).load(function () {
    // $('.disabled_user').hide();
    // $("#toggle_disabled_teachers").click(function () {
        // $('.disabled_user').toggle();
        // show_disabled = show_disabled ^ 1;
    // });
// });


