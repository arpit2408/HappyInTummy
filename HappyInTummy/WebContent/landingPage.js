//Created by Arpit Saxena for Landing Page 

$(document).ready(function(){
    // Use only for V1
    $('#radioBtn span').on('click', function(){
        var sel = $(this).data('value');
        var tog = $(this).data('toggle');
        $('#'+tog).val(sel);
        // You can change these lines to change classes (Ex. btn-default to btn-danger)
        $('span[data-toggle="'+tog+'"]').not('[data-value="'+sel+'"]').removeClass('active selectedMenu fa fa-check-circle').addClass('notActive btn-default');
        $('span[data-toggle="'+tog+'"][data-value="'+sel+'"]').removeClass('notActive btn-default').addClass('active selectedMenu fa fa-check-circle');
    });
});
function getAccMenu(e){
	$("#nonvegmenu").fadeOut(500);
	$("#vegmenu").fadeOut(500);
	$("#glutenfreemenu").fadeOut(500);
	$("#"+e.id.replace("id","")).fadeIn(700);
	/*document.getElementById('nonvegmenu').style.display = 'none';
	document.getElementById('vegmenu').style.display = 'none';
	document.getElementById('glutenfreemenu').style.display = 'none';
	document.getElementById(e.id.replace("id","")).style.display = 'block';*/

	if(e.id.replace("id","")=="nonvegmenu") 
	{
		sessionStorage.setItem('PreferenceLand',2);
	}
	if(e.id.replace("id","")=="glutenfreemenu") 
	{
		sessionStorage.setItem('PreferenceLand',3);
	}
	if(e.id.replace("id","")=="vegmenu") 
	{
		sessionStorage.setItem('PreferenceLand',1);
	}
}