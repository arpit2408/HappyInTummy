<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en" data-baseuri="${pageContext.request.contextPath}/">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HappyTummy</title>

<!-- favicon -->  
<link rel="shortcut icon" type="image/png" href="favicon.png"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg=="
	crossorigin="anonymous">
<!-- Bootstrap Core CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"> 
<link href="css/style.css" rel="stylesheet">

<!-- Custom CSS -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
$.get("Header.jsp", function (data) {
    $("#websiteHeader").replaceWith(data);
});
</script>
<script type="text/javascript">

function isValidStreet(){
	document.getElementById("streetTip").innerHTML="";
	var street = document.getElementById("Street Address").value;	
	var regExStreet=/^[a-zA-Z0-9,.!? ]*$/;
	
	if (street==""){
		document.getElementById("streetTip").innerHTML="Enter street address.";		
		return false;
	}
	
	if (!regExStreet.test(street)){
		document.getElementById("streetTip").innerHTML="Enter a valid street address.";		
		return false;
	}
	
	if(street.length < 2 || street.length > 100){
		document.getElementById("streetTip").innerHTML="Limit street address to 2 - 100 characters.";		
		return false;
	}
	return true;
}

function isValidCity(city){
	document.getElementById("cityTip").innerHTML = "";
	var city = document.getElementById("City").value;	
	var regExCity=/^[a-zA-Z][a-zA-Z\s]+$/;
	
	
	if (city==""){
		document.getElementById("cityTip").innerHTML="Enter city.";
		return false;
	}
	
	if (!regExCity.test(city)){
		document.getElementById("cityTip").innerHTML="Enter a valid city.";
		return false;
	}
	if (city.length < 2 || city.length > 45){
		document.getElementById("cityTip").innerHTML="Limit city to 2 - 45 characters.";
		return false;
	}
	
	return true;
}

function isValidState(state){
	document.getElementById("stateTip").innerHTML ="";
	var state = document.getElementById("State").value;		
	var regExState=/^[a-zA-Z][a-zA-Z\s]+$/;
	
	if (state==""){
		document.getElementById("stateTip").innerHTML="Enter state.";
		return false;
	}
	if (!regExState.test(state)){
		document.getElementById("stateTip").innerHTML="Enter a valid state.";
		return false;
	}
	if (state.length < 2 || state.length > 45){
		document.getElementById("stateTip").innerHTML="Limit state to 2 - 45 characters.";
		return false;
	}
	return true;
	
}

function isValidZip(zip){
	document.getElementById("zipTip").innerHTML="";
	var zip = document.getElementById("ZIP Code").value;	
	var regExZip=/^\s*\d{5}\s*$/;
	
	if (zip==""){
		document.getElementById("zipTip").innerHTML="Enter zip code.";
		return false;
	}
	
	if (!regExZip.test(zip)){
		document.getElementById("zipTip").innerHTML="Enter a valid zip code.";
		return false;
	}
	
	return true;
	
}

function isValidPhone(phone){
	document.getElementById("phoneTip").innerHTML = "";
	var phone= document.getElementById("Phone number").value;
	var regExPhone=/^\d{10}$/;
	
	if (phone==""){
		document.getElementById("phoneTip").innerHTML="Enter phone number.";
		return false;
	}
	
	if (!regExPhone.test(phone)){
		document.getElementById("phoneTip").innerHTML="Enter 10 digit phone number.";
		return false;
	}
	return true;	
}

function submitform()
{			
	if (!isValidStreet()){
		return false;
	}	
	if (!isValidCity()){
		return false;
	}	
	if (!isValidState()){
		return false;
	}
	if (!isValidZip()){
		return false;
	}	
	if (!isValidPhone()){
		return false;
	}	
	document.myform.submit();	
}
</script>
</head>

<body >
<header  id="websiteHeader"></header>

<div class="container wrapper" >
	
<form name="myform" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/UpdateUserDetails" method="post" style="padding-top:50px;">
	<input type="hidden" name="customerID" value="${ user.customer_id }">
	
	<!-- Name -->
	<div class="form-group">
	<label class="col-sm-4 control-label" for="Name (Full name)"></label>
	<div class="col-sm-5">
	<div class="input-group">
	<div class="input-group-addon"><i class="fa fa-user"></i></div>
	<input id="Name (Full name)" name="Name (Full name)"
	    	type="text" placeholder="Name (Full name)"
			class="form-control input-md" value="${ user.customer_name }" readonly="readonly">
	</div>
	</div>
	</div>

	<!-- Date of Birth -->
	<div class="form-group">
	<label class="col-sm-4 control-label" for="Date Of Birth"></label>
	<div class="col-sm-5">
	<div class="input-group">
	<div class="input-group-addon"><i class="fa fa-birthday-cake"></i></div>
	<input id="Date Of Birth" name="Date Of Birth" type="text"
		placeholder="Date Of Birth" class="form-control input-md"
		value="${ user.birth_date }" readonly="readonly">
	</div>
	</div>
	</div>

	<!-- Gender-->
	<div class="form-group">
	<label class="col-sm-4 control-label" for="Gender"></label>
	<div class="col-sm-5">
	<label class="radio-inline" for="Gender-0"> 
		<input type="radio" name="Gender" id="Gender-0" value="1" 
		   <c:if test="${user.gender=='Male'}">checked</c:if> disabled>Male</label> 
	<label class="radio-inline" for="Gender-1">
		<input type="radio" name="Gender" id="Gender-1" value="2" 
			<c:if test="${user.gender=='Female'}">checked</c:if> disabled>Female</label>
	</div>
	</div>
	
	<!--Address-->
    <div class="form-group">
	<label class="col-sm-4 control-label"></label>
	<div class="col-sm-5">
	<input id="Street Address" name="Street Address" type="text" placeholder="Street Address"
		class="form-control input-md" value="${user.address}" onblur="isValidStreet()" required="required">
	<div id="streetTip" style="font-family : 'Raleway'; color: #800000"></div>
	</div>
	</div>

	<div class="form-group">
	<label class="col-sm-4 control-label col-xs-12"></label>
	<div class="col-sm-2">
	<input class="form-control input-md" id="City" name="City" type="text" placeholder="City" 
	       value="${user.city}" onblur="isValidCity()" required="required">
	<div id="cityTip" style="font-family : 'Raleway'; color: #800000"></div>
	</div>	
	<div class="col-sm-2">
	<input id="State" name="State" type="text" placeholder="State" 
	       class="form-control input-md" value="${user.state}" onblur="isValidState()" required="required">
	<div id="stateTip" style="font-family : 'Raleway'; color: #800000"></div>
	</div>
	<div class="col-sm-1">
	<input id="ZIP Code" name="ZIP Code" type="text" placeholder="ZIP Code"
		   class="form-control input-md " value="${user.postal_zip}" onblur="isValidZip()" required="required">
	<div id="zipTip" style="font-family : 'Raleway'; color: #800000"></div>
	</div>
	</div>
	
	<!--Phone Number-->
	<div class="form-group">
	<label class="col-sm-4 control-label"></label>
	<div class="col-sm-5">
	<div class="input-group">
	<div class="input-group-addon"><i class="fa fa-mobile-phone"></i></div>									
	<input id="Phone number" name="Phone number" type="text" placeholder="Phone number " 
		class="form-control input-md" value="${user.phone_number}" onblur="isValidPhone()" required="required">
	</div>
	<div id="phoneTip" style="font-family : 'Raleway'; color: #800000"></div>
	</div>
	</div>

	<!--Email Address-->
	<div class="form-group">
	<label class="col-sm-4 control-label"></label>
	<div class="col-sm-5">
	<div class="input-group">
	<div class="input-group-addon"><i class="fa fa-envelope-o"></i></div>
	<input id="Email Address" name="Email Address" type="text" placeholder="Email Address" 
			class="form-control input-md" value="${user.email_id}" readonly="readonly">
	</div>
	</div>
	</div>

	<!--Meal Preference-->
	<div class="form-group">
	<label class="col-sm-4 control-label"></label>
	<div class="col-sm-5">
	<div class="input-group">
	<div class="input-group-addon"><i class="fa fa-street-view"></i></div>
	<input id="Meal Preference" name="Meal Preference" type="text" placeholder="Meal Preference" 
		class="form-control input-md" value="${user.preference}" disabled>
	</div>
	</div>
	</div>

	<!--Plan Period-->
	<div class="form-group">
	<label class="col-sm-4 control-label"></label>
	<div class="col-sm-5">
	<div class="input-group">
	<div class="input-group-addon"><i class="fa fa-clock-o"></i></div>
	<input id="Plan Period" name="Plan Period" type="text" placeholder="Plan Period" 
		class="form-control input-md" value="${user.noOfWeeks} Week(s)" disabled>
	</div>
	</div>
	</div>

	<!--Order Cancellation Option-->
	<div class="form-group">
	<label class="col-sm-4 control-label"></label>
	<div class="col-sm-5">
	<div class="checkbox">				
	<input type="checkbox" class="checkbox col-sm-2" name="Cancel Order" id="Cancel Order" value="1"> 
		<span class="col-sm-1"></span>
		<label class="col-sm-6" for="Cancel Order">I want to cancel my order.</label>
	</div>
	</div>
	</div>

	<!--Submit and Cancel button-->
	<div class="form-group">
	<label class="col-sm-4 control-label"></label>
	<div class="col-md-2">
	<a href="javascript: submitform()" class="btn btn-success">
		<span class="glyphicon glyphicon-thumbs-up"></span> Submit </a>
	</div>
	<div class="col-md-2">
	<a href="contact-us.jsp" class="btn btn-danger">
		<span class="glyphicon glyphicon-remove-sign"></span> Cancel </a>
	</div>
	</div>
</form>
</div>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<div id="footer">
    </div>
</body>

<script type="text/javascript">
	$.get("footer.html", function(data) {
		$("#footer").replaceWith(data);
	});
</script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
	
	<script src="js/wow.min.js" type="text/javascript"></script>
	
	<script src="js/jquery.parallax-1.1.3.js" type="text/javascript"></script>
	<script src="js/jquery.featureCarousel.js" type="text/javascript"></script>
	<script src="js/jquery.bxslider.js" type="text/javascript"></script>
	<script src="js/owl.carousel.js" type="text/javascript"></script>
	<script src="js/jquery.waypoints.js" type="text/javascript"></script>
	<script src="js/jquery.counterup.js" type="text/javascript"></script>
	<script src="js/main.js" type="text/javascript"></script>
</html>