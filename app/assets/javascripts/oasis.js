$(function() {
    $( "#accordion" ).accordion();

    $(".homepage_div").click(function() {
        var status_elt = $(this).find('input');
        if (status_elt.val() == "open") {
            $(this).css('height', '2.5em');
            status_elt.val('close');
        } else {
            $(this).css('height', 'auto');
            status_elt.val('open');
        }
        return false;
    });

    $("#homepage_submit").click(function() {
        window.location.href = '/new_summary';
    });

    $("#homepage_search").click(function() {
        window.location.href = '/catalog';
    });

    <!-- Show hiden IRIS url field -->
    if( $("#summary_materials_on_iris_yes").val()=='Yes'){
        $("#iri_url_div").css("display","block");
    }
    $("#summary_materials_on_iris_yes").click(function(){
        if( $(this).val()=='Yes'){
            $("#iri_url_div").css("display","block");
        }
    });
    $("#summary_materials_on_iris_no").click(function(){
        if( $(this).val()=='No'){
            $("#iri_url_div").css("display","none");
        }
    });

    <!-- applying order from summary_summary_writer_all -->
    var all_writers = JSON.parse($('#summary_summary_writer_all').val());
    if(all_writers) {
        for(var i in all_writers) {
            // update all writers in the order defined in summary_summary_writer_all
            if(all_writers[i]!='') {
                $('.summary_summary_writer:eq(' + (parseInt(i) + 1) + ')').val(all_writers[i]);
            }
        }
    }

    // before submitting changes, update summary_summary_writer_all first.
    $("#with_files_submit").click(function(){
        var authors = [];
        $("input[name='summary[summary_writer][]']").each(function() {
            if($(this).val()!='') {
                authors.push($(this).val());
            }
        });
        // update hidden field 'summary_summary_writer_all' value
        $('#summary_summary_writer_all').val(JSON.stringify(authors));
    });
});
