$(document).on('turbolinks:load', function() {
    
    //on page load
    show_hide_iris_url();
    
    // on click
    $("#summary_materials_on_iris_yes").click(function(){
        show_hide_iris_url();
    });

    $("#summary_materials_on_iris_no").click(function(){
        show_hide_iris_url();
    });
});

// show/hiden IRIS url field
function show_hide_iris_url() {
    if ($("#summary_materials_on_iris_yes").is(':checked')) {
        $("#iri_url_div").css("display", "block");
    } else {
        $("#iri_url_div").css("display", "none");
    }
}
