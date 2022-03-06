//= require arctic_admin/base
//= require select2
//= require select2-full
//= require jquery
//= require jquery_ujs
//= require game_timer
//= require chartkick
//= require Chart.bundle
//= require moment
//= require daterangepicker

jQuery(function () {
  $(
    "#quiz_game_status, #quiz_game_city_id, #quiz_game_sponsor_id, #quiz_game_radio_station_id"
  ).select2({
    height: "1000px",
  });
  $("#user_region_id").select2();
  $("#user_province_id").select2();
  $("#user_city_id").select2();
  $("#radio_station_city_id").select2();
  $(".station_city_select").select2();
  $("#roulette_city_id").select2();
  $("#roulette_radio_station_id").select2();
  $("#roulette_dj_id").select2();
  $("#roulette_sponsor_id").select2();
  $("#roulette_city_ids").select2();
  $(document).ready(function() {
    $('input[class="daterange"]').daterangepicker({
      ranges: {
        'Today': [moment(), moment()],
        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
        'This Month': [moment().startOf('month'), moment().endOf('month')],
        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
     }
    })
  });
  let actionItems = document.querySelectorAll(".action_item a")
  if(actionItems.length == 1){
    document.querySelectorAll(".action_item a")[0].innerHTML="New"
  }else{
    document.querySelectorAll(".action_item a")[0].innerHTML="Edit"
    document.querySelectorAll(".action_item a")[1].innerHTML="Delete"
  }
});

document.addEventListener("DOMContentLoaded", function () {
  $("#notify-user").on("change", (e) => {
    const checked = $("#notify-user").is(":checked");
    console.log({ checked });
    if (checked) {
      $("#force-update").removeClass("hide");
    } else {
      $("#force-update").addClass("hide");
    }
  });

  $("#roulette_location_restriction").on("change", (e) => {
    if ($("#roulette_location_restriction").is(":checked")) {
      $("#roullete_location_restriction").removeClass("hide");
    } else {
      $("#roullete_location_restriction").addClass("hide");
    }
  });

  initLobby();

  if (window.location.pathname == "/admin/messages") {
    const USER_ID = new URL(window.location.href).searchParams.get(
      "user_id"
    );
    const URL_PATH = `/admin/messages/index.js?user_id=${USER_ID}`;

    console.log({ USER_ID, URL_PATH });
    // clearInterval(interval);
    interval = setInterval(() => {
      console.log("Fetching");
      fetch(URL_PATH)
        .then((res) => res.text())
        .then((res) => {
          let messageContainer = document.querySelector("#message-container");
          messageContainer.innerHTML = res;
        })
        .catch((err) => console.log({ err }));
    }, 3000);
  }

  if (window.location.pathname == "/admin/login") {
    document.querySelector("#active_admin_content").classList.add('login-bg')
    // document.querySelector("h2").firstChild[0].innerHTML = "Laurence"
  }
});
