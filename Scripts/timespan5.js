var date_format = "{Dow} {Mon} {dd} {year} {h}:{mm} {tt}";

$(window).load(function () {

  $("#time_suggestions li a").click(function () {
    $("#timespan").val($(this).text());
    interpret_timespan($("#timespan").val());
    $("#timespan").focus();
  });

  $("#timespan").keyup(function () { interpret_timespan($("#timespan").val()) });

});

function populate_edit_fields()
{
  var begin_time = Date.create($("#entry_begin_time").val());
  var end_time = Date.create($("#entry_end_time").val());
  var total_hours = (end_time.minutesSince(begin_time) / 60).toFixed(2);
  
  var begin_string = begin_time.format(date_format);
  var end_string = end_time.format(date_format);

  $(".begin_time").val(begin_time.format(date_format));
  $(".end_time").val(end_time.format(date_format));
  $("#timespan").val(begin_time.format("{M}/{dd}/{yy} {h}:{mm} {tt}") + " - " + end_time.format("{M}/{dd}/{yy} {h}:{mm} {tt}"));
  $("#total_hours").val(total_hours);
}

function interpret_timespan(input)
{
  var O_DAY = 2;
  var O_TIME = 3
  var O_MIN = 4;
  var O_AMPM = 5;

  var DAY = 0;
  var TIME = 1;
  var AMPM = 2;

  var time_pattern = /(\d{1,2}(:\d{2})?)\s*([AaPp]\.?[Mm]?\.?)?/;
  var day_pattern = /(([^:-]*?)\s+)?/;
  var parse_re = new RegExp("^" + day_pattern.source + time_pattern.source + "$");

  var o_begin_pattern = /^\s*([^-]+?)\s*(-|$)/;
  var o_end_pattern = /-\s*([^-]+?)\s*$/;
  var o_begin_match = o_begin_pattern.test(input) ? o_begin_pattern.exec(input)[1] : "";
  var o_end_match = o_end_pattern.test(input) ? o_end_pattern.exec(input)[1] : "";

/*
  $("#testbegin").val(o_begin_match);
  $("#testend").val(o_end_match);
*/

  var begin_time = Date.create(o_begin_match);
  var end_time = Date.create(o_end_match);

  var abs_begin_time_exists = parse_re.test(o_begin_match);
  var abs_end_time_exists = parse_re.test(o_end_match);

  if (abs_begin_time_exists)
  {
    var o_begin_parse = parse_re.exec(o_begin_match);
    var begin_parse = [o_begin_parse[O_DAY], o_begin_parse[O_TIME], o_begin_parse[O_AMPM]];

    if (!begin_parse[DAY])
      begin_parse[DAY] = "today";
    if (!o_begin_parse[O_MIN])
      begin_parse[TIME] += ":00";
    if (begin_parse[AMPM])
      begin_parse[AMPM] = /^[Pp]/.test(begin_parse[AMPM]) ? "pm" : "am";

    begin_time = Date.create(begin_parse.join(" "));
/*       $("#testbegin").val(begin_parse.join(" ")); */
  }

  if (abs_end_time_exists)
  {
    var o_end_parse = parse_re.exec(o_end_match);
    var end_parse   = [o_end_parse[O_DAY], o_end_parse[O_TIME], o_end_parse[O_AMPM]];

    if (!end_parse[DAY])
    {
      if (abs_begin_time_exists)
        end_parse[DAY] = begin_parse[DAY];
      else
        end_parse[DAY] = "today";
    }
    if (!o_end_parse[O_MIN])
      end_parse[TIME] += ":00";
    if (end_parse[AMPM])
      end_parse[AMPM] = /^[Pp]/.test(end_parse[AMPM]) ? "pm" : "am";

    end_time = Date.create(end_parse.join(" "));
/*       $("#testend").val(end_parse.join(" ")); */
  }

  if (abs_begin_time_exists && abs_end_time_exists)
  {
    if (end_parse[AMPM] && !begin_parse[AMPM])
      begin_parse[AMPM] = end_parse[AMPM];
    else if (begin_parse[AMPM] && !end_parse[AMPM])
      end_parse[AMPM] = begin_parse[AMPM];

    begin_parse[AMPM] = /^[Pp]/.test(begin_parse[AMPM]) ? "pm" : "am";
    end_parse[AMPM] = /^[Pp]/.test(end_parse[AMPM]) ? "pm" : "am";

    begin_time = Date.create(begin_parse.join(" "));
    end_time = Date.create(end_parse.join(" "));
/*
    $("#testbegin").val(begin_parse.join(" "));
    $("#testend").val(end_parse.join(" "));
*/

    while (end_time.minutesSince(begin_time) <= 0)
    {
      if (!o_end_parse[O_AMPM])
        end_time.addHours(12);
      else if (!o_begin_parse[O_AMPM])
        begin_time.addHours(-12);
      else
        end_time.addHours(24);
    }
  }
  else
  {
    while (end_time.minutesSince(begin_time) <= 0)
    {
      if (abs_end_time_exists)
      {
        if (o_end_parse[O_AMPM])
          end_time.addHours(24);
        else
          end_time.addHours(12);
      }
      else if (abs_begin_time_exists)
      {
        if (o_begin_parse[O_AMPM])
          begin_time.addHours(-24);
        else
          begin_time.addHours(-12);
      }
      else
        end_time.addHours(24);
    }
    
    if (end_time.hoursSince(begin_time) >= 12 && end_time.hoursSince(begin_time) < 24)
    {
      if (abs_end_time_exists && !o_end_parse[O_AMPM])
        end_time.addHours(-12);
      else if (abs_begin_time_exists && !o_begin_parse[O_AMPM])
        begin_time.addHours(12);
    }
  }
  
  // Round off the times, very generously
  if (begin_time.isValid() && end_time.isValid())
  {
    while (begin_time.getMinutes() % 5 != 0)
    {
      begin_time.addMinutes(-1);
      end_time.addMinutes(-1);
    }
    while (end_time.getMinutes() % 5 != 0)
      end_time.addMinutes(1);
    
    begin_time.reset("seconds");
    end_time.reset("seconds");
  }

  var total_hours = (end_time.minutesSince(begin_time) / 60).toFixed(2);
  if (total_hours == "NaN") total_hours = "Waiting...";
  
  if (begin_time.isValid()) {
    $(".begin_time").val(begin_time.format(date_format));
  }
  else {
    $(".begin_time.display").val("Waiting...");
    $(".begin_time.submit").val("");
  }

  if (end_time.isValid()) {
    $(".end_time").val(end_time.format(date_format));
  }
  else {
    $(".end_time.display").val("Waiting...");
    $(".end_time.submit").val("");
  }

  $("#total_hours").val(total_hours);
}