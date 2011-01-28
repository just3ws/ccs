jQuery(document).ready(function(){
	$('form').
		focusin(function(evt) { 
      $(evt.target).next().css('color', '#4d0200').show();
    }).
		focusout(function(evt) {
      $(evt.target).next().hide();
    });
});

jQuery(document).ready(function() {
  $('.hint').hide();
});
