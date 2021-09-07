$(document).on('turbolinks:load ready', function() {
	// path = "/concern/summaries/9593tv41j".split('/')
        // Array(4) [ "", "concern", "summaries", "9593tv41j" ]
	var path = window.location.pathname.split('/');
	var hash = window.location.hash;

	// on /concern/summaries/XXXX page
	if (path[2] == 'summaries'){
		// close all tabs
		$('#accordion').accordion({ 
			collapsible: true, active: false, heightStyle: "content",
			icons: { "header": "ui-icon-plusthick", "activeHeader": "ui-icon-minusthick" }	
		});
	}

	// On /help page 
	if(path[1] == 'help' ) {
		// close all tabs
		$('#accordion').accordion({ 
			collapsible: true, active: false, heightStyle: "content",
			icons: { "header": "ui-icon-plusthick", "activeHeader": "ui-icon-minusthick" }	
		});
		if (hash != 'undefined') {
			index = parseInt(hash.slice(1));
			if (Number.isInteger(index)) {
				// open 3rd tab if /help/#3 
				$('#accordion').accordion( "option", "active", index - 1 );	
			}
		}
	}
});