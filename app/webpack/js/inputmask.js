$(document).on('turbolinks:load', function() {
  Inputmask("+9{7,15}", {placeholder: ''}).mask("#user_phone_number, #doctor_phone_number");
});
