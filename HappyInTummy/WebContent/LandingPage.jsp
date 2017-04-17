
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="shortcut icon" type="image/png" href="favicon.png" />
<link rel="shortcut icon" type="image/png" href="favicon.png" />
<title>Happy Tummy</title>
<!-- style lists -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$.get("Header.jsp", function(data) {
		$("#websiteHeader").replaceWith(data);
	});
</script>
<script src="landingPage.js" type="text/javascript"></script>

</head>
<body>

	<div id="websiteHeader" style="z-index: 9999"></div>

	<div class="container-full">

		<div class="row bm-remove animate" data-anim-type="fadeInRight">
			<div class="col-md-4">
				<div class="modern">
					<div id="happyTummyloc" class="cols-md-2">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3279.604190109535!2d-86.59940138561653!3d34.71516198043077!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88626ca3294f35bb%3A0x67807af9b365243e!2sHappy+Tummy!5e0!3m2!1sen!2sus!4v1492014121845"
							width="600" height="645%" frameborder="0" style="border: 0"
							allowfullscreen></iframe>
					</div>
					<div id="happyTummyad" class="cols-md-2">
						<iframe style="background-image: url('images/YogurtAd.PNG')"
							width="600" height="645%" frameborder="0" style="border: 0"
							allowfullscreen></iframe>
					</div>

				</div>
			</div>
			<div class="col-md-8">
				<div id="optionsLandingPage" class="cols-md-8">

					<div id="radioButtonChoose" class="form-group">
						<label for="happy"
							class="col-sm-5 col-md-5 control-label text-right">Select
							your preference:</label>
						<div class="col-sm-4 col-md-4">
							<div class="input-group" style="margin-bottom: 20px;">
								<div id="radioBtn" class="btn-group">
									<div class="row">
										<span class="btn btn-primary btn-sm active fa fa-check-circle"
											data-toggle="estadotwo" data-value="Y"
											style="background-color: #286090; width: 179px; height: 43px; display: inline-block;"
											id="vegmenuid" onclick="getAccMenu(this)">
											Vegan</span>
									</div>
									<div class="row">

										<span class="btn btn-danger btn-sm notActive"
											data-toggle="estadotwo" data-value="N"
											style="background-color: #d9534f; width: 179px; height: 43px;"
											id="nonvegmenuid" onclick="getAccMenu(this)">
											Non-Vegeterian</span>
									</div>
									<div class="row ">
										<span class="btn btn-info btn-sm notActive"
											data-toggle="estadotwo" data-value="Q"
											style="background-color: #31b0d5; width: 179px; height: 43px;"
											id="glutenfreemenuid" onclick="getAccMenu(this)"> 
											Gluten-Free </span>
									</div>
								</div>
								<input type="hidden" name="estadotwo" id="estadotwo">
							
							</div>
						</div>
						<div class="col-sm-2 col-md-2"
							onclick='window.location="${pageContext.request.contextPath}/menu"'
							style="padding-top: 25px;">
							<span class="btn btn-warning btn-sm  tiltedButtons"
								data-value="N"
								style="background-color: #f0ad4e; width: 185px; color: black;">
								New? See our Menu..!!</span>
						</div>
						
						<div class="col-sm-2 col-md-2" style="padding-top: 10px;"
							onclick='window.location="${pageContext.request.contextPath}/choose-plan-about-us.jsp"'>
							<span class="btn btn-warning btn-sm tiltedButtons" data-value="N"
								style="background-color: #f0ad4e; width: 185px; color: black;">
								Already Familiar..!!</span>
						</div>
						<div class="col-sm-1 col-md-1"></div>
					</div>

					<!-- == menu listing starts == -->
					<div id="vegmenu" class="row menu-listing"
						style="margin-top: 14px; padding-left: 22px;">

						<div 
							class="col-xs-12 col-sm-4 menu-item wow fadeInUp menulistingLanding">
							<div class="text-center menu-item-wrap">
								<figure> <a href="#"><img class="img-responsive"
									src="images/V_L_8.jpg" alt="Menu image" /></a> </figure>

							</div>
						</div>

						<div 
							class="col-xs-12 col-sm-4 menu-item wow fadeInUp menulistingLanding">
							<div class="text-center menu-item-wrap">
								<figure> <a href="#"><img class="img-responsive"
									src="images/V_L_100.jpg" alt="Menu image" /></a> </figure>

							</div>
						</div>

						<div 
							class="col-xs-12 col-sm-4 menu-item wow fadeInUp menulistingLanding">
							<div class="text-center menu-item-wrap">
								<figure> <a href="#"><img class="img-responsive"
									src="images/V_L_1.jpg" alt="Menu image" /></a> </figure>

							</div>
						</div>
						<div class="col-xs-12 col-sm-1 menu-item wow fadeInUp"></div>
					</div>
					<div id="nonvegmenu" class="row menu-listing"
						style="margin-top: 14px; padding-left: 22px;display:none;">



						<div 
							class="col-xs-12 col-sm-4 menu-item wow fadeInUp menulistingLanding">
							<div class="text-center menu-item-wrap">
								<figure> <a href="#"><img class="img-responsive"
									src="images/NV_D_36.jpg" alt="Menu image" /></a> </figure>

							</div>
						</div>

						<div 
							class="col-xs-12 col-sm-4 menu-item wow fadeInUp menulistingLanding">
							<div class="text-center menu-item-wrap">
								<figure> <a href="#"><img class="img-responsive"
									src="images/NV_D_37.jpg" alt="Menu image" /></a> </figure>

							</div>
						</div>

						<div 
							class="col-xs-12 col-sm-4 menu-item wow fadeInUp menulistingLanding">
							<div class="text-center menu-item-wrap">
								<figure> <a href="#"><img class="img-responsive"
									src="images/NV_L_1.jpg" alt="Menu image" /></a> </figure>

							</div>
						</div>
						<div class="col-xs-12 col-sm-1 menu-item wow fadeInUp"></div>
					</div>
					<div id="glutenfreemenu" class="row menu-listing"
						style="margin-top: 14px; padding-left: 22px;display:none;">

						<div 
							class="col-xs-12 col-sm-4 menu-item wow fadeInUp menulistingLanding">
							<div class="text-center menu-item-wrap">
								<figure> <a href="#"><img class="img-responsive"
									src="images/GV_BK_3.jpg" alt="Menu image" /></a> </figure>

							</div>
						</div>

						<div 
							class="col-xs-12 col-sm-4 menu-item wow fadeInUp menulistingLanding">
							<div class="text-center menu-item-wrap">
								<figure> <a href="#"><img class="img-responsive"
									src="images/GV_L_3.jpg" alt="Menu image" /></a> </figure>

							</div>
						</div>

						<div 
							class="col-xs-12 col-sm-4 menu-item wow fadeInUp menulistingLanding">
							<div class="text-center menu-item-wrap">
								<figure> <a href="#"><img class="img-responsive"
									src="images/GV_BK_2.jpg" alt="Menu image" /></a> </figure>

							</div>
						</div>
						<div class="col-xs-12 col-sm-1 menu-item wow fadeInUp"></div>
					</div>
					
				</div>
			</div>
		</div>


	</div>
	<div id="happyTummylocm" class="cols-md-2">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3279.604190109535!2d-86.59940138561653!3d34.71516198043077!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88626ca3294f35bb%3A0x67807af9b365243e!2sHappy+Tummy!5e0!3m2!1sen!2sus!4v1492014121845"
			width="600" height="645%" frameborder="0" style="border: 0"
			allowfullscreen></iframe>
	</div>
	<div id="happyTummyadm" class="cols-md-2">
		<iframe style="background-image: url('images/YogurtAd.PNG')"
			width="600" height="645%" frameborder="0" style="border: 0"
			allowfullscreen no-repeat></iframe>
	</div>

</body>
</html>