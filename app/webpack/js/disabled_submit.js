$(document).on('turbolinks:load', function() {
  $('.disabled-submit-btn .enable-submit-btn').on('keyup change', function(elem){
    var $not_disabled = this.classList.contains('not-disable-submit-btn');
    var $this = $(this);
    var $form = $this.closest('form');
    var $button = $form.find(".btn.btn-outline-primary");
    if ($this.attr('type')=='checkbox') $empty_value = ! $this.is(":checked")
    else $empty_value = $this.val() == ''
    $button.prop('disabled', $empty_value && !$not_disabled);
  });
});
