$(document).ready(function () {
	submessage = ""
	$("#password").change(function( event ){
    	if($("#password").val().length < 6){
      		var submessage = 'password cannot be less than 6 characters'
    	}else{
    		var submessage = ""
    	};
    	console.log(submessage)
  	});
  	$("#password2").change(function( event ){
    	if($("#password").val() != $("#password2").val()){
      		var submessage = 'The two passwords you provided do not match.'
    	}else{
    		var submessage = ""
		};
		console.log(submessage)
	});
	$( "form" ).submit(function( event ) {
    	if(submessage === "") {
    		if ($('input').val().length==0){
    			console.log('blank cells')
    			submessage = "Form is not fully filled out!"
    		}else{
    		return;
    		}
    	}
    	$( "#validform" ).text( submessage ).show().fadeOut( 2000 );
    	event.preventDefault();
	});
});