$(document).on('turbolinks:load', function() {
    // Hyrax bug: Reinitiate TinyMCE when required
    var tinyMCEActive = false
    try {
        tinyMCEActive = (tinyMCE != 'undefined') && (tinyMCE.activeEditor != null)
    } catch (error) {}
    if( tinyMCEActive ) {
        tinymce.remove();
        tinyMCE.init({
            selector: 'textarea.tinymce',
            height: 500,
            fontsize_formats: "8pt 9pt 10pt 11pt 12pt 14pt 18pt 24pt 30pt 36pt 48pt 60pt 72pt 96pt",
            plugins: 'media link image lists table code visualblocks',
            menubar: false,
            toolbar: 'styleselect | fontsizeselect | formats | undo redo | ' +
                'bold italic underline strikethrough | ' +
                'numlist bullist | alignleft aligncenter alignright alignjustify  | ' +
                'image media link | table tabledelete | ' +
                'tableprops tablerowprops tablecellprops | ' +
                'tableinsertrowbefore tableinsertrowafter tabledeleterow | ' +
                'tableinsertcolbefore tableinsertcolafter tabledeletecol | ' +
                'code visualblocks'
        })
    } else {
        setTimeout(arguments.callee, 50);
    }
});