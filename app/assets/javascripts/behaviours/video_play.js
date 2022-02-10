// on video play trigger GA events -> files -> played
$(document).on("turbolinks:load ready", function () {
  let vid = document.getElementById("video_download");

  if (vid !== null) {
    vid.onplay = function () {
      _gaq.push(["_trackEvent", "Files", "Played", $(this).data("label"), 1]);

      // send journals info to GA
      let journals = $("#summary_journals").val();
      if (journals) {
        journals.split("|").forEach(function (item, index) {
          _gaq.push(["_trackEvent", "Journals", "Metadata", item, , true]);
        });
      }
    };
  }
});
