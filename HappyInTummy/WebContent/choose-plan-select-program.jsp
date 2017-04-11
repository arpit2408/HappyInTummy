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
<link href="css/hover.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>  
</head>

<script type="text/javascript">


function callBmiMenu() {
	
	if(document.getElementById("prefid").value>0) {
	
	dataString = "pref=" + document.getElementById("prefid").value+"&height=" + document.getElementById("height").value+"&weight=" + document.getElementById("weight").value+"&gender=" + sessionStorage.getItem("custgender")+"&DOB=" + sessionStorage.getItem("DOB"); 
	$.ajax({
	    url: 'bmi-menu',
	    type: 'POST',      
	    cache: false,
	    data :  dataString,
		dataType: "json",
	    success: function(data) {
	    	var htmlElementsBF='';
	    	var htmlElementsL='';
	    	var htmlElementsD='';
	    	var bkcount=-1;
	    	var lcount=-1;
	    	var dcount=-1;
	    	for (var i=0;i<data.length;++i)
	        {
	  		 
	  		 if(data[i].meal_Type=='Breakfast'){
	  			bkcount=bkcount+1;
	  			htmlElementsBF=htmlElementsBF+ ' <div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">'+ 
			  		'<div class="menu-item-wrap" style="width: 2000px">'+
			  		'<figure>'+
			  		'<a href="#">'+
			  		'<img class="img-responsive menubflunchDinner" src="images/'+ data[i].image +'" alt="Menu image"></a>'+
			  		'</figure>'+ 
			  		'<input type="hidden" id="bkitemid'+bkcount+'" value='+data[i].itemid+'>'+ 
			  		'<div class="mid">'+
			  		'<h4> <a href="#">'+data[i].itemname+'</a> </h4> <span>'+data[i].itemdesc+'</span>'+
		
			  		'<div class="facts-table">'+
			  		'<table><tbody><tr>'+
			  		'<td><span>Calories</span></td>'+
			  		'<td><span>'+data[i].calorie+'</span></td>'+
			  		'</tr><tr>'+
			  		'<td><span>Proteins</span></td>'+
			  		'<td><span>'+data[i].proteins+'g</span></td>'+
			  		'</tr><tr>'+
			  		'<td><span>Fats</span></td>'+
			  		'<td><span>'+data[i].fats+'g</span></td>'+
			  		'</tr><tr>'+
			  		'<td><span>Carbohydrates</span></td>'+
			  		'<td><span>'+data[i].carbohydrates+'g</span></td>'+
			  		'</tr>'+
			  		'</tbody>'+
			  		'</table>'+
			  		'</div>'+
			  		'</div></div> </div>';
	  		 }
	  		 if(data[i].meal_Type=='Lunch'){
	  			lcount=lcount+1;
	  			htmlElementsL=htmlElementsL+'<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">'+ 
			  		'<div class="menu-item-wrap" style="width: 2000px">'+
			  		'<figure>'+
			  		'<a href="#">'+
			  		'<img class="img-responsive menubflunchDinner" src="images/'+ data[i].image +'" alt="Menu image"></a>'+
			  		'</figure>'+
			  		'<input type="hidden" id="litemid'+lcount+'" value='+data[i].itemid+'>'+ 
			  		'<div class="mid">'+
			  		'<h4> <a href="#">'+data[i].itemname+'</a> </h4> <span>'+data[i].itemdesc+'</span>'+
		
			  		'<div class="facts-table">'+
			  		'<table><tbody><tr>'+
			  		'<td><span>Calories</span></td>'+
			  		'<td><span>'+data[i].calorie+'</span></td>'+
			  		'</tr><tr>'+
			  		'<td><span>Proteins</span></td>'+
			  		'<td><span>'+data[i].proteins+'g</span></td>'+
			  		'</tr><tr>'+
			  		'<td><span>Fats</span></td>'+
			  		'<td><span>'+data[i].fats+'g</span></td>'+
			  		'</tr><tr>'+
			  		'<td><span>Carbohydrates</span></td>'+
			  		'<td><span>'+data[i].carbohydrates+'g</span></td>'+
			  		'</tr>'+
			  		'</tbody>'+
			  		'</table>'+
			  		'</div>'+
			  		'</div></div> </div>';
	  		 }
	  		 if(data[i].meal_Type=='Dinner'){
	  				dcount=dcount+1;
		  			htmlElementsD=htmlElementsD+'<div class="col-xs-12 col-sm-12 menu-item wow fadeInLeft">'+ 
				  		'<div class="menu-item-wrap" style="width: 2000px">'+
				  		'<figure>'+
				  		'<a href="#">'+
				  		'<img class="img-responsive menubflunchDinner" src="images/'+ data[i].image +'" alt="Menu image"></a>'+
				  		'</figure>'+ 
				  		'<input type="hidden" id="ditemid'+dcount+'" value='+data[i].itemid+'>'+ 
				  		'<div class="mid">'+
				  		'<h4> <a href="#">'+data[i].itemname+'</a> </h4> <span>'+data[i].itemdesc+'</span>'+
			
				  		'<div class="facts-table">'+
				  		'<table><tbody><tr>'+
				  		'<td><span>Calories</span></td>'+
				  		'<td><span>'+data[i].calorie+'</span></td>'+
				  		'</tr><tr>'+
				  		'<td><span>Proteins</span></td>'+
				  		'<td><span>'+data[i].proteins+'g</span></td>'+
				  		'</tr><tr>'+
				  		'<td><span>Fats</span></td>'+
				  		'<td><span>'+data[i].fats+'g</span></td>'+
				  		'</tr><tr>'+
				  		'<td><span>Carbohydrates</span></td>'+
				  		'<td><span>'+data[i].carbohydrates+'g</span></td>'+
				  		'</tr>'+
				  		'</tbody>'+
				  		'</table>'+
				  		'</div>'+
				  		'</div></div> </div>';
		  		 }
	        }
	   	 		
	    	   
		     	if (document.getElementById("prefid").value == 1) 
		    	{
     		 	var containerBF = document.getElementById("breakfastvitems");
	    		containerBF.innerHTML = htmlElementsBF;
		     	 
		     	var containerLunch = document.getElementById("lunchvitems");
		     	containerLunch.innerHTML = htmlElementsL;
		     	 
		     	var containerDinner = document.getElementById("dinnervitems");
		     	containerDinner.innerHTML = htmlElementsD;	
		    	document.getElementById("vegan").style.display = "block";
		    	document.getElementById("non-veg").style.display = "none";
		    	document.getElementById("glutenfree").style.display = "none";
		    	}
		    	else if (document.getElementById("prefid").value == 2) {
	    		var containerBF = document.getElementById("breakfastnvitems");
	    		containerBF.innerHTML = htmlElementsBF;
		     	 
		     	var containerLunch = document.getElementById("lunchnvitems");
		     	containerLunch.innerHTML = htmlElementsL;
		     	 
		     	var containerDinner = document.getElementById("dinnernvitems");
		     	containerDinner.innerHTML = htmlElementsD;	
		    	document.getElementById("non-veg").style.display = "block";
		    	document.getElementById("vegan").style.display = "none";
		    	document.getElementById("glutenfree").style.display = "none";
		    	}
		    	else if (document.getElementById("prefid").value == 3) {
	    		var containerBF = document.getElementById("breakfastitems");
	    		containerBF.innerHTML = htmlElementsBF;
		     	 
		     	var containerLunch = document.getElementById("lunchitems");
		     	containerLunch.innerHTML = htmlElementsL;
		     	 
		     	var containerDinner = document.getElementById("dinneritems");
		     	containerDinner.innerHTML = htmlElementsD;	
		    	document.getElementById("non-veg").style.display = "none";
		    	document.getElementById("vegan").style.display = "none";
		    	document.getElementById("glutenfree").style.display = "block";
		    	
		    	} 
		     
	    } 

 	});
	}
	
}
function submitform()
{
	 //HTML5 session storage
	 var bkitems=new Array();
	 var litems=new Array();
	 var ditems=new Array();
	 //$("#SelectProgram").attr("href", "/HappyInTummy/choose-plan-select-program.jsp");
	
	 sessionStorage.setItem('Height', document.getElementById("height").value);
	 sessionStorage.setItem('Weight', document.getElementById("weight").value);
	 sessionStorage.setItem('Preference', document.getElementById("prefid").value);
	 sessionStorage.setItem('PreferenceText',(document.getElementById("prefid").options[prefid.selectedIndex].text));
	 for (var i=0;i<7;++i)
     {
		 //alert('in for loop bk.... '+i+'"bkitemid'+i+'"');
		 //alert('in for loop bkm..............'+document.getElementById('bkitemid'+i).value);
		 if(document.getElementById('bkitemid'+i)!=null && document.getElementById('bkitemid'+i)!='undefined' && document.getElementById('bkitemid'+i)!='')
		 
		 {
			 bkitems[i]=document.getElementById('bkitemid'+i).value;
			 //alert(" set "+bkitems[i]);
		 }
		
		 if(document.getElementById('litemid'+i)!=null && document.getElementById('litemid'+i)!='undefined' && document.getElementById('litemid'+i)!='')
			 
		 {
			 litems[i]=document.getElementById('litemid'+i).value;
			
		 }
		
		 if(document.getElementById('ditemid'+i)!=null && document.getElementById('ditemid'+i)!='undefined' && document.getElementById('ditemid'+i)!='')
			 
		 {
			 ditems[i]=document.getElementById('ditemid'+i).value;
			
		 }
		
     }
	 
	 sessionStorage.setItem('bkitems',JSON.stringify(bkitems));
	 sessionStorage.setItem('litems',JSON.stringify(litems));
	 sessionStorage.setItem('ditems',JSON.stringify(ditems));
	
	 document.chooseprogram.submit();
	 var baseuri = $("html").data("baseuri");
	 $("#ChoosePlan").attr("href", baseuri+"ChooseYourPlan.jsp");
	 document.chooseprogram.submit();
}

</script>

</head>
<body onload="setCorrectActionAfterSubmit('About')" class="home-page home-version1-page">
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
						<label  style="font-size: 1.8em;font-family: 'Raleway', Serif !important;" class="col-sm-4"> Want personalized suggestion?</label>
						<input id="weight" type="number" class="col-sm-2" placeholder="Enter your weight(kgs)" style="padding-left: 10px;" onchange="callBmiMenu();"></input>
						<div style="width:2mm;"></div>
						<input id="height" type="number" class="col-sm-2"  style="padding-left: 10px;" placeholder="Enter your height(cms)" onchange="callBmiMenu();"></input>
						
					</div>
	
		<!-- main wrapper of the site starts -->
	<div class="wrapper">
	<!-- ============== Sample menu banner starts ============== -->

					<div class="text-center wow flipInX animated menuSelectOptions "
					style="visibility: visible; animation-name: flipInX; padding-bottom:15px;" >
						<select id="prefid" class="select-program " onchange="callBmiMenu();" >
							<option value="" selected="selected">Select Program</option>
							<option value="1" >Vegan</option>
							<option value="2">Non-Vegeterian</option>
							<option value="3">Gluten-free</option>
						</select>
						
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
						<input type="submit" value="Take me to Plans" onClick="submitform();"/>
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