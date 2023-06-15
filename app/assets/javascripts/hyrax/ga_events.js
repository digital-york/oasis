// Callbacks for tracking events using Google Analytics

// Note: there is absence of testing here.  I'm not sure how or to what extent we can test what's getting
// sent to Google Analytics.

// $(document).on('click', '#file_download', function(e) {
//   _gaq.push(['_trackEvent', 'Files', 'Downloaded', $(this).data('label'), 1]);

//   // send journals info to GA
//   let journals = $('#summary_journals').val();
//   if(journals) {
//     journals.split("|").forEach(function (item, index) {
//       _gaq.push(['_trackEvent', 'Journals', 'Metadata', item, ,true]);
//     });
//   }
// });

$(document).on("click", "#file_download", function (e) {
  let ga4PropertyId = $("#ga4_property_id").val();;

  gtag("event", "Downloaded", {
    send_to: ga4PropertyId,
    event_category: "Files",
    event_label: $(this).data("label"),
  });

  // send journals info to GA
  let journals = $("#summary_journals").val();
  if (journals) {
    journals.split("|").forEach(function (item, index) {
      gtag("event", "Metadata", {
        send_to: ga4PropertyId,
        event_category: "Journals",
        event_label: item,
        non_interaction: true,
      });
    });
  }
});
