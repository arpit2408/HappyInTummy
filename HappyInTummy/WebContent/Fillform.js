
//Validation Code added by Neetika Mittal
var flagforvalidforName = false;
var flagforvalidforEmail = false;

var flagforvalidforPhone = false;
var flagforvalidforAddr = false;

var flagforvalidforState = false;
var flagforvalidforCity = false;
var flagforvalidforZip = false;

var flagforvalidforGender = false;
var flagforvalidforDOB = false;

//Method to handle flow among 4 steps added by Arpit Saxen
function reloadFormAboutYou()
{		
	if(sessionStorage.getItem('Name')!=null){
		
		if($('#desktopView').css('display') == 'block'){
		document.getElementById('Name').value = sessionStorage.getItem('Name');
		}
		else if($('#mobileView').css('display') == 'block')
		{
			document.getElementById('Namem').value = sessionStorage.getItem('Name');
		}
	}
	if($('#desktopView').css('display') == 'block'){
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
	}
	if($('#mobileView').css('display') == 'block'){
		if(document.getElementById("Malem")!=null && document.getElementById("Femalem")!=null){
			if(sessionStorage.getItem('Gender')=='Male'){
				radiobtn = document.getElementById("Malem");
				radiobtn.checked = true;
			}
			else if(sessionStorage.getItem('Gender')=='Female'){
				radiobtn = document.getElementById("Femalem");
				radiobtn.checked = true;
			}
		}
		}
	if($('#desktopView').css('display') == 'block'){
		if(sessionStorage.getItem('Email')!=null)
			document.getElementById('Email').value = sessionStorage.getItem('Email');
	}
	if($('#mobileView').css('display') == 'block'){
		if(sessionStorage.getItem('Email')!=null)
			document.getElementById('Emailm').value = sessionStorage.getItem('Email');
	}
	if($('#desktopView').css('display') == 'block'){
		if(sessionStorage.getItem('Address')!=null)
		document.getElementById('Address').value = sessionStorage.getItem('Address');
	}
	if($('#mobileView').css('display') == 'block'){
		if(sessionStorage.getItem('Address')!=null)
			document.getElementById('Addressm').value = sessionStorage.getItem('Address');
	}
	if($('#desktopView').css('display') == 'block'){
		if(sessionStorage.getItem('City')!=null)
		document.getElementById('City').value = sessionStorage.getItem('City');
	}
	if($('#mobileView').css('display') == 'block'){
		if(sessionStorage.getItem('City')!=null)
		document.getElementById('Citym').value = sessionStorage.getItem('City');
	}
	if($('#desktopView').css('display') == 'block'){
		if(sessionStorage.getItem('State')!=null)
		document.getElementById('State').value = sessionStorage.getItem('State');
	}
	if($('#mobileView').css('display') == 'block'){
		if(sessionStorage.getItem('State')!=null)
		document.getElementById('Statem').value = sessionStorage.getItem('State');
	}
	if($('#desktopView').css('display') == 'block'){
		if(sessionStorage.getItem('Zip')!=null)
		document.getElementById('Zip').value = sessionStorage.getItem('Zip');
	}
	if($('#mobileView').css('display') == 'block'){
		if(sessionStorage.getItem('Zip')!=null)
		document.getElementById('Zipm').value = sessionStorage.getItem('Zip');
	}
	if($('#desktopView').css('display') == 'block'){
	if(sessionStorage.getItem('Phone')!=null)
		document.getElementById('Phone').value = sessionStorage.getItem('Phone');
	}
	if($('#mobileView').css('display') == 'block'){
		if(sessionStorage.getItem('Phone')!=null)
			document.getElementById('Phonem').value = sessionStorage.getItem('Phone');
		}
	if($('#desktopView').css('display') == 'block'){
	if(sessionStorage.getItem('DOB')!=null)
	
		document.getElementById('date').value =sessionStorage.getItem('DOB');
	}
	if($('#mobileView').css('display') == 'block'){
		if(sessionStorage.getItem('DOB')!=null)
			document.getElementById('datem').value =reformat(sessionStorage.getItem('DOB'));
		}
}




//Method to handle flow among 4 steps added by Arpit Saxena
function setCorrectActionAfterSubmit(e){
    //var baseuri = $("html").data("baseuri");
    var baseuri=document.getElementById('pagecontext').value;
    	
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

//Method to set data on last page added by Neetika
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

//Method to set preference from session on step 2 added by Neetika
function reloadPref()
{
	if(sessionStorage.getItem('Preference')!=null)
		document.getElementById('prefid').value = sessionStorage.getItem('Preference');
	if(sessionStorage.getItem('Weight')!=null)
		document.getElementById('weight').value = sessionStorage.getItem('Weight');
	if(sessionStorage.getItem('Height')!=null)
		document.getElementById('height').value = sessionStorage.getItem('Height');
}
//Methods added by Neetika for Validations on About you page

function validateSpecialChars(inputtxt)
{
		  var str = document.getElementById(inputtxt).value;
		  var regex = /^[a-zA-Z ]*$/;
		 	 if(inputtxt=='Address' || inputtxt=='Addressm')
			  {
		 		
			  	  regex= /^[a-zA-Z0-9,.!? ]*$/;
			  		
			  }
		  
		
		  if (regex.test(str)) {
		   
		    return true;
		 
		  } else {
			
			return false;
		  }
}
function isValidEmailAddress(emailAddress) 
{
		 var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
		 return pattern.test(emailAddress);
}

function validatePhone(inputtxt)
{
		var phoneno = /^\d{10}$/;
		if(document.getElementById(inputtxt).value.match(phoneno))
		      {
		    		return true;
		      }
		    else
		      {
		     		return false;
		      }
}

function validateZip(ziptxt) 
{
			var zip=document.getElementById(ziptxt).value;
			var isValidZip =/^\s*\d{5}\s*$/.test(zip);
			
			return isValidZip;
}

function validatefieldsMobile()
{
		 	var maleSelected=$('#Malem').is(':checked')?"Male":"NONE";
			
			var femaleSelected=$('#Femalem').is(':checked')?"Female":"NONE";
		
			if(maleSelected=="NONE" && femaleSelected=="NONE")
			{
				 
		         $('#gendererrorm').text("Select gender");
		         flagforvalidforGender = false;
			}
			else
			{
				$('#gendererrorm').text("");
				flagforvalidforGender = true;
			}
			
			
			
			if (document.forms.aboutyou.datem.value == null || document.forms.aboutyou.datem.value == "") {
	           
	            $('#txtdoberrorm').text("Select Date of Birth");
	            flagforvalidforDOB = false;
	    
	        }
	        
			else {
	           if(isNotFutureDate(format(document.forms.aboutyou.datem.value))==true)
	        	   {
			            $('#txtdoberrorm').text("");
			            flagforvalidforDOB = true;
	        	   }
	           else
	        	   {
	        	   	$('#txtdoberrorm').text("Select Valid Date of Birth");
	        	   	flagforvalidforDOB = false;
	        	   }

	        }

			
	        if (document.getElementById('Namem').value.length < 2) {
	          
	            $('#nameerrorm').text("Enter a valid name");
	            flagforvalidforName = false;
	            
	            
	        }
	        
	        else if (document.getElementById('Namem').value.length >100) {
	           
	            $('#nameerrorm').text("Limit name to 100 characters");
	            flagforvalidforName = false;
	           
	        }
	        
	        else {
	        	if (validateSpecialChars('Namem')) {
	           
	            $('#nameerrorm').text("");
	            flagforvalidforName = true;
	           
	           
	        	}
	        	else
	        	{
	        		
	 	            $('#nameerrorm').text("Enter a valid name");
	 	            flagforvalidforName = false;
	        	}
	        }

	
	        if (document.getElementById('Emailm') != null && !isValidEmailAddress(document.getElementById('Emailm').value)) {
	           
	            $('#emailerrorm').text("Enter a correct email address");
	            flagforvalidforEmail = false;
	           
	        }
	        else  if (document.getElementById('Emailm') != null && document.getElementById('Emailm').value.length >100) {
	          
	            $('#emailerrorm').text("Limit email address to 100 characters");
	            flagforvalidforEmail = false;
	           
	        }
	        else {
	            
	            $('#emailerrorm').text("");
	            flagforvalidforEmail = true;
	          
	           
	        }

	    	
	        if (document.getElementById('Phonem').value != "") {
	            if (validatePhone('Phonem')) {
	            	
	               
	                $('#txtPhoneerrorm').text("");
	                flagforvalidforPhone = true;
	              
	              
	               
	            }
	            else {
	            	
	               
	                $('#txtPhoneerrorm').text("Enter 10 digit telephone number");
	                flagforvalidforPhone = false;

	            
	            }
	        }
	
	        else{
	        	
         	$('#txtPhoneerrorm').text("Enter telephone number");
        	 	flagforvalidforPhone = false;
	        }
	   
	        if (document.getElementById('Addressm').value.length < 2) {
	           
	            $('#Addresserrorm').text("Enter a valid address");
	            flagforvalidforAddr = false;
	            
	        }
	        else if (document.getElementById('Addressm').value.length > 100) {
	           
	            $('#Addresserrorm').text("Limit address to 100 characters");
	            flagforvalidforAddr = false;
	            
	        }
	        else {
	        	if (validateSpecialChars('Addressm')) {
		           
		            $('#Addresserrorm').text("");
		         
		            flagforvalidforAddr = true;
	        	}
	        	else
	        	{
	        		
	 	            $('#Addresserrorm').text("Enter a valid address");
	 	           flagforvalidforAddr = false;
	        	}
	         
	        }

	        if (document.getElementById('Citym').value.length < 2) {
	            
	            $('#Cityerrorm').text("Enter a valid city Name");
	            
	            flagforvalidforCity = false;
	        }
	        else if(document.getElementById('Citym').value.length > 45) {
	          
	            $('#Cityerrorm').text("Limit city Name to 45 Characters");
	            flagforvalidforCity = false;
	            
	        }
	        else {	
	        	if (validateSpecialChars('Citym')) {
		          
		            $('#Cityerrorm').text("");
		        
		            flagforvalidforCity = true;
	        	}
	        	else	
	        	{
	        		
	 	            $('#Cityerrorm').text("Enter a valid city");
	 	            flagforvalidforCity = false;
	        	}  
	        }

	        if (document.getElementById('Statem').value.length < 2) {
	            
	            $('#Stateerrorm').text("Enter a valid state");
	           
	            flagforvalidforState = false;
	        }
	        else if(document.getElementById('Statem').value.length > 45) {
	            
	            $('#Stateerrorm').text("Limit state to 45 Characters");
	          
	            flagforvalidforState = false;
	        }
	        else {
	        	if (validateSpecialChars('Statem')) {
		         
		            $('#Stateerrorm').text("");
		           
		            flagforvalidforState = true;
	        	}
	        	else	
	        	{
	        	   
	 	           $('#Stateerrorm').text("Enter a valid state");
	 	           flagforvalidforState = false;
	        	}
	        }

	        if (document.getElementById('Zipm') != null && document.getElementById('Zipm').value.length < 5) {

		            
		            $('#zipCodeerrorm').text("Enter a valid zip of 5 digits");
		           
		            flagforvalidforZip= false;
	        	
	        }
	        else  if (document.getElementById('Zipm') != null && document.getElementById('Zipm').value.length > 5) {
	           
	            $('#zipCodeerrorm').text("Enter a valid zip of 5 digits");
	           
	            flagforvalidforZip= false;
	        }
	        else {
		        	if (validateZip('Zipm')) {
		           
		            $('#zipCodeerrorm').text("");
		            
		            flagforvalidforZip = true;
	        		}
		        	else{
		        	   
		 	           $('#zipCodeerrorm').text("Enter a valid zip of 5 digits");
		 	          flagforvalidforZip = false;
		        	}
	        }

}
function validatefields() 
{
	 		var maleSelected=$('#Male').is(':checked')?"Male":"NONE";
		
			var femaleSelected=$('#Female').is(':checked')?"Female":"NONE";
	
			if(maleSelected=="NONE" && femaleSelected=="NONE")
			{
				 
		         $('#gendererror').text("Select gender");
		         flagforvalidforGender = false;
			}
			else
			{
				$('#gendererror').text("");
				flagforvalidforGender = true;
			}
		
			
			if (document.forms.aboutyou.date.value == null || document.forms.aboutyou.date.value == "") {
	           
	            $('#txtdoberror').text("Select Date of Birth");
	            flagforvalidforDOB = false;
	    
	        }
	        
			else {
	           
	            $('#txtdoberror').text("");
	            flagforvalidforDOB = true;
  
	        }

			
	        if (document.getElementById('Name').value.length < 2) {
	          
	            $('#nameerror').text("Enter a valid name");
	            flagforvalidforName = false;
	            
	            
	        }
	        
	        else if (document.getElementById('Name').value.length >100) {
	           
	            $('#nameerror').text("Limit name to 100 characters");
	            flagforvalidforName = false;
	           
	        }
	        
	        else {
	        	if (validateSpecialChars('Name')) {
	           
	            $('#nameerror').text("");
	            flagforvalidforName = true;
	           
	           
	        	}
	        	else
	        	{
	        		
	 	            $('#nameerror').text("Enter a valid name");
	 	            flagforvalidforName = false;
	        	}
	        }

	
	        if (document.getElementById('Email') != null && !isValidEmailAddress(document.getElementById('Email').value)) {
	           
	            $('#emailerror').text("Enter a correct email address");
	            flagforvalidforEmail = false;
	           
	        }
	        else  if (document.getElementById('Email') != null && document.getElementById('Email').value.length >100) {
	          
	            $('#emailerror').text("Limit email address to 100 characters");
	            flagforvalidforEmail = false;
	           
	        }
	        else {
	            
	            $('#emailerror').text("");
	            flagforvalidforEmail = true;
	          
	           
	        }

	    	
	        if (document.getElementById('Phone').value != "") {
	            if (validatePhone('Phone')) {
	            	
	               
	                $('#txtPhoneerror').text("");
	                flagforvalidforPhone = true;
	              
	              
	               
	            }
	            else {
	            	
	               
	                $('#txtPhoneerror').text("Enter 10 digit telephone number");
	                flagforvalidforPhone = false;
 
	            
	            }
	        }
	
	        else{
	        	
            	$('#txtPhoneerror').text("Enter telephone number");
           	 	flagforvalidforPhone = false;
	        }
	   
	        if (document.getElementById('Address').value.length < 2) {
	           
	            $('#Addresserror').text("Enter a valid address");
	            flagforvalidforAddr = false;
	            
	        }
	        else if (document.getElementById('Address').value.length > 100) {
	           
	            $('#Addresserror').text("Limit address to 100 characters");
	            flagforvalidforAddr = false;
	            
	        }
	        else {
	        	if (validateSpecialChars('Address')) {
		           
		            $('#Addresserror').text("");
		         
		            flagforvalidforAddr = true;
	        	}
	        	else
	        	{
	        		
	 	            $('#Addresserror').text("Enter a valid address");
	 	           flagforvalidforAddr = false;
	        	}
	         
	        }

	        if (document.getElementById('City').value.length < 2) {
	            
	            $('#Cityerror').text("Enter a valid city Name");
	            
	            flagforvalidforCity = false;
	        }
	        else if(document.getElementById('City').value.length > 45) {
	          
	            $('#Cityerror').text("Limit city Name to 45 Characters");
	            flagforvalidforCity = false;
	            
	        }
	        else {	
	        	if (validateSpecialChars('City')) {
		          
		            $('#Cityerror').text("");
		        
		            flagforvalidforCity = true;
	        	}
	        	else	
	        	{
	        		
	 	            $('#Cityerror').text("Enter a valid city");
	 	            flagforvalidforCity = false;
	        	}  
	        }

	        if (document.getElementById('State').value.length < 2) {
	            
	            $('#Stateerror').text("Enter a valid state");
	           
	            flagforvalidforState = false;
	        }
	        else if(document.getElementById('State').value.length > 45) {
	            
	            $('#Stateerror').text("Limit state to 45 Characters");
	          
	            flagforvalidforState = false;
	        }
	        else {
	        	if (validateSpecialChars('State')) {
		         
		            $('#Stateerror').text("");
		           
		            flagforvalidforState = true;
	        	}
	        	else	
	        	{
	        	   
	 	           $('#Stateerror').text("Enter a valid state");
	 	           flagforvalidforState = false;
	        	}
	        }

	        if (document.getElementById('Zip') != null && document.getElementById('Zip').value.length < 5) {

		            
		            $('#zipCodeerror').text("Enter a valid zip of 5 digits");
		           
		            flagforvalidforZip= false;
	        	
	        }
	        else  if (document.getElementById('Zip') != null && document.getElementById('Zip').value.length > 5) {
	           
	            $('#zipCodeerror').text("Enter a valid zip of 5 digits");
	           
	            flagforvalidforZip= false;
	        }
	        else {
		        	if (validateZip('Zip')) {
		           
		            $('#zipCodeerror').text("");
		            
		            flagforvalidforZip = true;
	        		}
		        	else{
		        	   
		 	           $('#zipCodeerror').text("Enter a valid zip of 5 digits");
		 	          flagforvalidforZip = false;
		        	}
	        }

	    
}


function validatefieldsonblur() {
	if($('#desktopView').css('display') == 'block'){
	 		$('#Name').blur(function (e) {
	        if (document.getElementById('Name').value.length < 2) {
	          //  $('#Name').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#nameerror').text("Enter a valid name");
	            flagforvalidforName = false;
	           
	        }
	        
	        else if (document.getElementById('Name').value.length >100) {
	            //$('#Name').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#nameerror').text("Limit name to 100 characters");
	            flagforvalidforName = false;
	          
	        }
	        
	        else {
	        	if (validateSpecialChars('Name')) {
	            //$('#Name').closest('.input-group').removeClass('has-error').addClass('has-success');
	            $('#nameerror').text("");
	            flagforvalidforName = true;
	          
	        	}
		        
	        	else
	        	{
	        		//$('#Name').closest('.input-group').removeClass('success').addClass('has-error');
	 	            $('#nameerror').text("Enter a valid name");
	 	            flagforvalidforName = false;
	        	}
	        }
	    });
	 
	  $('#Email').blur(function (e) {
	        if (document.getElementById('Email') != null && !isValidEmailAddress(document.getElementById('Email').value)) {
	            //$('#Email').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#emailerror').text("Enter correct email address ");
	            flagforvalidforEmail = false;
	           
	        }
	        else  if (document.getElementById('Email') != null && document.getElementById('Email').value.length >100) {
	            //$('#Email').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#emailerror').text("Limit email address to 100 characters");
	            flagforvalidforEmail = false;
	            
	        }
	        else {
	           // $('#Email').closest('.input-group').removeClass('has-error').addClass('has-success');
	            $('#emailerror').text("");
	            flagforvalidforEmail = true;
	           
	           
	        }
	    });
	 
	    $('#Phone').blur(function (e) {
	    	
	        if (document.getElementById('Phone').value != "") {
	            if (validatePhone('Phone')) {
	            	
	              //  $('#Phone').closest('.input-group').removeClass('has-error').addClass('has-success');
	                $('#txtPhoneerror').text("");
	                flagforvalidforPhone = true;
	               
	              
	               
	            }
	            else {
	            	
	              //  $('#Phone').closest('.input-group').removeClass('success').addClass('has-error');
	                $('#txtPhoneerror').text("Enter 10 digit telephone number");
	                flagforvalidforPhone = false;
	                
	            
	            }
	        }
	        else{
	        	//$('#Phone').closest('.input-group').removeClass('success').addClass('has-error');
            	$('#txtPhoneerror').text("Enter telephone number");
           	 	flagforvalidforPhone = false;
	        }
	   
	    });
	    
	    
	    $('#Address').blur(function (e) {
	        if (document.getElementById('Address').value.length < 2) {
	           // $('#Address').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#Addresserror').text("Enter a valid address");
	            flagforvalidforAddr = false;
	            
	        }
	        else if (document.getElementById('Address').value.length > 100) {
	            //$('#Address').closest('.input-group').removeClass('success').addClass('has-error');
	            $('#Addresserror').text("Limit address to 100 characters");
	            flagforvalidforAddr = false;
	            
	        }
	        else {
	        	if (validateSpecialChars('Address')) {
	            //$('#Address').closest('.input-group').removeClass('has-error').addClass('has-success');
	            $('#Addresserror').text("");
	            
	            flagforvalidforAddr = true;
	        	}
	        	else
	        	{
	        		
	 	           $('#Addresserror').text("Enter a valid address");
	 	           flagforvalidforAddr = false;
	        	}
	        }
	    });
	    
	    
	    $('#City').blur(function (e) {
	        if (document.getElementById('City').value.length < 2) {
	            //$('#City').removeClass('success').addClass('has-error');
	            $('#Cityerror').text("Enter a valid city name");
	            
	            flagforvalidforCity = false;
	        }
	        else if(document.getElementById('City').value.length > 45) {
	            //$('#City').removeClass('success').addClass('has-error');
	            $('#Cityerror').text("Limit city to 45 Characters");
	            flagforvalidforCity = false;
	           
	        }
	        else {
	        	if (validateSpecialChars('City')) {
		            //$('#City').removeClass('has-error').addClass('has-success');
		            $('#Cityerror').text("");
		           
		            flagforvalidforCity = true;
	        	}
	        	else
	        	{
	        		
	 	           $('#Cityerror').text("Enter a valid City");
	 	          flagforvalidforCity = false;
	        	}
	        }
	    });
	    
	    
	    
	    $('#State').blur(function (e) {
	        if (document.getElementById('State').value.length < 2) {
	           // $('#State').removeClass('success').addClass('has-error');
	            $('#Stateerror').text("Enter a valid state");
	            
	            flagforvalidforState = false;
	        }
	        else if(document.getElementById('State').value.length > 45) {
	            //$('#State').removeClass('success').addClass('has-error');
	            $('#Stateerror').text("Limit state to 45 Characters");
	            
	            flagforvalidforState = false;
	        }
	        else {
	        	if (validateSpecialChars('State')) {
	            //$('#State').removeClass('has-error').addClass('has-success');
	            $('#Stateerror').text("");
	            
	            flagforvalidforState = true;
	        	}
	        	else
	        	{
	        		
	 	           $('#Stateerror').text("Enter a valid state");
	 	          flagforvalidforState = false;
	        	}
	        }
	    });
	    
	    $('#Zip').blur(function (e) {
	        if (document.getElementById('Zip') != null && document.getElementById('Zip').value.length < 5) {
	        	
	        
	           // $('#Zip').removeClass('success').addClass('has-error');
	            $('#zipCodeerror').text("Enter a valid zip of 5 digits");
	           
	            flagforvalidforZip= false;
	        	
	        }
	        else  if (document.getElementById('Zip') != null && document.getElementById('Zip').value.length > 5) {
	           // $('#Zip').removeClass('success').addClass('has-error');
	            $('#zipCodeerror').text("Enter a valid zip of 5 digits");
	          
	            flagforvalidforZip= false;
	        }
	        else {
	        	if (validateZip('Zip')) {
	           // $('#Zip').removeClass('has-error').addClass('has-success');
	            $('#zipCodeerror').text("");
	            
	            flagforvalidforZip = true;
	        	}
	        	else
	        	{
	        		
	 	          $('#zipCodeerror').text("Enter a valid zip of 5 digits");
	 	          flagforvalidforZip = false;
	        	}
	        }
	    });
	}
	if($('#mobileView').css('display') == 'block'){
 		$('#Namem').blur(function (e) {
        if (document.getElementById('Namem').value.length < 2) {
       
            $('#nameerrorm').text("Enter a valid name");
            flagforvalidforName = false;
           
        }
        
        else if (document.getElementById('Namem').value.length >100) {
          
            $('#nameerrorm').text("Limit name to 100 characters");
            flagforvalidforName = false;
          
        }
        
        else {
        	if (validateSpecialChars('Namem')) {
          
            $('#nameerrorm').text("");
            flagforvalidforName = true;
          
        	}
	        
        	else
        	{
        	
 	            $('#nameerrorm').text("Enter a valid name");
 	            flagforvalidforName = false;
        	}
        }
    });
 
  $('#Emailm').blur(function (e) {
        if (document.getElementById('Emailm') != null && !isValidEmailAddress(document.getElementById('Emailm').value)) {
          
            $('#emailerrorm').text("Enter correct email address ");
            flagforvalidforEmail = false;
           
        }
        else  if (document.getElementById('Emailm') != null && document.getElementById('Emailm').value.length >100) {
          
            $('#emailerrorm').text("Limit email address to 100 characters");
            flagforvalidforEmail = false;
            
        }
        else {
          
            $('#emailerrorm').text("");
            flagforvalidforEmail = true;
           
           
        }
    });
 
    $('#Phonem').blur(function (e) {
    	
        if (document.getElementById('Phonem').value != "") {
            if (validatePhone('Phonem')) {
            	
                $('#txtPhoneerrorm').text("");
                flagforvalidforPhone = true;
               
              
               
            }
            else {
            	
                $('#txtPhoneerrorm').text("Enter 10 digit telephone number");
                flagforvalidforPhone = false;
                
            
            }
        }
        else{
        	
        	$('#txtPhoneerrorm').text("Enter telephone number");
       	 	flagforvalidforPhone = false;
        }
   
    });
    
    
    $('#Addressm').blur(function (e) {
        if (document.getElementById('Addressm').value.length < 2) {
           
            $('#Addresserrorm').text("Enter a valid address");
            flagforvalidforAddr = false;
            
        }
        else if (document.getElementById('Addressm').value.length > 100) {
           
            $('#Addresserrorm').text("Limit address to 100 characters");
            flagforvalidforAddr = false;
            
        }
        else {
        	if (validateSpecialChars('Addressm')) {
           
            $('#Addresserrorm').text("");
            
            flagforvalidforAddr = true;
        	}
        	else
        	{
        		
 	           $('#Addresserrorm').text("Enter a valid address");
 	           flagforvalidforAddr = false;
        	}
        }
    });
    
    
    $('#Citym').blur(function (e) {
        if (document.getElementById('Citym').value.length < 2) {
            
            $('#Cityerrorm').text("Enter a valid city name");
            
            flagforvalidforCity = false;
        }
        else if(document.getElementById('Citym').value.length > 45) {
           
            $('#Cityerrorm').text("Limit city to 45 Characters");
            flagforvalidforCity = false;
           
        }
        else {
        	if (validateSpecialChars('Citym')) {
	        
	            $('#Cityerrorm').text("");
	           
	            flagforvalidforCity = true;
        	}
        	else
        	{
        		
 	           $('#Cityerrorm').text("Enter a valid City");
 	          flagforvalidforCity = false;
        	}
        }
    });
    
    
    
    $('#Statem').blur(function (e) {
        if (document.getElementById('Statem').value.length < 2) {
          
            $('#Stateerrorm').text("Enter a valid state");
            
            flagforvalidforState = false;
        }
        else if(document.getElementById('Statem').value.length > 45) {
          
            $('#Stateerrorm').text("Limit state to 45 Characters");
            
            flagforvalidforState = false;
        }
        else {
        	if (validateSpecialChars('Statem')) {
         
            $('#Stateerrorm').text("");
            
            flagforvalidforState = true;
        	}
        	else
        	{
        		
 	           $('#Stateerrorm').text("Enter a valid state");
 	          flagforvalidforState = false;
        	}
        }
    });
    
    $('#Zipm').blur(function (e) {
        if (document.getElementById('Zipm') != null && document.getElementById('Zipm').value.length < 5) {
        	
            $('#zipCodeerrorm').text("Enter a valid zip of 5 digits");
           
            flagforvalidforZip= false;
        	
        }
        else  if (document.getElementById('Zipm') != null && document.getElementById('Zipm').value.length > 5) {
         
            $('#zipCodeerrorm').text("Enter a valid zip of 5 digits");
          
            flagforvalidforZip= false;
        }
        else {
        	if (validateZip('Zipm')) {
          
            $('#zipCodeerrorm').text("");
            
            flagforvalidforZip = true;
        	}
        	else
        	{
        		
 	          $('#zipCodeerrorm').text("Enter a valid zip of 5 digits");
 	          flagforvalidforZip = false;
        	}
        }
    });
}
    
}



function submitform()
{
	 validatefields();
	
	 if (flagforvalidforName &&  flagforvalidforPhone &&  
			 flagforvalidforEmail &&  flagforvalidforAddr &&  flagforvalidforCity  && flagforvalidforState &&  
			 flagforvalidforZip && flagforvalidforDOB && flagforvalidforGender)
	 {
		
		 sessionStorage.setItem('Name', document.forms.aboutyou.Name.value);
		 sessionStorage.setItem('Email', document.forms.aboutyou.Email.value);
		 var gender=$('#Male').is(':checked')?"Male":"Female";
		 
		 sessionStorage.setItem('DOB', document.forms.aboutyou.date.value);
		 sessionStorage.setItem('Gender',gender);
		 sessionStorage.setItem('Phone', document.forms.aboutyou.Phone.value);
		 sessionStorage.setItem('Zip', document.forms.aboutyou.Zip.value);
		 sessionStorage.setItem('City', document.forms.aboutyou.City.value);
		 sessionStorage.setItem('State', document.forms.aboutyou.State.value);
		 sessionStorage.setItem('Address', document.forms.aboutyou.Address.value);
		 document.forms.aboutyou.submit();
	 }
	 
	 else
	 {
		       return false; 	
	 }
	
}
function format(inputDate) {
    var date = new Date(inputDate);
    if (!isNaN(date.getTime())) {
    	var d=parseInt(date.getDate())+1;
        // Months use 0 index.
        return date.getMonth() + 1 + '/' + d+ '/' + date.getFullYear();
    }
}
// mm/dd/yyyy to yyyy-mm-dd 
function reformat(inputDate) {
		
		var yourdate = inputDate.split("/");
		var tmp=[];
		tmp[0] = yourdate[2];
		
		tmp[1] = yourdate[0]; //month
		if(yourdate[0]<10)
		{
			tmp[1]="0"+yourdate[0];
		}
		tmp[2] = yourdate[1];
		if(yourdate[1]<10)
		{
			tmp[2]="0"+yourdate[1];
		}
		yourdate = tmp.join("-");
		
		return yourdate;
}
function isNotFutureDate(idate){
    var today = new Date().getTime();
        idate = idate.split("/");
  
    idate = new Date(idate[2], idate[0]-1,idate[1]).getTime();
    return (today - idate) < 0 ? false : true;
}
function  submitformForMobile()
{
	 validatefieldsMobile();
	
	 if (flagforvalidforName &&  flagforvalidforPhone &&  
			 flagforvalidforEmail &&  flagforvalidforAddr &&  flagforvalidforCity  && flagforvalidforState &&  
			 flagforvalidforZip && flagforvalidforDOB && flagforvalidforGender)
	 {
		
		 sessionStorage.setItem('Name', document.forms.aboutyou.Namem.value);
		 sessionStorage.setItem('Email', document.forms.aboutyou.Emailm.value);
		 var gender=$('#Malem').is(':checked')?"Male":"Female";
		 
		 sessionStorage.setItem('DOB', format(document.forms.aboutyou.datem.value));
		 sessionStorage.setItem('Gender',gender);
		 sessionStorage.setItem('Phone', document.forms.aboutyou.Phonem.value);
		 sessionStorage.setItem('Zip', document.forms.aboutyou.Zipm.value);
		 sessionStorage.setItem('City', document.forms.aboutyou.Citym.value);
		 sessionStorage.setItem('State', document.forms.aboutyou.Statem.value);
		 sessionStorage.setItem('Address', document.forms.aboutyou.Addressm.value);
		 document.forms.aboutyou.submit();
	 }
	 
	 else
	 {
		       return false; 	
	 }
	
}



// Methods for select Program JSP added by Neetika
var flagforvalidforHeight=true;
var flagforvalidforWeight=true;
var flagforvalidforPref=true;
function validatefieldsJS()
{
	 if (document.getElementById("height") != null && document.getElementById("height").value < 0) {
     	
         $('#heighterror').text("Enter valid height");
        
         flagforvalidforHeight= false;
     	
     }
	 else
	 {	
		 $('#heighterror').text("");
		 flagforvalidforHeight= true;
	 }
      if (document.getElementById('weight') != null && document.getElementById('weight').value <0) {
      
         $('#weighterror').text("Enter valid weight");
       
         flagforvalidforWeight= false;
     }
      else
 	 {	
    	  $('#weighterror').text("");
    	  flagforvalidforWeight= true;
 	 }
      
      if (document.getElementById('prefid') == null || (document.getElementById('prefid').value =="")) {
          
          $('#preferror').text("Select Preference!");
        
          flagforvalidforPref= false;
      }
      else
  	 {	
    	  $('#preferror').text("");
    	   flagforvalidforPref= true;
  	 }
	
}

function validateOnblurSelectProgram()
{
	  $('#height').blur(function (e) { 
		if (document.getElementById("height") != null && document.getElementById("height").value < 0) {
	     	
	         $('#heighterror').text("Enter valid height");
	        
	         flagforvalidforHeight= false;
	     	
	     }
		 else
		 {	
			 $('#heighterror').text("");
			 flagforvalidforHeight= true;
		 }
	  });
	  $('#weight').blur(function (e) { 
	      if (document.getElementById('weight') != null && document.getElementById('weight').value <0) {
	      
	         $('#weighterror').text("Enter valid weight");
	       
	         flagforvalidforWeight= false;
	     }
	      else
	 	 {	
	    	  $('#weighterror').text("");
	    	  flagforvalidforWeight= true;
	 	 }
	  });
	  $('#prefid').blur(function (e) { 
	      if (document.getElementById('prefid') == null || (document.getElementById('prefid').value =="")) {
	          
	          $('#preferror').text("Select Preference!");
	        
	          flagforvalidforPref= false;
	      }
	      else
	  	 {	
	    	  $('#preferror').text("");
	    	   flagforvalidforPref= true;
	  	 }
	  });
}



function callBmiMenu() {
	
	if(document.getElementById("prefid").value>0) {
	
	dataString = "pref=" + document.getElementById("prefid").value+"&height=" + document.getElementById("height").value+"&weight=" + document.getElementById("weight").value+"&gender=" + sessionStorage.getItem("Gender")+"&DOB=" + sessionStorage.getItem("DOB"); 
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
	else if(document.getElementById("prefid").value==""){
		document.getElementById("non-veg").style.display = "none";
    	document.getElementById("vegan").style.display = "none";
    	document.getElementById("glutenfree").style.display = "none";
	}
	
}
function submitformselectprogram()
{
	 validatefieldsJS();
	
	 //HTML5 session storage
	 if(flagforvalidforWeight && flagforvalidforHeight && flagforvalidforPref){
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
	
	
	 var baseuri = $("html").data("baseuri");
	 $("#ChoosePlan").attr("href", baseuri+"ChooseYourPlan.jsp");
	
	 document.forms.chooseprogram.submit();
	 }
	 else
	 {
		 	return false;
	 }
}


//Method to call on checkout added by Neetika
function placeOrder()
{
	if($('#Paypal').is(':checked')==false && $('#Bank').is(':checked')==false)
	{
	      $('#Paymenterror').text("Select Payment Option!");
	    
          return false;
	}
	else
		{
			var payment=$('#Paypal').is(':checked')?"Paypal":"Bank";
			 $('#Paymenterror').text("");
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
						 containerMsg.innerHTML = '<h4 style="text-align:center;color:#60ba62"><strong> Wow! You just made a Yummy Choice. Your Order ID is '+data.result+'. </strong> </h4>';
						 var btn=document.getElementById("place"); 
						 btn.style.display = "none";
						 sessionStorage.clear();
				    },
				    error: function(status,error) {	
				    
				    	 var containerMsg = document.getElementById("successMsg");
						 containerMsg.innerHTML = '<h4 style="text-align:center;color:#60ba62"> Sorry! Our basket is full, please try after some time.</h4>';
						 var btn=document.getElementById("place"); 
						 btn.style.display = "none";
						 sessionStorage.clear();
					}
			
			 });
		}
}


//Method to handle flow among 4 steps added by Arpit Saxena
function setCorrectAction(e){
  // baseuri = $("html").data("baseuri");
 
   var baseuri=document.getElementById('pagecontext').value;
   if(baseuri=="")
	{
	   baseuri="/HappyInTummy/";
	}

  alert(baseuri+"baseuri..");
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
  	// alert("setCorrectAction in jse mail "+sessionStorage.getItem("Email"));
	  if($('#desktopView').css('display') == 'block'){
		  	$("#SelectProgram").attr("href", "#");	
	        $("#ChoosePlan").attr("href", "#");
	        $("#Checkout").attr("href", "#");
	  }
	  else if($('#mobileView').css('display') == 'block'){

	        $("#SelectProgram").attr("href", "#");	
	        $("#ChoosePlan").attr("href", "#");
	        $("#Checkout").attr("href", "#");
	  }
	  else if(sessionStorage.getItem("Email")==null)
      {
	        $("#SelectProgram").attr("href", "#");	
	        $("#ChoosePlan").attr("href", "#");
	        $("#Checkout").attr("href", "#");
	        	
      }
      else
      {
    	  	
      	
      		$("#SelectProgram").attr("href", baseuri+"/choose-plan-select-program.jsp");
      		$("#step2").attr("class", "wow fadeInUp step2 current");
      	
      		$("#ChoosePlan").attr("href", "#");
      		$("#Checkout").attr("href", "#");
          
      }
      
  }
  if(e.id=="ChoosePlan"){
     
  	// alert("setCorrectAction in jse Preference "+sessionStorage.getItem("Preference"));
	  if($('#desktopView').css('display') == 'block' || $('#mobileView').css('display') == 'block' || $('#vegan').css('display') == 'block'  || $('#non-veg').css('display') == 'block' || $('#glutenfree').css('display') == 'block'){
		  
		  	$("#ChoosePlan").attr("href", "#");
	        $("#Checkout").attr("href", "#");
	        	
	  }
	  else if(sessionStorage.getItem("Preference")==null)
      {
	       
	        $("#ChoosePlan").attr("href", "#");
	        $("#Checkout").attr("href", "#");
	        	
      }
      else
      {
      	$("#ChoosePlan").attr("href", baseuri+"/ChooseYourPlan.jsp");
      	$("#step3").attr("class", "wow fadeInUp step3 current");
        $("#Checkout").attr("href", "#");
          
      }
  	 
  }
  if(e.id=="Checkout"){
	  
	  if($('#desktopView').css('display') == 'block' || $('#mobileView').css('display') == 'block' || $('#vegan').css('display') == 'block'  || $('#non-veg').css('display') == 'block' || $('#glutenfree').css('display') == 'block'   || $('#pricingview').css('display') == 'block'){
		  
		  	$("#ChoosePlan").attr("href", "#");
	        $("#Checkout").attr("href", "#");
	        	
	  }
	  else{
		  $("#step4").attr("class", "wow fadeInUp step4 current");
	  }
  	
    
  }
}