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
            // menubar: false,
            toolbar: 'styleselect | bold italic | bullist numlist | ' +
            'alignleft aligncenter alignright alignjustify | ' + 
            'outdent indent | link codesample code | help |',
            plugins: [ 
                'link code codesample visualblocks table insertdatetime',
                'charmap print preview anchor searchreplace  advlist lists',
                'help wordcount autolink paste '
                // 'autoresize fullscreen image imagetools media'
            ],
            advlist_bullet_styles: 'square',
            advlist_number_styles: 'lower-alpha,lower-roman,upper-alpha,upper-roman'
        })
    }
});