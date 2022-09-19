$(document).on('turbolinks:load', function() {
  $('.edit_verification_link').on('keyup change', function(){
    var $this = $(this);
    var $button_start_verification = $('#start_verification');
    $button_start_verification.removeClass('visually-hidden')
    var $new_val = 'phone_number=' + $this.val().replace('+', '%2B');
    var $new_href = $button_start_verification.attr('href').replace(/phone_number=[%2B0-9]*/, $new_val);
    $button_start_verification.attr('href', $new_href);
  });
});
