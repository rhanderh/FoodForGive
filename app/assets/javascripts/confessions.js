
if($('#confess_text_field').val() ==  "") 
   $('#confess_submit').prop('disabled', true);

$('#confess_text_field').keyup(function(){
    if($('#text_field').val() !=  "") 
         $('#confess_submit').prop('disabled', false);    
    else
         $('#confess_submit').prop('disabled', true);   
});