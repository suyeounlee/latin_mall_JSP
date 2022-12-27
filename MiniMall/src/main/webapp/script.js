/**
 * script.js
 */
 
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
	
	
	function duplicate() { //email check
		alert(3);
	}
	
	
	}
	