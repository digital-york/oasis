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
});

