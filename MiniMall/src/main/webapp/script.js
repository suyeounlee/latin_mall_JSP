/**
 * script.js
 */
 
$(function() {
	$("input[name=email]").keydown(function() {
		//alert(1);
		$('#emailmessage').css('display', 'none');
	})
})
 
 function writeSave() {
	//alert(1);
	
	if($('input[name="name"]').val().length == 0) {
		alert("Please enter name.");
		$('input[name="name"]').focus();
		return false;
	}   
	
	if($('input[name="email"]').val().length == 0) {
		alert("Please enter email.");
		$('input[name="email"]').focus();
		return false;    
	}    
	
	if(use == "impossible") {
		alert("Email already registered.");
		return false;
	}
	
	if($('input[name="phone"]').val().length == 0) {
		alert("Please enter phone number.");
		$('input[name="phone"]').val().focus();
		return false;
		
	}
	
	if ($('input[name="password"]').val().length == 0) {
		alert("Please enter password");
		$('input[name="password"]').focus();
		return false;
	}
	
	if($('input[name="repassword"]').val().length == 0) {
		alert("Please confirm password.");
		$('input[name="repassword"]').focus();
		return false;
	}
	
	} //writeSave
	
	function duplicate() { //email check
		//alert(3);
		$.ajax({
			url: "email_check_proc.jsp",
			data : ({
				user_email : $('input[name="email"]').val()
			}),
			success: function(data) {
				alert($.trim(data));
				if($('input[name="email"]').val=="") {
					$('#emailmessage').html("<font color=red> Please enter your email. </font>");
					$('#emailmessage').show();
				}
				else if($.trim(data)=='YES') {
					$('#emailmessage').html("<font color=blue> OK to use.</font>");
					$('#emailmessage').show();
					use="possible";
				}
				else{
					$('#emailmessage').html("<font color=red>Your email is already registered!</font>");
					$('#emailmessage').show();
					use="impossible";
				}
			} //success
		}) //ajax
		
	}//duplicate
	
function pwcheck() {
	//alert(1);
	var pw = document.myform.password.value;
	
	var regexp = /^[a-z0-9]{3,8}$/;
	if(pw.search(regexp) == -1) {
		//alert("make your password more stronger.");
	}
	
	var chk_num = pw.search(/[0-9]/);
	var chk_eng = pw.search(/[a-z]/);
	if(chk_num < 0 ||  chk_eng < 0) {
		alert("Please include number and alphabet.");
		return false;
	}
} //pwcheck()


function repwcheck() {
	//alert(1);
	if($('input[name="password"]').val() == $('input[name="repassword"]').val()) {
		$('#pwmessage').html("<font color=red>password confirmed</font>");
	}
	else {
		$('#pwmessage').html("<font color=red> password not confirmed </font>");
	}
}
	