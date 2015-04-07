function Card(elements) {
  this.number = $('#card_number').val()
  this.cvc = $('#card_code').val()
  this.expMonth = $('#card_month').val()
  this.expYear = $('#card_year').val()
}

function PaymentController(elements) {}

PaymentController.prototype.bindEvents = function() {
  $('.hidden').hide();
  var _this = this;
  $('.pay').on('click', function(e) {
    e.preventDefault();
    card = new Card();
    Stripe.createToken(card, _this.handleStripeResponse);
  });
},

PaymentController.prototype.handleStripeResponse = function(status, response) {
  if(status == 200) {
    alert(response.id);
    $('#subscription_stripe_card_token').val(response.id);
    $('#stripe_error').text('');
    $('#new_subscription').submit();
  }
  else {
    $('#stripe_error').text(response.error.message);
  }
}

$(document).ready(function() {
  var payment = new PaymentController();
  payment.bindEvents();
});