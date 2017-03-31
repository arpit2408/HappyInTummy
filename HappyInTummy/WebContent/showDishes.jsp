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
<link rel="shortcut icon" type="image/png" href="favicon.png" />
<link rel="shortcut icon" type="image/png" href="favicon.png" />
<title>HappyInTummy</title>

<!-- style lists -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/hover.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/jquery.bxslider.css" rel="stylesheet">
<link href="css/owl.carousel.css" rel="stylesheet">
<link href="css/owl.transitions.css" rel="stylesheet">
<link rel="stylesheet" href="css/feature-carousel.css">
<link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<!-- Raleway font embed -->
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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">

	function showhide() {
			alert("showhide");
			//document.getElementById("vegan").style.display = "none";
			
			document.getElementById("non-veg").style.display = "block";
			alert("show");
			//document.getElementById("glutenfree").style.display = "none";

		/*  else if (document.getElementById("prefid").value == 2) {

			document.getElementById("non-veg").style.display = "block";
			document.getElementById("vegan").style.display = "none";
			document.getElementById("glutenfree").style.display = "none";
			

		}
		else if (document.getElementById("prefid").value == 3) {

			document.getElementById("non-veg").style.display = "none";
			document.getElementById("vegan").style.display = "none";
			document.getElementById("glutenfree").style.display = "block";
			

		} */
	}
	
</script>
<body>
	
	<!-- main wrapper of the site starts -->
	<div class="wrapper">
	<!-- ============== Sample menu banner starts ============== -->

		<main> <!-- main content starts --> <!-- ============== Sample menu block starts ============== -->


		<!-- ============== Sample menu block ends ============== --> <!-- ============== select menu block starts ============== -->
		<section class="block select-menu-block">
		
		

			<div id="non-veg">

				<div class='food-tab wow fadeInUp'>
					<div class='container'>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a
								href="#breakfastnv" role="tab" data-toggle="tab">Breakfast</a></li>
							<li role="presentation"><a href="#lunchnv" role="tab"
								data-toggle="tab">Lunch</a></li>
							<li role="presentation"><a href="#dinnernv" role="tab"
								data-toggle="tab">Dinner</a></li>
						</ul>
					</div>
				</div>
				<div class='tab-description'>
					<div class="container">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade in active"
								id="breakfastnv">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div class="row menu-listing-wrap list-view">
									<c:forEach items="${listNonVeg}" var="product">
										<c:if test="${product.meal_Type =='Breakfast'}">
											<% System.out.println("hi nv 1"+ (java.util.List)(request.getAttribute("listNonVeg"))); %>
											<!--single menu -->
											<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">
												<div class="menu-item-wrap" style="width: 2000px">
													<figure>
														<a href="#"><img class="img-responsive"
															src="images/${product.image_Name}" alt="Menu image"></a>
													</figure>
													<div class="mid">
														<h4>
															<a href="#">${product.item_Name}</a>
														</h4>
														<span>${product.item_Desc}</span>
														<div class="facts-table">
															<table>
																<tbody>
																	<tr>
																		<td><span>Calories</span></td>
																		<td><span>${product.calorie}</span></td>
																	</tr>
																	<tr>
																		<td><span>Proteins</span></td>
																		<td><span>${product.proteins}g</span></td>
																	</tr>
																	<tr>
																		<td><span>Fats</span></td>
																		<td><span>${product.fats}g</span></td>
																	</tr>
																	<tr>
																		<td><span>Carbohydrates</span></td>
																		<td><span>${product.carbohydrates}g</span></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>

												</div>
											</div>
											<!--single menu ends -->
										</c:if>
									</c:forEach>
								</div>

								<!-- == food listing group ends == -->
							</div>
							<div role="tabpanel" class="tab-pane fade" id="lunchnv">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div class="row menu-listing-wrap list-view">
									<c:forEach items="${listNonVeg}" var="product">

										<c:if test="${product.meal_Type =='Lunch'}">
											<!--single menu -->
											<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">
												<div class="menu-item-wrap">
													<figure>
														<a href="#"><img class="img-responsive"
															src="images//${product.image_Name}" alt="Menu image"></a>
													</figure>
													<div class="mid">
														<h4>
															<a href="#">${product.item_Name}</a>
														</h4>
														<span>${product.item_Desc}</span>
														<div class="facts-table">
															<table>
																<tbody>
																	<tr>
																		<td><span>Calories</span></td>
																		<td><span>${product.calorie}</span></td>
																	</tr>
																	<tr>
																		<td><span>Proteins</span></td>
																		<td><span>${product.proteins}g</span></td>
																	</tr>
																	<tr>
																		<td><span>Fats</span></td>
																		<td><span>${product.fats}g</span></td>
																	</tr>
																	<tr>
																		<td><span>Carbohydrates</span></td>
																		<td><span>${product.carbohydrates}g</span></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>

												</div>
											</div>
											<!--single menu ends -->
										</c:if>
									</c:forEach>
								</div>

								<!-- == food listing group ends == -->
							</div>

							<div role="tabpanel" class="tab-pane fade" id="dinnernv">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div class="row menu-listing-wrap list-view">
									<c:forEach items="${listNonVeg}" var="product">
										<c:if test="${product.meal_Type =='Dinner'}">
											<!--single menu -->
											<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">
												<div class="menu-item-wrap">
													<figure>
														<a href="#"><img class="img-responsive"
															src="images//${product.image_Name}" alt="Menu image"></a>
													</figure>
													<div class="mid">
														<h4>
															<a href="#">${product.item_Name}</a>
														</h4>
														<span>${product.item_Desc}</span>
														<div class="facts-table">
															<table>
																<tbody>
																	<tr>
																		<td><span>Calories</span></td>
																		<td><span>${product.calorie}</span></td>
																	</tr>
																	<tr>
																		<td><span>Proteins</span></td>
																		<td><span>${product.proteins}g</span></td>
																	</tr>
																	<tr>
																		<td><span>Fats</span></td>
																		<td><span>${product.fats}g</span></td>
																	</tr>
																	<tr>
																		<td><span>Carbohydrates</span></td>
																		<td><span>${product.carbohydrates}g</span></td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>

												</div>
											</div>
											<!--single menu ends -->
										</c:if>
									</c:forEach>
								</div>

								<!-- == food listing group ends == -->
							</div>

						</div>
						<!-- NV ends -->
					</div>
				</div>
				<div class="row">
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
						<input type="submit" value="Take me to Plans" onClick="submitform();"/>
						</div>
						<div class="col-sm-4"></div>
				</div>
			</div>
			

		</section>
		<!-- ============== select menu block starts ============== --> 
		</main>
		<!-- main content ends -->

		<!-- ============== footer block starts ============== -->
		<footer> Happy Tummy Copyright</footer>
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
</body>
</html>