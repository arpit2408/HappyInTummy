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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
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
var date = new Date();
var d = new Date();        
d.setDate(date.getDate());
$(document).ready(function(){
	if($('#desktopView').css('display') == 'block'){
	    var date_input=$('input[name="date"]'); //our date input has the name "date"
	    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	    var options={
	      format: 'mm/dd/yyyy',
	      container: container,
	      todayHighlight: true,
	      autoclose: true,
	      endDate: d,   
	    };
	    date_input.datepicker(options);
	}
	if($('#mobileView').css('display') == 'block'){
	    var date_input=$('input[name="datem"]'); //our date input has the name "date"
	    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	    var options={
	      format: 'mm/dd/yyyy',
	      container: container,
	      todayHighlight: true,
	      autoclose: true,
	      endDate: d,   
	    };
	    date_input.datepicker(options);
		}
 });
  
  
$.get("Menu_Options.jsp", function(data) {
	$("#menu_options").replaceWith(data);
});


$.get("Header.jsp", function (data) {
    $("#websiteHeader").replaceWith(data);
});



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



</script>
<!--   -->
<body class="choose-plan-page" onload="reloadFormAboutYou();">
<form id="aboutyou"   class="about-us-form"  method="POST" action="${pageContext.request.contextPath}/choose-plan-select-program.jsp">
<input type="hidden" id="pagecontext" value="${pageContext.request.contextPath}/">
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
									
										<div class="col-sm-12 col-sm-6 pull-left" style="margin-left: -16px;">
											<div class="light-font radio-btn">

												<input  class="radio-class" type="radio" id="Male" name="gender"
													value="Male"  checked = "checked"/> <span style="font-weight:bold;margin-top: -3px;">Men</span>
											</div>
										</div>
										
										<div class="col-sm-12 col-sm-6 pull-right" style="margin-right:-14px;">
											<div class="light-font radio-btn">
												<input  class="radio-class" type="radio" id="Female" name="gender"
													value="Female" /> <span style="font-weight:bold;margin-top: -3px;">Women</span>
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
                            		<div class="col-sm-5" style=" padding-right: 60px;">
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
												<input  class="radio-class" type="radio" id="Malem" name="genderm"
													value="Male"  checked = "checked"/> <span>Men</span>
											</div>
										</div>
										<div class="col-sm-12 col-sm-6 pull-right">
											<div class="light-font radio-btn radio-btn-women">
												<input  class="radio-class" type="radio" id="Femalem" name="genderm"
													value="Female" /> <span>Women</span>
											</div>
										</div>
									<span class="errorspan" id="gendererrorm"></span>
								</fieldset>
								<fieldset>
									<input type="text" class="form-control" id="Namem" placeholder="Full Name" />
									<span class="errorspan" id="nameerrorm"></span>
								</fieldset>
								<fieldset>
									<input type="email" class="form-control" id="Emailm" placeholder="E-mail" />
									 <span class="errorspan" id="emailerrorm"></span>
								</fieldset>
								<fieldset>
								<!-- <input class="form-control" id="datem" name="datem" 
                            		       placeholder="Date of Birth" type="text"/> -->
                            	<div class="form-group">
                            	<label style="font-family: 'Raleway', Serif !important;"> Date of Birth
                            	</label>
						        <input type="date" id = "datem" placeholder="Date of Birth" />  
					             <span class="errorspan" id="txtdoberrorm"></span>
					             </div>
						        </fieldset>
								
								<fieldset>
									<input type="text" class="form-control" id="Phonem" placeholder="Phone No." />
									<span class="errorspan" id="txtPhoneerrorm"></span>
								</fieldset>
								<fieldset>
									<input type="text" class="form-control" id="Addressm" placeholder="Address" />
									 <span class="errorspan" id="Addresserrorm"></span>
								</fieldset>
								<fieldset>
									<input type="text" class="form-control" id="Citym" placeholder="City" />
									<span class="errorspan" id="Cityerrorm"></span>
								</fieldset>
								<fieldset>
									<input type="text" class="form-control" id="Statem" placeholder="State" />
									<span class="errorspan" id="Stateerrorm"></span>
								</fieldset>
								<fieldset>
									<input type="text"  class="form-control" id="Zipm" placeholder="ZIP Code" />
									<span class="errorspan" id="zipCodeerrorm"></span>
								</fieldset>
								
									 <input type="button" class="btn" id="usrsubmitm" onclick="submitformForMobile();" value="Next"/>
								
							
							
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
	<script>
	$(document).ready(function () {
	validatefieldsonblur();
	});
	</script>
	
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
<div id="footer">
    </div>
</body>
<script type="text/javascript">
	$.get("footer.html", function(data) {
		$("#footer").replaceWith(data);
	});
</script>



</html>