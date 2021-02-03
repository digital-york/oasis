// Callbacks for tracking events using Google Analytics

// Note: there is absence of testing here.  I'm not sure how or to what extent we can test what's getting
// sent to Google Analytics.

$(document).on('click', '#file_download', function(e) {
  _gaq.push(['_trackEvent', 'Files', 'Downloaded', $(this).data('label'), 1]);

  // send journals info to GA
  let journals = $('#summary_journals').val();
  if(journals) {
    journals.split("|").forEach(function (item, index) {
      _gaq.push(['_trackEvent', 'Journals', 'Metadata', item, ,true]);
    });
  }
});

