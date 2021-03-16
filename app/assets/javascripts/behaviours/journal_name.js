$(document).on('turbolinks:load', function() {
   
    // on page load 
    check_publication_journal_name_other_fields();
    
    // on list change
    $("#summary_publication_journal_name").change(function(){
        check_publication_journal_name_other_fields();
    });
});

// show/hide other journal name fields
function check_publication_journal_name_other_fields() {
    var t = $('#summary_publication_journal_name option').filter(':selected').text();
    if(t.endsWith('Other')) {
        $("#publication_journal_name_other_div").css("display","block");
    }else{
       $("#publication_journal_name_other_div").css("display","none");
    }
}  