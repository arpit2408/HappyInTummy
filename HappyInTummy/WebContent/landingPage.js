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
	document.getElementById('nonvegmenu').style.display = 'none';
	document.getElementById('vegmenu').style.display = 'none';
	document.getElementById('glutenfreemenu').style.display = 'none';
	document.getElementById(e.id.replace("id","")).style.display = 'block';
}