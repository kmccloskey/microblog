$(document).ready(function () {

	// $( "form" ).change(function( event ) {
	// 	if ($('input').val().length==0){
	// 		submessage = "Form is not fully filled out!"
	// 		console.log(submessage)
 //    	}
 //    	if($("#password").val().length < 6){
 //      		var submessage = 'password cannot be less than 6 characters'
	// 		console.log(submessage)
 //    	}else if($("#password").val() != $("#password2").val()){
 //      		var submessage = 'The two passwords you provided do not match.'    		
	// 		console.log(submessage)
 //    	};
 //    });

   	$( "#signupform" ).submit(function( event ) {
		var submessage = ""
    	if($("#password").val().length < 6){
      		var submessage = 'password cannot be less than 6 characters'
			// console.log(submessage)
    	}else if($("#password").val() != $("#password2").val()){
      		var submessage = 'The two passwords you provided do not match.'    		
			// console.log(submessage)
    	}else if($('input<#signupform').val().length===0){
			var submessage = "Form is not fully filled out!"
			// console.log(submessage)
    	}else{
    		return;   		
    	};
    	$( "#validform1" ).text( submessage ).show().fadeOut( 2000 );
    	event.preventDefault();
   	});

   	$( "#signinform" ).submit(function( event ) {
		var submessage = ""
		console.log(submessage)
    	if($('username').val().length===0){
			var submessage = "Please enter your username!"
			console.log(submessage)
    	}else if($('password3').val().length===0){
			var submessage = "Please enter your password!"
			console.log(submessage)
    	};
    	$( "#validform" ).text( submessage ).show().fadeOut( 2000 );
    	event.preventDefault();
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