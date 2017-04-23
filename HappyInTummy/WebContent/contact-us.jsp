<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!DOCTYPE html>  
 <html lang="en">  
 <head>  
 <meta charset="utf-8">  
 <meta http-equiv="X-UA-Compatible" content="IE=edge">  
 <meta name="viewport" content="width=device-width, initial-scale=1">  
  
 <!-- favicon -->  
 <link rel="shortcut icon" type="image/png" href="favicon.png"/>   
 <title>HappyTummy</title>  
  
 <!-- style lists -->  
 <link href="css/bootstrap.min.css" rel="stylesheet">  
 <link href="css/animate.css" rel="stylesheet">  
 <link href="css/jquery.bxslider.css" rel="stylesheet">
 <link href="css/owl.transitions.css" rel="stylesheet">   
 <link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet">  
 <link href="css/style.css" rel="stylesheet">  
  
 <!-- montserrat font embed -->  
 <link href='https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,700' rel='stylesheet' type='text/css'>  
 
 <style>  
 /******* loader image before page load ******/  
 .no-js #loader {display: none;}.js #loader { display: block; position: absolute; left: 100px; top: 0;}.se-pre-con {position: fixed;left: 0px;top: 0px;width: 100%;height: 100%;z-index: 9999;background: url(images/Preloader_4.gif) center no-repeat #fff;}  
 </style>  
  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>

  <!--Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<script src="Fillform.js" type="text/javascript"></script>

<script>

$.get("Header.jsp", function (data) {
    $("#websiteHeader").replaceWith(data);
});
var date = new Date();
var d = new Date();        
d.setDate(date.getDate());
$(document).ready(function(){
if($('#desktopView').css('display') == 'block'){
		var date_input=$('input[name="date"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		var options={
		      format: 'yyyy-mm-dd',
		      container: container,
		      todayHighlight: true,
		      autoclose: true,
		      endDate: d,   
		    };
		    date_input.datepicker(options);
		}

 }); 
 </script> 
  
  </head>  
<body>
<form id="contactUS" action ="EditUserDetails" method ="post">
	<div class="se-pre-con"></div>

	<div id="websiteHeader" style="z-index: 1111;"></div>
<!-- ============== Header ends ============== -->

 <!-- main wrapper of the site starts -->  
 <div class="wrapper">  
 
 <main>  
 
 <!-- ============== Contact form block starts ============== -->  
 <section class="block contact-form">  
 <div class="step-content" style="padding-bottom:20px"> 
 <div class="step1"> 
 <div class="col-sm-1"></div>
 <div class="col-sm-5 wow fadeInLeft left-image">
 <figure>
 <img class="img-responsive" src="images/food-delivery.png" alt="Meal delivery service"/>
 </figure>
 </div>    
 <div class="col-sm-6 wow fadeInRight right-form"> 
 	<h3 id="msgs" class="wow fadeInUp wrapper" style="font-family: 'Raleway', Serif !important;color: #60ba62">
    	Hi dear, so glad to see you again!</h3>    

 <fieldset>
 	<div class="errortip" id="formtip" ></div>
 </fieldset>  
 <fieldset>
	 <input class="form-control" id ="email" name="email" type="email" placeholder="Your Email ID" required="required" onblur="isValidEmail()"/>
	 <div class="errortip" id="emailtip"></div>
 </fieldset>  
 <fieldset>
 	<div id="desktopView">
 	<input class="form-control" id ="date" name="date" type="text" placeholder="Date of Birth" required="required" />
 	</div>
 	<div id="mobileView">
	<label style="font-family: 'Raleway', Serif !important;color: #AED581"> Date of Birth
                            	</label>
 	<input class="form-control" id ="datem" name="datem" type="date" required="required" />
 	</div>
 	<div class="errortip" id="dobtip"></div>
 </fieldset>
 <input type="hidden" name="dob" id="dob">
 <fieldset>
 	<input class="inputbtn btn" type="button" value="Manage Your Order" onClick="fieldValidations();" />
 </fieldset>  
  
 </div>  
 </div>  
 </div>  
 </section>  
 <!-- ============== Contact form block ends ============== -->  
 </main>  
 
  
 </div>  
 <!-- main wrapper of the site ends -->  


 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->  
  
  <script src="js/jquery-ui-1.9.2.custom.js"></script>  

  <script src="js/bootstrap.min.js"></script>  
  <script src="js/wow.min.js"></script>  

  <script src="js/jquery.parallax-1.1.3.js"></script>  
  <script src="js/jquery.featureCarousel.js"></script>  
  <script src="js/jquery.bxslider.js"></script>  
  <script src="js/owl.carousel.js"></script>  
  <script src="js/jquery.counterup.js"></script>  
  <script src="js/main.js"></script>  
 </form>
<div id="footer" >
 </div>
</body>
<script type="text/javascript">
	$.get("footer.html", function(data) {
		$("#footer").replaceWith(data);
	});
</script> 
 </html> 
