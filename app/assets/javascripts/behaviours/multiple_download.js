$(document).on("turbolinks:load", function () {
  // Show downlowd survey only once during multiple tab downloads
  $("#file_download_controller").click(function () {
    if ("added_cookie" === getCookie("oasis_survey")) {
      // Download pdf file
      window.location.href = $("#file_download").attr("href");
      // and trigger GA event
      $("#file_download").trigger("click");
    } else {
      // or prompt user with download survey
      $("#file_download_survey").click();
    }
  });
});

// Parse cookie text
function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(";");
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}
