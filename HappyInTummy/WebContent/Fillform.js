

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
    var baseuri = $("html").data("baseuri");
    
    if(e.id=="About"){
        $("#About").attr("href", baseuri+"/choose-plan-about-us.jsp");
        $("#step1").attr("class", "wow fadeInUp step1 current");
        $("#SelectProgram").attr("href", "#");
        $("#ChoosePlan").attr("href", "#");
        $("#Checkout").attr("href", "#");
    }
    if(e.id=="SelectProgram"){
        //$("#About").attr("href", "/HappyInTummy/choose-plan-about-us.html");
        //$("#SelectProgram").attr("href", "#");
    	
        if(sessionStorage.getItem("Email")==null)
        {
	        $("#SelectProgram").attr("href", "#");	
	        $("#ChoosePlan").attr("href", "#");
	        $("#Checkout").attr("href", "#");
	        	
        }
        else
        {
        	$("#step2").attr("class", "wow fadeInUp step2 current");
            $("#ChoosePlan").attr("href", "#");
            $("#Checkout").attr("href", "#");
            
        }
        
    }
    if(e.id=="ChoosePlan"){
        //$("#About").attr("href", "/HappyInTummy/choose-plan-about-us.html");
        //$("#SelectProgram").attr("href", "/HappyInTummy/choose-plan-select-program.jsp");
        //$("#ChoosePlan").attr("href", "#");
    	
    	
    	if(sessionStorage.getItem("Preference")==null)
        {
	       
	        $("#ChoosePlan").attr("href", "#");
	        $("#Checkout").attr("href", "#");
	        	
        }
        else
        {
        	$("#step3").attr("class", "wow fadeInUp step3 current");
            $("#Checkout").attr("href", "#");
            
        }
    	 
    }
    if(e.id=="Checkout"){
    	$("#step4").attr("class", "wow fadeInUp step4 current");
        //$("#About").attr("href", "/HappyInTummy/choose-plan-about-us.html");
        //$("#SelectProgram").attr("href", "/HappyInTummy/choose-plan-select-program.jsp");
        //$("#ChoosePlan").attr("href", "/HappyInTummy/ChooseYourPlan.html");
        //$("#Checkout").attr("href", "#");
    }
}
function setCorrectActionAfterSubmit(e){
    var baseuri = $("html").data("baseuri");
    //alert("hello"+baseuri);
    if(e=="About"){
        $("#About").attr("href", baseuri+"/choose-plan-about-us.jsp");
        $("#SelectProgram").attr("href", baseuri+"/choose-plan-select-program.jsp");
        $("#step2").attr("class", "wow fadeInUp step2 current");
    }
    if(e=="SelectProgram"){
        $("#About").attr("href", baseuri+"/choose-plan-about-us.jsp");
        $("#SelectProgram").attr("href", baseuri+"/choose-plan-select-program.jsp");
        $("#ChoosePlan").attr("href", baseuri+"/ChooseYourPlan.jsp");
        $("#step3").attr("class", "wow fadeInUp step3 current");
    }
    if(e=="ChoosePlan"){
        $("#About").attr("href", baseuri+"/choose-plan-about-us.jsp");
        $("#SelectProgram").attr("href", baseuri+"/choose-plan-select-program.jsp");
        $("#ChoosePlan").attr("href", baseuri+"/ChooseYourPlan.jsp");
        $("#Checkout").attr("href", baseuri+"/choose-plan-checkout.jsp");
        $("#step4").attr("class", "wow fadeInUp step4 current");
    }
}


function datatoShow()
{
	var totalpayment=parseInt(sessionStorage.getItem('PlanIdCost')) * parseInt(sessionStorage.getItem('PlanIdText'));

	var discounted=totalpayment-parseInt(((parseInt(sessionStorage.getItem('Discount')))/100)*totalpayment);
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
		document.getElementById('Plan').innerHTML = sessionStorage.getItem('PlanIdText') + ' Week Plan ($'+ sessionStorage.getItem('PlanIdCost') + ' per day) <br> Payment due after discount: $'+discounted;

}
function placeOrder()
{
	if($('#Paypal').is(':checked')==false && $('#Bank').is(':checked')==false)
	{
			alert("Please Select Payment Method");
			return false;
	}
	
	var payment=$('#Paypal').is(':checked')?"Paypal":"Bank";
	sessionStorage.setItem("Payment",payment);
	var dataString = "pref=" + sessionStorage.getItem("Preference")+"&height=" + sessionStorage.getItem('Height')+"&weight=" + sessionStorage.getItem('Weight')+"&gender=" + 
	sessionStorage.getItem("Gender")+"&DOB=" + sessionStorage.getItem("DOB")+"&Name=" + sessionStorage.getItem("Name")+"&Email=" + sessionStorage.getItem("Email")+
	"&Phone=" + sessionStorage.getItem("Phone")+"&Zip=" + sessionStorage.getItem("Zip")+"&Address=" + sessionStorage.getItem("Address")+"&State=" + sessionStorage.getItem("State")+"&City=" + sessionStorage.getItem("City")+
	"&bkitems=" + sessionStorage.getItem("bkitems")+"&litems=" + sessionStorage.getItem("litems")+"&ditems=" + sessionStorage.getItem("ditems")+"&PlanId=" + sessionStorage.getItem("PlanId")+"&Payment=" + sessionStorage.getItem("Payment");
	
	$.ajax({
		    url: 'checkout',
		    type: 'POST',      
		    cache: false,
		    data :  dataString,
			dataType: "json",

			crossDomain:true,
		    success: function(data) {	

				 var containerMsg = document.getElementById("successMsg");
				 containerMsg.innerHTML = '<h4 style="text-align:center"><strong> Wow! You just made a Yummy Choice. Your Order ID is '+data.result+'. </strong> </h4>';
				 var btn=document.getElementById("place"); 
				 btn.style.display = "none";
				 sessionStorage.clear();
		    },
		    error: function(status,error) {	
		    
		    	 var containerMsg = document.getElementById("successMsg");
				 containerMsg.innerHTML = '<h4 style="text-align:center"> Sorry! Our basket is full, please try after some time.</h4>';
				 var btn=document.getElementById("place"); 
				 btn.style.display = "none";
				 sessionStorage.clear();
			}
	
	 });
	
}
function reloadPref()
{
	if(sessionStorage.getItem('Preference')!=null)
		document.getElementById('prefid').value = sessionStorage.getItem('Preference');
	if(sessionStorage.getItem('Weight')!=null)
		document.getElementById('weight').value = sessionStorage.getItem('Weight');
	if(sessionStorage.getItem('Height')!=null)
		document.getElementById('height').value = sessionStorage.getItem('Height');
}