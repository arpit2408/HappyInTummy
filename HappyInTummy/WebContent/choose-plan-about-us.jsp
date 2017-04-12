<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en" data-baseuri="${pageContext.request.contextPath}/">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- favicon -->

<link rel="shortcut icon" type="image/png" href="favicon.png" />
<link rel="shortcut icon" type="image/png" href="favicon.png" />
<title>HappyTummy</title>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>  
<!-- style lists -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"/>
<link href="http://cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/a549aa8780dbda16f6cff545aeabc3d71073911e/build/css/bootstrap-datetimepicker.css" rel="stylesheet"/>

<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<link href="css/animate.css" rel="stylesheet">
<link href="css/hover.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/jquery.bxslider.css" rel="stylesheet">
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/owl.transitions.css" rel="stylesheet">
<link rel="stylesheet" href="css/feature-carousel.css">
<link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/intlTelInput.css" />
<script src="Fillform.js" type="text/javascript"></script>
<script src="js/intlTelInput.min.js"></script>
<!-- montserrat font embed -->
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

	$.get("Menu_Options.jsp", function(data) {
		$("#menu_options").replaceWith(data);
	});
	

</script>

<script>
function submitform()
{
	 sessionStorage.setItem('Name', document.forms.aboutyou.Name.value);
	 sessionStorage.setItem('Email', document.forms.aboutyou.Email.value);
	 var gender=$('#Male').is(':checked')?"Male":"Female";
	 sessionStorage.setItem('DOB', document.forms.aboutyou.DOB.value);
	 sessionStorage.setItem('Gender',gender);
	 sessionStorage.setItem('Phone', document.forms.aboutyou.Phone.value);
	 sessionStorage.setItem('Zip', document.forms.aboutyou.Zip.value);
	 sessionStorage.setItem('City', document.forms.aboutyou.City.value);
	 sessionStorage.setItem('State', document.forms.aboutyou.State.value);
	 sessionStorage.setItem('Address', document.forms.aboutyou.Address.value);
	 document.forms.aboutyou.submit();
}
</script>

<body onload="reloadFormAboutYou();" class="choose-plan-page">
<form id="aboutyou"  data-toggle="validator" class="about-us-form"  method="POST" action="${pageContext.request.contextPath}/choose-plan-select-program.jsp">
	<!-- loader image before page load starts -->
	<div class="se-pre-con"></div>
	<!-- loader image before page load ends -->

	<!-- main wrapper of the site starts -->
	<div>

<!-- ============== Header starts ============== -->
<script>
$.get("Header.jsp", function (data) {
    $("#websiteHeader").replaceWith(data);
});
</script>

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
				<div class="step-content">

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
									<input type="text" class="form-control" id="Name" placeholder="Full Name" required>
								</fieldset>
								<fieldset>
									<input type="email" id="Email" placeholder="E-mail"   type="email"
                				data-fv-emailaddress-message="The value is not a valid email address"/>
								</fieldset>
								<fieldset>
								
								
						        <input type="date" id = "DOB" placeholder="Date of Birth" class="form-control" required/>
						               
						       
						        </fieldset>
								
								<fieldset>
									<input type="text" id="Phone" placeholder="Phone No." class="form-control"  
									 data-fv-intphonenumber="true"
									data-fv-intphonenumber-preferredcountries="US"
							    data-fv-intphonenumber-utilsscript="js/utils.js"
							    data-fv-intphonenumber-message="The phone number is not valid" 
							    required/>
								</fieldset>
								<fieldset>
									<input type="text" id="Address" placeholder="Address" class="form-control" required/>
								</fieldset>
								<fieldset>
									<input type="text" id="City" placeholder="City" class="form-control" required/>
								</fieldset>
								<fieldset>
									<input type="text" id="State" placeholder="State" class="form-control" required/>
								</fieldset>
								<fieldset>
									<input type="text"  id="Zip" placeholder="ZIP Code" class="form-control" data-fv-zipcode="true"
                data-fv-zipcode-country="US"   data-fv-zipcode-message="The value is not valid ZIP code" required/>
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
		<!-- =============== plan steps block ends ================== --> </main>


		<!-- ============== footer block starts ============== -->
		<footer class="limited-footer">
			<div class="container">&copy; 2017 MIS Copyrights.</div>
		</footer>
		<!-- ============== footer block ends ============== -->


	</div>
	<!-- main wrapper of the site ends -->

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script src="js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
	<script src="js/modernizr.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/wow.min.js" type="text/javascript"></script>
	<script src="js/Headroom.js" type="text/javascript"></script>
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
    