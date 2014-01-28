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

    $("select#selected_course").change(function () {
        $.when(change_selected_course($(this).attr("data-url"), $(this).val())).done(function (a) {
            location.reload(true);
        });
    });
});

// Load the Welcome/SetSelectedCourse/[id] controller to change the course
function change_selected_course(url, course) {
    return $.ajax({
        url: url,
        type: "GET",
        data: { id: course }
    });
}

function OnSuccess(data) {
    alert('Success');
}
function OnFailure(data, textStatus) {
    var response = ajaxContext.get_response();
    var statusCode = response.get_statusCode();
    alert('Failure');
    $('#targetDiv').empty();
}
