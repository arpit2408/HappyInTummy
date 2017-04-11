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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> 
</head>

<script type="text/javascript">
	$.get("Header.jsp", function(data) {
		$("#websiteHeader").replaceWith(data);
	});

	function showhide() {
		
		if (document.getElementById("prefid").value == 1) {
			document.getElementById("vegan").style.display = "block";
			document.getElementById("non-veg").style.display = "none";
			document.getElementById("glutenfree").style.display = "none";

		} else if (document.getElementById("prefid").value == 2) {

			document.getElementById("non-veg").style.display = "block";
			document.getElementById("vegan").style.display = "none";
			document.getElementById("glutenfree").style.display = "none";
			

		}
		else if (document.getElementById("prefid").value == 3) {

			document.getElementById("non-veg").style.display = "none";
			document.getElementById("vegan").style.display = "none";
			document.getElementById("glutenfree").style.display = "block";
			

		}
	}
	
</script>
<!-- <script type="text/javascript">
	$.get("showDishes.html", function(data) {
		$("#showdishes").replaceWith(data);
	});
</script> -->
<body onload="showhide();">
	<div id="websiteHeader" style="z-index: 1111;"></div>
	<!-- loader image before page load starts -->
	<div class="se-pre-con"></div>
	<!-- loader image before page load ends -->

	<!-- main wrapper of the site starts -->
	<div class="wrapper">


		<!-- ============== Sample menu banner starts ============== -->
		
		<!-- ============== Sample menu banner starts ============== -->

		<main> <!-- main content starts --> <!-- ============== Sample menu block starts ============== -->

		<div class="container">
			
			<!-- == menu listing starts == -->
			<!-- 
			<div class="row menu-listing">

				<div class="col-xs-12 col-sm-3 menu-item wow fadeInUp">
					<div class="text-center menu-item-wrap">
						<div class="food-item-display" style ="max-width:15%">
							<a href="#"><img class="img-responsive"
								src="images/porridge4blog_1_440x518.jpg" alt="Menu image" /></a>
						</div>
						<h4>
							<a href="#">PORRIDGE</a>
						</h4>
						<span>With fresh fruits</span>
					</div>
				</div>

				<div class="col-xs-12 col-sm-3 menu-item wow fadeInUp">
					<div class="text-center menu-item-wrap">
						<figure>
							<a href="#"><img class="img-responsive"
								src="images/bakedsalmon_270x270.jpeg" alt="Menu image" /></a>
						</figure>
						<h4>
							<a href="#">BAKED SALMON</a>
						</h4>
						<span>With fresh vegetables</span>
					</div>
				</div>

				<div class="col-xs-12 col-sm-3 menu-item wow fadeInUp">
					<div class="text-center menu-item-wrap">
						<figure>
							<a href="#"><img class="img-responsive"
								src="images/salmon-salad-yogurt.jpg" alt="Menu image" /></a>
						</figure>
						<h4>
							<a href="#">SALMON VEGGIE SALAD</a>
						</h4>
						<span>With Lemon Miso Dressing</span>
					</div>
				</div>

				<div class="col-xs-12 col-sm-3 menu-item wow fadeInUp">
					<div class="text-center menu-item-wrap">
						<figure>
							<a href="#"><img class="img-responsive"
								src="images/menu-img4.jpg" alt="Menu image" /></a>
						</figure>
						<h4>
							<a href="#">TOMATOES OMELET</a>
						</h4>
						<span>With Parsley and Feta Cheese</span>
					</div>
				</div>
			</div> -->
			<!-- == menu listing ends == -->
		</div>

		<!-- ============== Sample menu block ends ============== --> <!-- ============== select menu block starts ============== -->
		<section class="block select-menu-block">
			<%-- <%@ include file="showDishes.jsp"%> --%>
			<!-- 	<div id="showdishes">
	 	</div> -->
			<!-- == Tab description ends == -->

			<!-- <br> -->
			<div class="text-center"
				style="visibility: visible; padding-top: 30px;">
				<h4>Select Preference: </h4>
				<select id="prefid" onchange="showhide();">
					<!-- <option value="">Select Program</option> -->
					<option value="1" selected="selected">Vegan</option>
					<option value="2">Non-Vegeterian</option>
					<option value="3">Gluten-free</option>
				</select>


			</div>


			<!-- == Tab description starts == -->
			<div id="vegan" style="display: none;">
				<!-- == menu tab part starts == -->
				<div class='food-tab wow fadeInUp'>
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
								<div class="row menu-listing-wrap list-view">
									<c:forEach items="${listVegan}" var="product">
										<c:if test="${product.meal_Type =='Breakfast'}">
											<!--single menu -->
											<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">
												<div class="menu-item-wrap" style="width: 2000px">
													<figure>
														<a href="#"><img class="img-responsive menubflunchDinner"
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
							<div role="tabpanel" class="tab-pane fade" id="lunchv">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div class="row menu-listing-wrap list-view">
									<c:forEach items="${listVegan}" var="product">
										<c:if test="${product.meal_Type =='Lunch'}">
											<!--single menu -->
											<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">
												<div class="menu-item-wrap">
													<figure>
														<a href="#"><img class="img-responsive menubflunchDinner"
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

							<div role="tabpanel" class="tab-pane fade" id="dinnerv">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div class="row menu-listing-wrap list-view">
									<c:forEach items="${listVegan}" var="product">
										<c:if test="${product.meal_Type =='Dinner'}">
											<!--single menu -->
											<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">
												<div class="menu-item-wrap">
													<figure>
														<a href="#"><img class="img-responsive menubflunchDinner"
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

						</div>
					</div>
				</div>

			</div>

			<div id="non-veg" style="display: none;">

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
											<!--single menu -->
											<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">
												<div class="menu-item-wrap" style="width: 2000px">
													<figure>
														<a href="#"><img class="img-responsive menubflunchDinner"
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
														<a href="#"><img class="img-responsive menubflunchDinner"
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
														<a href="#"><img class="img-responsive menubflunchDinner"
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

						</div>
						<!-- NV ends -->
					</div>
				</div>
			</div>
			<div id="glutenfree" style="display: none;">
			
			
			<!-- == menu tab part starts == -->
				<div class='food-tab wow fadeInUp'>
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
								<div class="row menu-listing-wrap list-view">
									<c:forEach items="${listGlutenFree}" var="product">
										<c:if test="${product.meal_Type =='Breakfast'}">
											<!--single menu -->
											<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">
												<div class="menu-item-wrap" style="width: 2000px">
													<figure>
														<a href="#"><img class="img-responsive menubflunchDinner"
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
							<div role="tabpanel" class="tab-pane fade" id="lunch">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div class="row menu-listing-wrap list-view">
									<c:forEach items="${listGlutenFree}" var="product">
										<c:if test="${product.meal_Type =='Lunch'}">
											<!--single menu -->
											<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">
												<div class="menu-item-wrap">
													<figure>
														<a href="#"><img class="img-responsive menubflunchDinner"
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

							<div role="tabpanel" class="tab-pane fade" id="dinner">
								<!-- == food listing group starts == -->


								<!--menu listing -->
								<div class="row menu-listing-wrap list-view">
									<c:forEach items="${listGlutenFree}" var="product">
										<c:if test="${product.meal_Type =='Dinner'}">
											<!--single menu -->
											<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">
												<div class="menu-item-wrap">
													<figure>
														<a href="#"><img class="img-responsive menubflunchDinner"
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

						</div>
						<!--glutenfree ends-->
					</div>
				</div>
			</div>





		</section>
		<!-- ============== select menu block starts ============== --> </main>
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