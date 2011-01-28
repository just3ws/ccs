jQuery(document).ready(function(){
	$('form').
		focusin(function(evt){ $(evt.target).next().show();}).
		focusout(function(evt){$(evt.target).next().hide();});
});