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

    $("#summary_materials_on_iris_yes").change(function(){
        if( $(this).val()=='Yes'){
            $("#iri_url_div").css("display","block");
            //$("#iri_url_div").css("height","100%");
        }
    });
    $("#summary_materials_on_iris_no").click(function(){
        if( $(this).val()=='No'){
            $("#iri_url_div").css("display","none");
            //$("#iri_url_div").css("height","0px");
        }
    });
});

