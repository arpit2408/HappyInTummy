<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" data-baseuri="${pageContext.request.contextPath}/">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	
	<ul class="text-center steps">
			<li class="wow fadeInUp step1 current">
	
			<a	id="About" href="#" onclick="setCorrectAction(this);"><span>1</span>
					About You</a></li>
			<li  class="wow fadeInUp step2">
			<a  id="SelectProgram" href="#" onclick="setCorrectAction(this);"><span>2</span>
					Select Program</a></li>
			<li  class="wow fadeInUp step3 ">
			<a  id="ChoosePlan" href="#" onclick="setCorrectAction(this);"><span>3</span>
					Your plan</a></li>
			<li  class="wow fadeInUp step4 ">
			<a  id="Checkout" href="#" onclick="setCorrectAction(this);"><span>4</span>
					Checkout</a></li>
	</ul>
	
		
	</div>

</body>
</html>