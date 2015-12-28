$(document).ready(function () {
	submessage = ""
	$( "form" ).submit(function( event ) {
		if ($('input<signup_form').val().length==0){
			console.log('blank cells')
			submessage = "Form is not fully filled out!"
    	}
    	if($("#password").val().length < 6){
      		var submessage = 'password cannot be less than 6 characters'
    	}else if($("#password").val() != $("#password2").val()){
      		var submessage = 'The two passwords you provided do not match.'    		
    	// }else if ($(#password3).val()!=user.password) {{
    	// 	var submessage = "Incorrect password"
    	};
    	if(submessage == "") {
			console.log("submit")
    		event.preventDefault();
    		// return;
    	}else{
   		 	$( "#validform" ).text( submessage ).show().fadeOut( 2000 );
    		event.preventDefault();
   		}
	});

	// showing and hiding forms
	$(".signin").click( function() {
		$(".signin_form").fadeIn(600)
    $(".signup_form").fadeOut(0001)
	});

	$(".signup").click( function() {
		$(".signup_form").fadeIn(600)
    $(".signin_form").fadeOut(0001)
	});
});