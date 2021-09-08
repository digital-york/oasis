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
            plugins: 'media link image lists table code visualblocks',
            menubar: false,
            toolbar: 'styleselect | formats | undo redo | ' +
                'bold italic underline strikethrough | ' +
                'numlist bullist | alignleft aligncenter alignright alignjustify  | ' +
                'image media link | table tabledelete | ' +
                'tableprops tablerowprops tablecellprops | ' +
                'tableinsertrowbefore tableinsertrowafter tabledeleterow | ' +
                'tableinsertcolbefore tableinsertcolafter tabledeletecol | ' +
                'code visualblocks'
        })
    }
});