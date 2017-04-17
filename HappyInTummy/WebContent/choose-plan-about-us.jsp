<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en" data-baseuri="${pageContext.request.contextPath}/">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/png" href="favicon.png" />
<link rel="shortcut icon" type="image/png" href="favicon.png" />
<title>Happy Tummy</title>
 
<!-- style lists -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet"/>
<link href="css/style.css" rel="stylesheet">

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->


<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script src="Fillform.js" type="text/javascript"></script>


<link
	href='https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,700'
	rel='stylesheet' type='text/css'>
<style type="text/css">
/******* loader image before page load ******/
.no-js #loader {
	display: none;
}
.js #loader {
	display: block;
	position: absolute;
	left: 100px;
	top: 0;
}
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(images/Preloader_4.gif) center no-repeat #fff;
}
</style>
</head>

<script type="text/javascript">
$(document).ready(function(){
    var date_input=$('input[name="date"]'); //our date input has the name "date"
    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
    var options={
      format: 'mm/dd/yyyy',
      container: container,
      todayHighlight: true,
      autoclose: true,
    };
    date_input.datepicker(options);
  });
$.get("Menu_Options.jsp", function(data) {
	$("#menu_options").replaceWith(data);
});


$.get("Header.jsp", function (data) {
    $("#websiteHeader").replaceWith(data);
});

//Validation Code added by Neetika Mittal
var flagforvalidforName = false;
var flagforvalidforEmail = false;

var flagforvalidforPhone = false;
var flagforvalidforAddr = false;

var flagforvalidforState = false;
var flagforvalidforCity = false;
var flagforvalidforZip = false;

var flagforvalidforGender = false;
var flagforvalidforDOB = false;

/* $(document).ready(function() {
	
	 $('input').focus(function(){
		
		    placeholder = $(this).attr('placeholder');
		    if(placeholder != undefined){
		      $(this).parent().prepend('<span class="input-placeholder">'+placeholder+'</span>');
		    }
		  });
		  $('input').blur(function(){
		    $(this).parent().find('.input-placeholder').remove();
		  }); 
		});
 */

//Methods added by Neetika for Validations on About you page
function validateSpecialChars(inputtxt)
{
	
		  var regex = /^[a-zA-Z ]*$/;
		  var str = document.getElementById(inputtxt).value;
		
		  if (regex.test(str)) {
		   
		    return true;
		 
		  } else {
			
			return false;
		  }
}
function isValidEmailAddress(emailAddress) 
{
		 var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
		 return pattern.test(emailAddress);
}

function validatePhone(inputtxt)
{
		var phoneno = /^\d{10}$/;
		if(document.getElementById(inputtxt).value.match(phoneno))
		      {
		    		return true;
		      }
		    else
		      {
		     		return false;
		      }
}

function validateZip(zip) 
{
			var isValidZip = /(^\d{5}$)|(^\d{5}-\d{4}$)/.test(zip);
			return isValidZip;
}


function validatefields() 
{
	
			var maleSelected=$('#Male').is(':checked')?"Male":"NONE";
			var femaleSelected=$('#Female').is(':checked')?"Female":"NONE";
			if(maleSelected=="NONE" && femaleSelected=="NONE")
			{
				 
		         $('#gendererror').text("Please select gender");
		         flagforvalidforGender = false;
			}
			else
			{
				$('#gendererror').text("");
				flagforvalidforGender = true;
			}
			
			
			if (document.forms.aboutyou.date.value == null || document.forms.aboutyou.date.value == "") {
	           
	            $('#txtdoberror').text("Please select DOB");
	            flagforvalidforDOB = false;
	    
	        }
	        
			else {
	           
	            $('#txtdoberror').text("");
	            flagforvalidforDOB = true;
  
	        }

			
	        if (document.getElementById('Name').value.length < 2) {
	            $('#Name').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#nameerror').text("Please enter a valid name");
	            flagforvalidforName = false;
	            //sessionStorage.setItem('flagforvalidforName', false);
	            
	        }
	        
	        else if (document.getElementById('Name').value.length >100) {
	            $('#Name').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#nameerror').text("Please limit name to 100 characters");
	            flagforvalidforName = false;
	            //sessionStorage.setItem('flagforvalidforName', false);
	        }
	        
	        else {
	        	if (validateSpecialChars('Name')) {
	            $('#Name').closest('.input-group').removeClass('has-error').addClass('has-success');
	            $('#nameerror').text("");
	            flagforvalidforName = true;
	            //sessionStorage.setItem('flagforvalidforName', true);
	           
	        	}
	        	else
	        	{
	        		$('#Name').closest('.input-group').removeClass('success').addClass('has-error');
	 	            $('#nameerror').text("Please enter a valid name");
	 	            flagforvalidforName = false;
	        	}
	        }

	
	        if (document.getElementById('Email') != null && !isValidEmailAddress(document.getElementById('Email').value)) {
	            $('#Email').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#emailerror').text("Please enter a correct email address");
	            flagforvalidforEmail = false;
	            //sessionStorage.setItem('flagforvalidforEmail', false);
	        }
	        else  if (document.getElementById('Email') != null && document.getElementById('Email').value.length >100) {
	            $('#Email').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#emailerror').text("Please limit email address to 100 characters");
	            flagforvalidforEmail = false;
	            //sessionStorage.setItem('flagforvalidforEmail', false);
	        }
	        else {
	            $('#Email').closest('.input-group').removeClass('has-error').addClass('has-success');
	            $('#emailerror').text("");
	            flagforvalidforEmail = true;
	            //sessionStorage.setItem('flagforvalidforEmail', true);
	           
	        }

	    	
	        if (document.getElementById('Phone').value != "") {
	            if (validatePhone('Phone')) {
	            	
	                $('#Phone').closest('.input-group').removeClass('has-error').addClass('has-success');
	                $('#txtPhoneerror').text("");
	                flagforvalidforPhone = true;
	                //sessionStorage.setItem('flagforvalidforPhone', true);
	              
	               
	            }
	            else {
	            	
	                $('#Phone').closest('.input-group').removeClass('success').addClass('has-error');
	                $('#txtPhoneerror').text("Please enter 10 digit telephone number");
	                flagforvalidforPhone = false;
	                //sessionStorage.setItem('flagforvalidforPhone', false);
	            
	            }
	        }
	
	        else{
	        	$('#Phone').closest('.input-group').removeClass('success').addClass('has-error');
            	$('#txtPhoneerror').text("Enter correct telephone number");
           	 	flagforvalidforPhone = false;
	        }
	   
	        if (document.getElementById('Address').value.length < 2) {
	            $('#Address').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#Addresserror').text("Please enter a valid address");
	            flagforvalidforAddr = false;
	            //sessionStorage.setItem('flagforvalidforAddr', false);
	        }
	        else if (document.getElementById('Address').value.length > 100) {
	            $('#Address').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#Addresserror').text("Please limit address to 100 characters");
	            flagforvalidforAddr = false;
	            //sessionStorage.setItem('flagforvalidforAddr', false);
	        }
	        else {
	        	if (validateSpecialChars('Address')) {
		            $('#Address').closest('.input-group').removeClass('has-error').addClass('has-success');
		            $('#Addresserror').text("");
		            //sessionStorage.setItem('flagforvalidforAddr', true);
		            flagforvalidforAddr = true;
	        	}
	        	else
	        	{
	        		$('#Address').closest('.input-group').removeClass('success').addClass('has-error');
	 	            $('#Addresserror').text("Please enter a valid address");
	 	           flagforvalidforAddr = false;
	        	}
	         
	        }
	  

	        if (document.getElementById('City').value.length < 2) {
	            $('#City').removeClass('success').addClass('has-error');
	            $('#Cityerror').text("Please enter a valid city Name");
	            //sessionStorage.setItem('flagforvalidforCity', false);
	            flagforvalidforCity = false;
	        }
	        else if(document.getElementById('City').value.length > 45) {
	            $('#City').removeClass('success').addClass('has-error');
	            $('#Cityerror').text("Please limit city Name to 45 Characters");
	            flagforvalidforCity = false;
	            //sessionStorage.setItem('flagforvalidforCity', false);
	        }
	        else {
	        	
	        	if (validateSpecialChars('City')) {
		            $('#City').removeClass('has-error').addClass('has-success');
		            $('#Cityerror').text("");
		           // sessionStorage.setItem('flagforvalidforCity', true);
		            flagforvalidforCity = true;
	        	}
	        	else	
	        	{
	        		$('#City').closest('.input-group').removeClass('success').addClass('has-error');
	 	            $('#Cityerror').text("Please enter a valid city");
	 	            flagforvalidforCity = false;
	        	}
	         
	        }
	   

	        if (document.getElementById('State').value.length < 2) {
	            $('#State').removeClass('success').addClass('has-error');
	            $('#Stateerror').text("Please enter a valid state");
	           
	            //sessionStorage.setItem('flagforvalidforState', false);
	            
	            flagforvalidforState = false;
	        }
	        else if(document.getElementById('State').value.length > 45) {
	            $('#State').removeClass('success').addClass('has-error');
	            $('#Stateerror').text("Please limit state to 45 Characters");
	            //sessionStorage.setItem('flagforvalidforState', false);
	            flagforvalidforState = false;
	        }
	        else {
	        	if (validateSpecialChars('State')) {
		            $('#State').removeClass('has-error').addClass('has-success');
		            $('#Stateerror').text("");
		            //sessionStorage.setItem('flagforvalidforState', true);
		            flagforvalidforState = true;
	        	}
	        	else	
	        	{
	        	   $('#State').closest('.input-group').removeClass('success').addClass('has-error');
	 	           $('#Stateerror').text("Please enter a valid state");
	 	           flagforvalidforState = false;
	        	}
	        }

	        if (document.getElementById('Zip') != null && document.getElementById('Zip').value.length < 5) {

		            $('#Zip').removeClass('success').addClass('has-error');
		            $('#zipCodeerror').text("Please enter a valid zip of 5 digits");
		            //sessionStorage.setItem('flagforvalidforZip', false);
		            flagforvalidforZip= false;
	        	
	        }
	        else  if (document.getElementById('Zip') != null && document.getElementById('Zip').value.length > 5) {
	            $('#Zip').removeClass('success').addClass('has-error');
	            $('#zipCodeerror').text("Please enter a valid zip of 5 digits");
	            //sessionStorage.setItem('flagforvalidforZip', false);
	            flagforvalidforZip= false;
	        }
	        else {
		        	if (validateZip('Zip')) {
		            $('#Zip').removeClass('has-error').addClass('has-success');
		            $('#zipCodeerror').text("");
		            //sessionStorage.setItem('flagforvalidforZip', true);
		            flagforvalidforZip = true;
	        	}
	        }

	    
}



function validatefieldsonblur() {
	
	 		$('#Name').blur(function (e) {
	        if (document.getElementById('Name').value.length < 2) {
	            $('#Name').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#nameerror').text("Please enter a valid name");
	            flagforvalidforName = false;
	           
	        }
	        
	        else if (document.getElementById('Name').value.length >100) {
	            $('#Name').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#nameerror').text("Please limit name to 100 characters");
	            flagforvalidforName = false;
	          
	        }
	        
	        else {
	        	if (validateSpecialChars('Name')) {
	            $('#Name').closest('.input-group').removeClass('has-error').addClass('has-success');
	            $('#nameerror').text("");
	            flagforvalidforName = true;
	          
	        	}
		        
	        	else
	        	{
	        		$('#Name').closest('.input-group').removeClass('success').addClass('has-error');
	 	            $('#nameerror').text("Please enter a valid name");
	 	            flagforvalidforName = false;
	        	}
	        }
	    });
	 
	  $('#Email').blur(function (e) {
	        if (document.getElementById('Email') != null && !isValidEmailAddress(document.getElementById('Email').value)) {
	            $('#Email').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#emailerror').text("Please enter a correct email address ");
	            flagforvalidforEmail = false;
	           
	        }
	        else  if (document.getElementById('Email') != null && document.getElementById('Email').value.length >100) {
	            $('#Email').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#emailerror').text("Please limit email address to 100 characters");
	            flagforvalidforEmail = false;
	            
	        }
	        else {
	            $('#Email').closest('.input-group').removeClass('has-error').addClass('has-success');
	            $('#emailerror').text("");
	            flagforvalidforEmail = true;
	           
	           
	        }
	    });
	 
	    $('#Phone').blur(function (e) {
	    	
	        if (document.getElementById('Phone').value != "") {
	            if (validatePhone('Phone')) {
	            	
	                $('#Phone').closest('.input-group').removeClass('has-error').addClass('has-success');
	                $('#txtPhoneerror').text("");
	                flagforvalidforPhone = true;
	               
	              
	               
	            }
	            else {
	            	
	                $('#Phone').closest('.input-group').removeClass('success').addClass('has-error');
	                $('#txtPhoneerror').text("Please enter 10 digit telephone number");
	                flagforvalidforPhone = false;
	                
	            
	            }
	        }
	        else{
	        	$('#Phone').closest('.input-group').removeClass('success').addClass('has-error');
            	$('#txtPhoneerror').text("Enter correct telephone number");
           	 	flagforvalidforPhone = false;
	        }
	   
	    });
	    
	    
	    $('#Address').blur(function (e) {
	        if (document.getElementById('Address').value.length < 2) {
	            $('#Address').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#Addresserror').text("Please enter a valid address");
	            flagforvalidforAddr = false;
	            
	        }
	        else if (document.getElementById('Address').value.length > 100) {
	            $('#Address').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#Addresserror').text("Please limit address to 100 characters");
	            flagforvalidforAddr = false;
	            
	        }
	        else {
	        	if (validateSpecialChars('Address')) {
	            $('#Address').closest('.input-group').removeClass('has-error').addClass('has-success');
	            $('#Addresserror').text("");
	            
	            flagforvalidforAddr = true;
	        	}
	        }
	    });
	    
	    
	    $('#City').blur(function (e) {
	        if (document.getElementById('City').value.length < 2) {
	            $('#City').removeClass('success').addClass('has-error');
	            $('#Cityerror').text("Please enter a valid city name");
	            
	            flagforvalidforCity = false;
	        }
	        else if(document.getElementById('City').value.length > 45) {
	            $('#City').removeClass('success').addClass('has-error');
	            $('#Cityerror').text("Please limit city to 45 Characters");
	            flagforvalidforCity = false;
	           
	        }
	        else {
	        	if (validateSpecialChars('City')) {
		            $('#City').removeClass('has-error').addClass('has-success');
		            $('#Cityerror').text("");
		           
		            flagforvalidforCity = true;
	        	}
	        }
	    });
	    
	    
	    
	    $('#State').blur(function (e) {
	        if (document.getElementById('State').value.length < 2) {
	            $('#State').removeClass('success').addClass('has-error');
	            $('#Stateerror').text("Please enter a valid state");
	            
	            flagforvalidforState = false;
	        }
	        else if(document.getElementById('State').value.length > 45) {
	            $('#State').removeClass('success').addClass('has-error');
	            $('#Stateerror').text("Please limit state to 45 Characters");
	            
	            flagforvalidforState = false;
	        }
	        else {
	        	if (validateSpecialChars('State')) {
	            $('#State').removeClass('has-error').addClass('has-success');
	            $('#Stateerror').text("");
	            
	            flagforvalidforState = true;
	        	}
	        }
	    });
	    
	    $('#Zip').blur(function (e) {
	        if (document.getElementById('Zip') != null && document.getElementById('Zip').value.length < 5) {
	        	
	        
	            $('#Zip').removeClass('success').addClass('has-error');
	            $('#zipCodeerror').text("Please enter a valid zip of 5 digits");
	           
	            flagforvalidforZip= false;
	        	
	        }
	        else  if (document.getElementById('Zip') != null && document.getElementById('Zip').value.length > 5) {
	            $('#Zip').removeClass('success').addClass('has-error');
	            $('#zipCodeerror').text("Please enter a valid zip of 5 digits");
	          
	            flagforvalidforZip= false;
	        }
	        else {
	        	if (validateZip('Zip')) {
	            $('#Zip').removeClass('has-error').addClass('has-success');
	            $('#zipCodeerror').text("");
	            
	            flagforvalidforZip = true;
	        	}
	        }
	    });
	   
	    
}

</script>

<script>
$(document).ready(function () {
	validatefieldsonblur();
});

function submitform()
{
	 validatefields();
	
	 if (flagforvalidforName &&  flagforvalidforPhone &&  
			 flagforvalidforEmail &&  flagforvalidforAddr &&  flagforvalidforCity  && flagforvalidforState &&  
			 flagforvalidforZip && flagforvalidforDOB && flagforvalidforGender)
	 {
		
		 sessionStorage.setItem('Name', document.forms.aboutyou.Name.value);
		 sessionStorage.setItem('Email', document.forms.aboutyou.Email.value);
		 var gender=$('#Male').is(':checked')?"Male":"Female";
		 sessionStorage.setItem('DOB', document.forms.aboutyou.date.value);
		 sessionStorage.setItem('Gender',gender);
		 sessionStorage.setItem('Phone', document.forms.aboutyou.Phone.value);
		 sessionStorage.setItem('Zip', document.forms.aboutyou.Zip.value);
		 sessionStorage.setItem('City', document.forms.aboutyou.City.value);
		 sessionStorage.setItem('State', document.forms.aboutyou.State.value);
		 sessionStorage.setItem('Address', document.forms.aboutyou.Address.value);
		 document.forms.aboutyou.submit();
	 }
	 
	 else
	 {
		       return false; 	
	 }
	
}
</script>

<body onload="reloadFormAboutYou();" class="choose-plan-page">
<form id="aboutyou"   class="about-us-form"  method="POST" action="${pageContext.request.contextPath}/choose-plan-select-program.jsp">
	<!-- loader image before page load starts -->
	<div class="se-pre-con"></div>

	<div>

<!-- ============== Header starts ============== -->


	<header  id="websiteHeader"></header>
		<!-- ============== Header ends ============== -->

		<main> <!-- =============== choose your own plan title block starts ================== -->
		<section class="choose-plan-block">
			<div class="container">
				<h5 class="text-center wow fadeInUp text-uppercase">CHOOSE YOUR OWN PLANS</h5>
			</div>
		</section>
		<!-- =============== choose your own plan title block ends ================== -->

		<!-- =============== plan steps block starts ================== -->
		<section class="plan-step">
			<div class="steps-wrapper" data-wizard-init>

				<!-- == step navigation starts ==-->
				<div id="menu_options"></div>
				<!-- == step navigation ends ==-->

				<!-- == step content starts ==-->
				<div id="desktopView" class="step-content">

					<!-- choose plan about us step starts -->
					<div class="step1">
						<div class="col-xs-12 col-sm-6 wow fadeInLeft " style="padding-left:100px;">
								<h6><strong>Tell us about yourself, We will prepare your healthy meals!</strong></h6>
							<fieldset>
									
										<div class="col-sm-12 col-sm-6 pull-left alignProperAboutus">
											<div class="light-font radio-btn">
												<input  class="radio-class" type="radio" id="Male" name="gender"
													value="Male" /> <span style="font-weight:bold;">Men</span>
											</div>
										</div>
										
										<div class="col-sm-12 col-sm-6 pull-right">
											<div class="light-font radio-btn">
												<input  class="radio-class" type="radio" id="Female" name="gender"
													value="Female" /> <span style="font-weight:bold;">Women</span>
											</div>
										</div>
									<span class="errorspan" id="gendererror"></span>
								</fieldset>
								
								
								<fieldset>
									<input type="text" class="form-control" id="Name" placeholder="Full Name" required="required" >
									<span class="errorspan" id="nameerror"></span>
								</fieldset>
								
								<fieldset>
									<input id="Email" placeholder="E-mail Format: xxx@xxx.xxx"  type="email" class="form-control"/>
									 <span class="errorspan" id="emailerror"></span>
								</fieldset>
								
								<fieldset>
                            		<div class="input-group">
                            		
        
 
                            		
                            		
                            		<div class="col-sm-6 alignProperAboutus" >
                            		       <input class="form-control" id="date" name="date" 
                            		       placeholder="Date of Birth" type="text"/>
     
                            		<span class="errorspan" id="txtdoberror"></span>
                            		</div>
                            		<div class="col-sm-1">
									
									</div>
                            		<div class="col-sm-5" style="    padding-right: 60px;">
									<input type="text" id="Phone" placeholder="Phone" 
									 class="form-control expandFieldAboutus" required="required" />
									<span class="errorspan" id="txtPhoneerror"></span>
									</div>
									
									</div>
								
								
						        </fieldset>
								
								
								
								<fieldset>
									<input type="text" id="Address" placeholder="Address" class="form-control" required="required" />
									 <span class="errorspan" id="Addresserror"></span>
								</fieldset>
								
								<fieldset>
								<div>
                            		<div class="input-group">
                            		<div class="col-sm-5 alignProperAboutus">
                            		<input type="text" id="City" placeholder="City" class="form-control" required="required" />
                            		<span class="errorspan" id="Cityerror"></span>
                            		</div>
                            		<div class="col-sm-4">
									<input type="text" id="State" placeholder="State" class="form-control" required="required" />
									<span class="errorspan" id="Stateerror"></span>
									</div>
									<div class="col-sm-3">
									<input type="text"  id="Zip" placeholder="ZIP" class="form-control expandFieldZip"  required="required" />
									<span class="errorspan" id="zipCodeerror"></span>
									</div>
									</div>
								</div>
								</fieldset>
								
									 <input type="button" class="btn" id="usrsubmit" onclick="submitform();" value="Next"/>
							
							
							
						</div>
 						
						<div class="col-xs-12 col-sm-6 wow fadeInRight right-image">
							<figure>
								<img class="img-responsive" src="images/about-us.jpg"
								 alt="About us image" style="padding-top:14px; height: 444px; width:100%;"/>
							</figure>
						</div>
					</div>
					<!-- choose plan about us step ends -->
				</div>
				<!-- == step content ends ==-->
				<!-- == step content starts ==-->
				<div id="mobileView" class="step-content">

					<!-- choose plan about us step starts -->
					<div class="step1">
						<div class="col-xs-12 col-sm-6 wow fadeInLeft left-form">
							<h5 class="text-uppercase">TELL US ABOUT YOU, WE WILL
								PREPARE YOUR HEALTHY MEALS</h5>
							
								<fieldset>
									
										<div class="col-sm-12 col-sm-6 pull-left">
											<div class="light-font radio-btn radio-btn-men">
												<input  class="radio-class" type="radio" id="Male" name="gender"
													value="Male" /> <span>Men</span>
											</div>
										</div>
										<div class="col-sm-12 col-sm-6 pull-right">
											<div class="light-font radio-btn radio-btn-women">
												<input  class="radio-class" type="radio" id="Female" name="gender"
													value="Female" /> <span>Women</span>
											</div>
										</div>
									
								</fieldset>
								<fieldset>
									<input type="text" id="Name" placeholder="Full Name" />
								</fieldset>
								<fieldset>
									<input type="email" id="Email" placeholder="E-mail" />
								</fieldset>
								<fieldset>
								
								
						                <input type="date" id = "date" placeholder="Date of Birth" />
						               
						       
						        </fieldset>
								
								<fieldset>
									<input type="text" id="Phone" placeholder="Phone No." />
								</fieldset>
								<fieldset>
									<input type="text" id="Address" placeholder="Address" />
								</fieldset>
								<fieldset>
									<input type="text" id="City" placeholder="City" />
								</fieldset>
								<fieldset>
									<input type="text" id="State" placeholder="State" />
								</fieldset>
								<fieldset>
									<input type="text"  id="Zip" placeholder="ZIP Code" />
								</fieldset>
								<fieldset>
									<input type="submit" value="next" onClick="submitform();"/>
								</fieldset>
							
							
						</div>
 						
						<div class="col-xs-12 col-sm-6 wow fadeInRight right-image">
							<figure>
								<img class="img-responsive" src="images/Food_long.jpg"
								 alt="About us image" style="padding-top:54px;"/>
							</figure>
						</div>
					</div>
					<!-- choose plan about us step ends -->
				</div>
				<!-- == step content ends ==-->
			</div>
		</section>
		<!-- =============== plan steps block ends ================== --> 
		</main>


		<!-- ============== footer block starts ============== -->
		<footer class="limited-footer">
			<div class="container">&copy; 2017 MIS Copyrights.</div>
		</footer>
		<!-- ============== footer block ends ============== -->


	</div>
	<!-- main wrapper of the site ends -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	
	<script src="js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
	
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/wow.min.js" type="text/javascript"></script>
	
	<script src="js/jquery.parallax-1.1.3.js" type="text/javascript"></script>
	<script src="js/jquery.featureCarousel.js" type="text/javascript"></script>
	<script src="js/jquery.bxslider.js" type="text/javascript"></script>
	<script src="js/owl.carousel.js" type="text/javascript"></script>
	<script src="js/jquery.waypoints.js" type="text/javascript"></script>
	<script src="js/jquery.counterup.js" type="text/javascript"></script>
	<script src="js/main.js" type="text/javascript"></script>
</form>
</body>



</html>