<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" data-baseuri="${pageContext.request.contextPath}/">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="shortcut icon" type="image/png" href="favicon.png" />
<link rel="shortcut icon" type="image/png" href="favicon.png" />
<title>Happy Tummy</title>
<!-- style lists -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/jquery.bxslider.css" rel="stylesheet">
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/owl.transitions.css" rel="stylesheet">
<link rel="stylesheet" href="css/feature-carousel.css">
<link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
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

</head>
<body onload="setCorrectActionAfterSubmit('About');reloadPref();callBmiMenu();" class="home-page home-version1-page">
<script>
$.get("Header.jsp", function (data) {
    $("#websiteHeader").replaceWith(data);
});
</script>
	
<script>
$.get("Menu_Options.jsp", function (data) {
    $("#menu_options").replaceWith(data);
});

$(document).ready(function () {
validateOnblurSelectProgram();
});

</script>
<input type="hidden" id="pagecontext" value="${pageContext.request.contextPath}/">
<header  id="websiteHeader"></header>
	<div class="wrapper">

		
		<!-- =============== plan steps block starts ================== -->
		<section class="plan-step">
			<div class="steps-wrapper">
				<!-- == step navigation starts ==-->
				<div id="letsee" style="display:display;">
					<div id="menu_options" ></div>
				</div>
				<!-- == step navigation ends ==-->
				<!-- == step content starts ==-->
				<div class="step-content">
				
				<form id="chooseprogram" method="POST" action="${pageContext.request.contextPath}/ChooseYourPlan.jsp">
					<div class="row bmiMenuSelect">
						<div class="col-sm-2"></div>
						<label  style="font-size: 1.3em;font-family: 'Raleway', Serif !important;" class="col-sm-5"> Want personalized menu? Enter your height & weight (optional)</label>
						<input id="weight" type="number" class="col-sm-1"  placeholder="Weight (kgs)" style="padding-left: 5px;"  onchange="callBmiMenu();"></input>
							<span class="errorspan" id="weighterror"></span>
						<div style="width:2mm;"></div>
						<input id="height" type="number" class="col-sm-1"  style="padding-left: 10px;"  placeholder="Height (cms)"   onchange="callBmiMenu();"></input>
								<span class="errorspan" id="heighterror"></span>
					</div>
	
		<!-- main wrapper of the site starts -->
		<div class="wrapperforPref">
	<!-- ============== Sample menu banner starts ============== -->

					<div class="text-center wow flipInX animated menuSelectOptions "
					style="visibility: visible; animation-name: flipInX; padding-top:15px;padding-bottom:15px;" >
					<div class="col-sm-2"></div>
					<label style="font-size: 1.3em;font-family: 'Raleway', Serif !important;" class="col-sm-3">Select Preference <font color="red"><bold>* </bold></font> </label>
						<select  id="prefid" class="select-program" onchange="callBmiMenu();" >
							<option value="" >Select Program</option>
							<option value="1" >Vegan</option>
							<option value="2">Non-Vegeterian</option>
							<option value="3">Gluten-free</option>
						</select>
					<span class="errorspan" id="preferror"></span>
					</div>
					
		<!-- ============== Sample menu block ends ============== --> <!-- ============== select menu block starts ============== -->
		<section class="block select-menu-block">

			<!-- == Tab description starts == -->
			<div id="vegan" style="display: none;">
				<!-- == menu tab part starts == -->
				<div class='food-tab wow fadeInUp bflunchDinnerMenu'>
					<div class='container'>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#breakfastv"
								role="tab" data-toggle="tab">Breakfast</a></li>
							<li role="presentation"><a href="#lunchv" role="tab"
								data-toggle="tab">Lunch</a></li>
							<li role="presentation"><a href="#dinnerv" role="tab"
								data-toggle="tab">Dinner</a></li>
						</ul>
					</div>
				</div>
				<!-- == menu tab part ends == -->
				<div class='tab-description'>
					<div class="container">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active"
								id="breakfastv">
								<!-- == food listing group starts == -->

								<!--menu listing -->
								<div id="breakfastvitems" class="row menu-listing-wrap list-view">
									
								</div>

								<!-- == food listing group ends == -->
							</div>
							<div role="tabpanel" class="tab-pane fade" id="lunchv">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div id="lunchvitems"  class="row menu-listing-wrap list-view">
								
								</div>

								<!-- == food listing group ends == -->
							</div>

							<div role="tabpanel" class="tab-pane fade" id="dinnerv">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div id="dinnervitems"  class="row menu-listing-wrap list-view">
									
								</div>

								<!-- == food listing group ends == -->
							</div>

						</div>
					</div>
				</div>
				<br>
				
			</div>
			
			
			
			
			<div id="non-veg" style="display: none;">
				<!-- == menu tab part starts == -->
				<div class='food-tab wow fadeInUp bflunchDinnerMenu'>
					<div class='container'>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#breakfastnv"
								role="tab" data-toggle="tab">Breakfast</a></li>
							<li role="presentation"><a href="#lunchnv" role="tab"
								data-toggle="tab">Lunch</a></li>
							<li role="presentation"><a href="#dinnernv" role="tab"
								data-toggle="tab">Dinner</a></li>
						</ul>
					</div>
				</div>
				<!-- == menu tab part ends == -->
				<div class='tab-description'>
					<div class="container">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active"
								id="breakfastnv">
								<!-- == food listing group starts == -->

								<!--menu listing -->
								<div id="breakfastnvitems" class="row menu-listing-wrap list-view">
									
								</div>

								<!-- == food listing group ends == -->
							</div>
							<div role="tabpanel" class="tab-pane fade" id="lunchnv">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div id="lunchnvitems"  class="row menu-listing-wrap list-view">
								
								</div>

								<!-- == food listing group ends == -->
							</div>

							<div role="tabpanel" class="tab-pane fade" id="dinnernv">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div id="dinnernvitems"  class="row menu-listing-wrap list-view">
									
								</div>

								<!-- == food listing group ends == -->
							</div>

						</div>
					</div>
				</div>
				<br>
				
			</div>
			
			
			
			
			<div id="glutenfree" style="display: none;">
				<!-- == menu tab part starts == -->
				<div class='food-tab wow fadeInUp bflunchDinnerMenu'>
					<div class='container'>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#breakfast"
								role="tab" data-toggle="tab">Breakfast</a></li>
							<li role="presentation"><a href="#lunch" role="tab"
								data-toggle="tab">Lunch</a></li>
							<li role="presentation"><a href="#dinner" role="tab"
								data-toggle="tab">Dinner</a></li>
						</ul>
					</div>
				</div>
				<!-- == menu tab part ends == -->
				<div class='tab-description'>
					<div class="container">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active"
								id="breakfast">
								<!-- == food listing group starts == -->

								<!--menu listing -->
								<div id="breakfastitems" class="row menu-listing-wrap list-view">
									
								</div>

								<!-- == food listing group ends == -->
							</div>
							<div role="tabpanel" class="tab-pane fade" id="lunch">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div id="lunchitems"  class="row menu-listing-wrap list-view">
								
								</div>

								<!-- == food listing group ends == -->
							</div>

							<div role="tabpanel" class="tab-pane fade" id="dinner">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div id="dinneritems"  class="row menu-listing-wrap list-view">
									
								</div>

								<!-- == food listing group ends == -->
							</div>

						</div>
					</div>
				</div>
				<br>
				
			</div>

		</section>
	

	</div>
	<!-- main wrapper of the site ends -->
	
			<div class="row">
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
						<input type="button" class="btn" value="Take me to Plans" onClick="submitformselectprogram();"/>
						</div>
						<div class="col-sm-4"></div>
				</div>
				</form>
				</div>
				<!-- == step content ends ==-->
			</div>
		</section>
		<!-- =============== plan steps block ends ================== --> 
		
			
	</div>
	<!-- main wrapper of the site ends -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
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
</body>
</html>