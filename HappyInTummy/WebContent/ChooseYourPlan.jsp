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

<script>

function getPlans()
{
	//alert(" pref from session "+sessionStorage.getItem('Preference'));
	dataString = "pref=" + sessionStorage.getItem('Preference'); 
	$.ajax({
		    url: 'GetPlanServlet',
		    type: 'POST',      
		    cache: false,
		    data :  dataString,
			dataType: "json",
		    success: function(data) {	
		    	setPlans(data);
		    }
			
	
	 });
	
}


function setPlans(data) {
	  if( sessionStorage.getItem('Discount')==null)
	  {
	  document.getElementById('discounthid').value = Math.floor((Math.random() * 10) + 1);
	  }
	  else
	  {
		  document.getElementById('discounthid').value = sessionStorage.getItem('Discount');
	  }
	  sessionStorage.setItem('Discount', document.getElementById('discounthid').value);
	  document.getElementById('discount').innerHTML= 'Order Immediately to get '+ document.getElementById('discounthid').value+'% discount';
	  for (var i=0;i<data.length;++i)
      {
		  if(i==0){
		  
		  document.getElementById('plan1id').value = data[i].id;
		  document.getElementById('plan1cost').value = data[i].cost;
		  document.getElementById('plan1weeks').value = data[i].weeks;
		  document.getElementById('plan1cost').innerHTML = '$'+data[i].cost;
		  document.getElementById('plan1weeks').innerHTML = data[i].weeks+' WEEK PROGRAM';
		  }
		  if(i==1){
		  document.getElementById('plan2id').value = data[i].id;
		  document.getElementById('plan2cost').value = data[i].cost;
		  document.getElementById('plan2weeks').value = data[i].weeks;
		  document.getElementById('plan2cost').innerHTML = '$'+data[i].cost;
		  document.getElementById('plan2weeks').innerHTML = data[i].weeks+' WEEKS PROGRAM';
		  }
		  if(i==2)
		  {
		  document.getElementById('plan3id').value = data[i].id;
		  document.getElementById('plan3cost').value = data[i].cost;
		  document.getElementById('plan3weeks').value = data[i].weeks;
		  document.getElementById('plan3cost').innerHTML = '$'+data[i].cost;
		  document.getElementById('plan3weeks').innerHTML = data[i].weeks+' WEEKS PROGRAM';
		  }
      }
	
}
function submitform(element,elementweek,elementCost)
{
 //HTML5 session storage
 sessionStorage.setItem('PlanId', document.getElementById(element).value);
 sessionStorage.setItem('PlanIdText', document.getElementById(elementweek).value);
 //alert(" plan weeks "+ document.getElementById(elementweek).value);
 sessionStorage.setItem('PlanIdCost', document.getElementById(elementCost).value);
 document.forms.chooseplan.submit();
 var baseuri = $("html").data("baseuri");
 $("#Checkout").attr("href", baseuri+"choose-plan-checkout.jsp");
}
</script>

<body onload="getPlans();setCorrectActionAfterSubmit('SelectProgram')" class="home-page home-version1-page">
<script>
$.get("Header.jsp", function (data) {
    $("#websiteHeader").replaceWith(data);
});
</script>
	
<script>
$.get("Menu_Options.jsp", function (data) {
    $("#menu_options").replaceWith(data);
});
</script>
<input type="hidden" id="pagecontext" value="${pageContext.request.contextPath}/">
<header  id="websiteHeader"></header>
	<div class="wrapper">

		
		<!-- =============== plan steps block starts ================== -->
		<section class="plan-step">
			<div class="steps-wrapper">
				<!-- == step navigation starts ==-->
				<div id="menu_options"></div>
				<!-- == step navigation ends ==-->
				<!-- == step content starts ==-->
				<div class="step-content">
				<form id="chooseplan" method="POST" action="${pageContext.request.contextPath}/choose-plan-checkout.jsp">
					<h3 class="text-center" style="font-size: 1.4em;font-family: 'Raleway', sans-serif !important;" class="col-sm-12">Eating good without being on diet.</h3>
					<input type="hidden" id="discounthid">
					<h3 class="text-center" style="font-size: 1.8em;font-family: 'Raleway', sans-serif !important;color:#60ba62" class="col-sm-12"><label id="discount"> </label></h3>
						<!-- ============== pricing block starts ============== -->
						<section class="block pricing-block">
							<div class="container">
								
								<!-- == pricing box starts == -->
								<div class="row pricing-block-gray">
									<!-- pricing box single starts -->
									<div class="col-xs-12 col-sm-4 wow fadeInLeft pricing-box">
										<div class="text-center price-box-wrap">
										<input type="hidden" id="plan1id">
											<h5><label id="plan1weeks"> WEEK PROGRAM</label> </h5>
											<div class="price-per-day">
											
												<span class="price"><label id="plan1cost">$</label>
												
												</span> <span class="per-day">/day</span>
											</div>
											<h6>Meals for Breakfast, Lunch, Dinner </h6>
											<h6>
												Calories as per your BMI<br />
											</h6>
											
											<a href="#" class="btn box-btn order-now-btn test-uppercase" onclick="submitform('plan1id','plan1weeks','plan1cost');">order now</a>
										</div>
									</div>
									<!-- pricing box single ends -->
									<!-- pricing box single starts -->
									<div
										class="col-xs-12 col-sm-4 pricing-box wow fadeInUp pricing-box">
										<div class="text-center price-box-wrap">
											<input type="hidden" id="plan2id">
											<h5><label id="plan2weeks"> WEEK PROGRAM</label> </h5>
											<div class="price-per-day">
											
												<span class="price"><label id="plan2cost">$</label>
												
												</span> <span class="per-day">/day</span>
											</div>
											<h6>Meals for Breakfast, Lunch, Dinner </h6>
											<h6>
												Calories as per your BMI<br />
											</h6>
											
											<a href="#" class="btn box-btn order-now-btn test-uppercase" onclick="submitform('plan2id','plan2weeks','plan2cost');">order now</a>
									
										</div>
									</div>
									<!-- pricing box single ends -->
									<!-- pricing box single starts -->
									<div class="col-xs-12 col-sm-4 wow fadeInRight pricing-box">
										<div class="text-center price-box-wrap">
											<input type="hidden" id="plan3id">
											<h5><label id="plan3weeks"> WEEK PROGRAM</label> </h5>
											<div class="price-per-day">
											
												<span class="price"><label id="plan3cost">$</label>
												
												</span> <span class="per-day">/day</span>
											</div>
											<h6>Meals for Breakfast, Lunch, Dinner </h6>
											<h6>
												Calories as per your BMI<br />
											</h6>
											
											<a href="#" class="btn box-btn order-now-btn test-uppercase" onclick="submitform('plan3id','plan3weeks','plan3cost');">order now</a>
									
										</div>
									</div>
									<!-- pricing box single ends -->
								</div>
								<!-- pricing box ends -->
							</div>
						</section>
						</form>
					<!-- choose plan select program step ends -->
				</div>
				<!-- == step content ends ==-->
			</div>
		</section>
		<!-- =============== plan steps block ends ================== --> </main>
		<!-- ============== footer block starts ============== -->
		
		<!-- ============== footer block ends ============== -->
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