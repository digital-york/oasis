$(document).on("turbolinks:load ready", function () {
  // path = "/concern/summaries/9593tv41j".split('/')
  // Array(4) [ "", "concern", "summaries", "9593tv41j" ]
  var path = window.location.pathname.split("/");
  // on /concern/summaries/XXXX page
  if (path[2] == "summaries") {
    // Check if title contains hebrew characters
    if (/[\u0590-\u05FF]/.test($("h1").text())) {
      $("h1").css("direction", "rtl");
    }
  }
});
