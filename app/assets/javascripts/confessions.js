$(document).ready(function(){
$('#magic-response').bind('ajax:aborted:required', function(){
$('#magic-response').append("<p>There was a failure</p>");
});
});