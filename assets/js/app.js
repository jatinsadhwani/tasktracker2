// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html";
import $ from "jquery";

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"


function update_buttons() {
  $('.follow-button').each( (_, bb) => {
    let user_id = $(bb).data('user-id');
    let follow = $(bb).data('follow');
    if (follow != "") {
      $(bb).text("Unfollow");
    }
    else {
      $(bb).text("Follow");
    }
  });
}


function create_block(param) {
  let task_id = param;
  let date1 = new Date();
  let date2 = new Date();
  alert(task_id);
  let text = JSON.stringify({
    time: {
        task_id: task_id,
        starttime: date1,
        endtime: date2
      },
  });

  $.ajax(time_path, {
    method: "post",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: text,
    success: (resp) => { console.log("Log created") },
  });
}

function unfollow(user_id, follow_id) {
  $.ajax(follow_path + "/" + follow_id, {
    method: "delete",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: "",
    success: () => { set_button(user_id, ""); },
  });
}

function time_click(ev) {
  let btn = $(ev.target);
  let task_id = btn.data('task_id');
  alert(task_id);
  create_block(task_id);
}

function init_time() {
  $(".create-button").click(time_click);

  //update_buttons();
}

$(init_time);
