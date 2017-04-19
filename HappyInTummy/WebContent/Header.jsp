<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="container">
			<div class="row">
				<!-- ============== Left logo block starts ============== -->
				<div class="col-sm-1 logo-block">
					
						<a href="${pageContext.request.contextPath}/LandingPage.jsp"><img class="img-responsive"
							src="images/mascot25Orange.png" alt="HappyTummy Logo" />
							</a>
						
				</div>
				<div id="WebsiteName" style="color:white; font-size:2.5em !important; font-family: 'Raleway', Serif !important;" class="col-md-2">Happy Tummy</div>
				<!-- ============== Left logo block ends ============== -->
				<!-- ============== Main navigation starts ============== -->
				<div class="col-xs-12 col-sm-8 menu-block">
					<nav class="navbar navbar-default">
						<div class="container-fluid">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse">
								<ul class="nav navbar-nav text-right pull-right" >
									<li ><a href="${pageContext.request.contextPath}/LandingPage.jsp" class="home" onclick="sessionStorage.clear();">HOME
									</a></li>					
									<li><a href="${pageContext.request.contextPath}/choose-plan-about-us.jsp"  class="placeorder" onclick="sessionStorage.clear();">Place Order</a></li>
									<li><a href="${pageContext.request.contextPath}/contact-us.html"  class="yourorder" onclick="sessionStorage.clear();">Your Order</a></li>
									<li><a href="${pageContext.request.contextPath}/Pricing.jsp"  class="pricing"  onclick="sessionStorage.clear();">Pricing</a></li>
									
								</ul>
							</div>
							<!-- /.navbar-collapse -->
						</div>
						<!-- /.container-fluid -->
					</nav>
				</div>

				<!-- ============== Main navigation ends ============== -->
			</div>
		</div>
	</header>
</body>
</html>