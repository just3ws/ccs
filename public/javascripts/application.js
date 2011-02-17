jQuery(document).ready(function() {
  $('form').
          focusin(
          function(evt) {
            $(evt.target).next('.hint').show();
          }).
          focusout(function(evt) {
    $(evt.target).next('.hint').hide();
  });

  $('#preregistration form').validate({
    messages: {'preregistration[email]': 'We need your email address to notify you.'},
    errorPlacement: function(error, field) {
      error.insertAfter(field.next(':button'));
    }
  });

  $('.hint').hide().css('color', '#00024d');
});

$(document).ready(function() {
  if (!Modernizr.input.placeholder) {
    $('input[placeholder], textarea[placeholder]').placeholder();
  }
});
