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
  if($('#signupform > input').val().length===0){
   var submessage = "Form is not fully filled out!"
			// console.log(submessage)
   }else if($("#password").val() != $("#password2").val()){
    var submessage = 'The two passwords you provided do not match.'    		
			// console.log(submessage)
   }else if($("#password").val().length < 6){
    var submessage = 'password cannot be less than 6 characters'
			// console.log(submessage)
   }else{
    return;   		
  };
  $( "#validform1" ).text( submessage ).show().fadeOut( 2000 );
  event.preventDefault();
});

   	$( "#signinform" ).submit(function( event ) {
		var submessage = ""
		// console.log(submessage)
    	// event.preventDefault();
		if($('#signinform > input').val().length===0){
			var submessage = "Please input your credentials to sign in."
    	}else{
			return
    	}
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

  // Show the post box from anywhere on the site, displaying at the top
  $(".new_mumble").click( function() {
    $(".post_box").slideDown(800)
    $(".container").click( function() {
      $(".post_box").slideUp(800)
    });
    $(".close_mumble").click( function() {
      $(".post_box").slideUp(800)
    });
  });
  // text counter for mumble box
  var text_max = 150;
  $('#textarea_feedback').html(text_max + ' chractrs reminng');
  $('#textarea').keyup(function() {
    var text_length = $('#textarea').val().length;
    var text_remaining = text_max - text_length;
  $('#textarea_feedback').html(text_remaining + ' chractrs reminng');
    });

  // PROFILE PAGE JAVASCRIPT

  $('.edit_profile_form').hide();
  $('.edit_profile_button').click(function (){
    $('.edit_profile_form').show();
    $('.edit_profile_button').hide();
    $('.profile_info_container').hide();
  });

  $('.delete_account_phrase').click( function() {
    $('.delete_account_phrase').hide()
    $('.are_you_sure').fadeIn()
  });

  $('.are_you_sure').click( function() {
    $('.are_you_sure').hide()
    $('.please_rate_us').fadeIn()
  });

  $('.please_rate_us').click( function() {
    $('.please_rate_us').hide()
    $('.maybe_next_time').fadeIn()
  });

  $('.maybe_next_time').click( function() {
    $('.maybe_next_time').hide()
    $('.just_kidding_fine').fadeIn()
  });

  $('.just_kidding_fine').click( function() {
    $('.just_kidding_fine').hide()
    $('.delete_user_button').fadeIn()
  });

  $(".delete_user_button").click( function () {
    alert ("Your account has been deleted")
  });

});

















