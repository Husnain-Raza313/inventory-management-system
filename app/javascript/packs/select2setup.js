import 'select2'
import 'select2/dist/css/select2'
$(document).on('turbolinks:load',function() {
    $(".select2").select2({
        theme: "classic" 
    });
});