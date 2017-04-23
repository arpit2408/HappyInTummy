<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">  
 <head>  
 <meta charset="utf-8">  
 <meta http-equiv="X-UA-Compatible" content="IE=edge">  
 <meta name="viewport" content="width=device-width, initial-scale=1">  
  
 <!-- favicon -->  
 <link rel="shortcut icon" type="image/png" href="favicon.png"/>  
 <link rel="shortcut icon" type="image/png" href="favicon.png"/>  
 <title>HappyTummy</title>  
  
 <!-- style lists -->  
 <link href="css/bootstrap.min.css" rel="stylesheet">  
 <link href="css/animate.css" rel="stylesheet">  
 <link href="css/hover.css" rel="stylesheet">  
 <link href="css/font-awesome.css" rel="stylesheet">  
 <link href="css/jquery.bxslider.css" rel="stylesheet">  
 <link href="css/owl.transitions.css" rel="stylesheet">  
 <link rel="stylesheet" href="css/feature-carousel.css">  
 <link href="css/jquery-ui-1.9.2.custom.css" rel="stylesheet">  
 <link href="css/style.css" rel="stylesheet">  
  
 <!-- montserrat font embed -->  
 <link href='https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,700' rel='stylesheet' type='text/css'>  
  
 <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->  
 <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->  
 <!--[if lt IE 9]>  
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>  
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>  
  <![endif]-->  
  
 <style>  
 /******* loader image before page load ******/  
 .no-js #loader {display: none;}.js #loader { display: block; position: absolute; left: 100px; top: 0;}.se-pre-con {position: fixed;left: 0px;top: 0px;width: 100%;height: 100%;z-index: 9999;background: url(images/Preloader_4.gif) center no-repeat #fff;}  
 </style>  
  
 </head>  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
$.get("Header.jsp", function (data) {
    $("#websiteHeader").replaceWith(data);
});
</script>

<body >
<div id="websiteHeader" style="z-index: 1111;"></div>

 <!-- loader image before page load starts -->  
 <div class="se-pre-con"></div>  
 <!-- loader image before page load ends -->  
  
 <!-- main wrapper of the site starts -->  
 <div class="wrapper">  
  
 
  
 <main>  
 
 <!-- ============== Contact form block starts ============== -->  
 <section class="block contact-form">  
 <div class="step-content" style="padding-bottom:20px"> 
 <div class="step1"> 
 <div class="col-sm-1"></div>
 <div class="col-sm-4 wow fadeInLeft left-image">
	 <figure>
	 <img class="img-responsive" src="images/healthy-lifestyle.jpg" alt="Oops Smiley"/>
	 </figure>
 </div>    
 <div class="col-sm-5 wow fadeInRight right-form">   
 <h3 class="wow fadeInUp wrapper" style="font-size: 1.5em; font-family: 'Raleway', sans-serif !important;color:#60ba62">${displayMessage}</h3>  
 </div>  
 </div>  
 </div>  
 </section>   
 </main>   
  
  
 <!-- ============== footer block starts ============== -->  
 <footer>  
  
 </footer>  
 <!-- ============== footer block ends ============== -->  
  
  
 </div>  
 <!-- main wrapper of the site ends -->  
  
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->  
 <script src="js/jquery-3.1.1.min.js"></script>  
 <script src="js/jquery-ui-1.9.2.custom.js"></script>  
 <script src="js/modernizr.js"></script>  
 <script src="js/bootstrap.min.js"></script>  
 <script src="js/wow.min.js"></script>  
 <script src="js/Headroom.js"></script>  
 <script src="js/jquery.parallax-1.1.3.js"></script>  
 <script src="js/jquery.featureCarousel.js"></script>  
 <script src="js/jquery.bxslider.js"></script>  
 <script src="js/owl.carousel.js"></script>  
 <script src="js/jquery.counterup.js"></script>  
 <script src="js/main.js"></script>  

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<div id="footer">
    </div>
</body>
<script type="text/javascript">
	$.get("footer.html", function(data) {
		$("#footer").replaceWith(data);
	});
</script>
</html>