function datatoShow()
{
	if(sessionStorage.getItem('Name')!=null)
		document.getElementById('Name').innerHTML = sessionStorage.getItem('Name');
	if(document.getElementById('Gender')!=null)
		document.getElementById('Gender').innerHTML = sessionStorage.getItem('Gender');
	if(sessionStorage.getItem('Email')!=null)
		document.getElementById('Email').innerHTML = sessionStorage.getItem('Email');
	if(sessionStorage.getItem('Address')!=null)
		document.getElementById('Address').innerHTML = sessionStorage.getItem('Address');
	if(sessionStorage.getItem('Zip')!=null)
		document.getElementById('Zip').innerHTML = sessionStorage.getItem('Zip');
	if(sessionStorage.getItem('Phone')!=null)
		document.getElementById('Phone').innerHTML = sessionStorage.getItem('Phone');
	if(sessionStorage.getItem('DOB')!=null)
		document.getElementById('DOB').innerHTML =sessionStorage.getItem('DOB');
	if(document.getElementById('Program')!=null)
		document.getElementById('Program').innerHTML = sessionStorage.getItem('PreferenceText');
	if(document.getElementById('Plan')!=null )
		document.getElementById('Plan').innerHTML = sessionStorage.getItem('PlanIdText') + ' Week Plan at a cost of $'+ sessionStorage.getItem('PlanIdCost') + ' per day' ;

}
function reloadFormAboutYou()
{
	if(sessionStorage.getItem('Name')!=null)
		document.getElementById('Name').value = sessionStorage.getItem('Name');
	if(document.getElementById("Male")!=null && document.getElementById("Female")!=null){
		if(sessionStorage.getItem('Gender')=='Male'){
			radiobtn = document.getElementById("Male");
			radiobtn.checked = true;
		}
		else if(sessionStorage.getItem('Gender')=='Female'){
			radiobtn = document.getElementById("Female");
			radiobtn.checked = true;
		}
	}
	if(sessionStorage.getItem('Email')!=null)
		document.getElementById('Email').value = sessionStorage.getItem('Email');
	if(sessionStorage.getItem('Address')!=null)
		document.getElementById('Address').value = sessionStorage.getItem('Address');
	if(sessionStorage.getItem('City')!=null)
		document.getElementById('City').value = sessionStorage.getItem('City');
	if(sessionStorage.getItem('State')!=null)
		document.getElementById('State').value = sessionStorage.getItem('State');
	if(document.getElementById('Zip')!=null)
		document.getElementById('Zip').value = sessionStorage.getItem('Zip');
	if(document.getElementById('Phone')!=null)
		document.getElementById('Phone').value = sessionStorage.getItem('Phone');
	if(document.getElementById('DOB')!=null)
		document.getElementById('DOB').value =sessionStorage.getItem('DOB');
}
function setCorrectAction(e){
	if(e.id=="About"){
		$("#About").attr("href", "/choose-plan-about-us.html");
		$("#SelectProgram").attr("href", "#");
		$("#ChoosePlan").attr("href", "#");
		$("#Checkout").attr("href", "#");
	}
	if(e.id=="SelectProgram"){
		//$("#About").attr("href", "/HappyInTummy/choose-plan-about-us.html");
		//$("#SelectProgram").attr("href", "#");
		$("#ChoosePlan").attr("href", "#");
		$("#Checkout").attr("href", "#");
	}
	if(e.id=="ChoosePlan"){
		//$("#About").attr("href", "/HappyInTummy/choose-plan-about-us.html");
		//$("#SelectProgram").attr("href", "/HappyInTummy/choose-plan-select-program.jsp");
		//$("#ChoosePlan").attr("href", "#");
		$("#Checkout").attr("href", "#");
	}
	if(e.id=="Checkout"){
		//$("#About").attr("href", "/HappyInTummy/choose-plan-about-us.html");
		//$("#SelectProgram").attr("href", "/HappyInTummy/choose-plan-select-program.jsp");
		//$("#ChoosePlan").attr("href", "/HappyInTummy/ChooseYourPlan.html");
		//$("#Checkout").attr("href", "#");
	}
}
function setCorrectActionAfterSubmit(e){
	if(e=="About"){
		$("#About").attr("href", "/choose-plan-about-us.html");
		$("#SelectProgram").attr("href", "/choose-plan-select-program.jsp");
	}
	if(e=="SelectProgram"){
		$("#About").attr("href", "/choose-plan-about-us.html");
		$("#SelectProgram").attr("href", "/choose-plan-select-program.jsp");
		$("#ChoosePlan").attr("href", "/ChooseYourPlan.html");
	}
	if(e=="ChoosePlan"){
		$("#About").attr("href", "/choose-plan-about-us.html");
		$("#SelectProgram").attr("href", "/choose-plan-select-program.jsp");
		$("#ChoosePlan").attr("href", "/ChooseYourPlan.html");
		$("#Checkout").attr("href", "/choose-plan-checkout.html");
	}
}

