// var day_of_week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
var disabled_are_hidden = 1;

function toggle_entity_enabled(entity_id, post_action) {
    var entity_row      = $("#tr_" + entity_id);
    var row_is_disabled = entity_row.hasClass("disabled_entity");
    var row_toggle_link = entity_row.find(".enable_disable_link");
    
    if (row_is_disabled) {
        entity_row.removeClass('disabled_entity');
        row_toggle_link.text("disable");
    }
    else {
        entity_row.addClass('disabled_entity');
        if (disabled_are_hidden) entity_row.hide();
        row_toggle_link.text("enable");
    }

    $.ajax({
        url: post_action,
        type: "POST",
        data: { id: entity_id }
    });
}

$(window).load(function () {
    $('.disabled_entity').hide();
    $('.disabled_entity').find(".enable_disable_link").text('enable');
    
    $("#show_hide_button").toggle(
      function () {
        $(this).text("hide disabled");
        $('.disabled_entity').show();
        disabled_are_hidden = 0;
      },
      function () {
        $(this).text("show all");
        $('.disabled_entity').hide();
        disabled_are_hidden = 1;
      }
    );
    
});

$(document).ready(function () {
    $(".tablesorter").tablesorter();
}
);


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

    function OnSuccess(data) {
        alert('Success');
    }
    function OnFailure(data, textStatus) {
        var response = ajaxContext.get_response();
        var statusCode = response.get_statusCode();
        alert('Failure');
        $('#targetDiv').empty();
    }
