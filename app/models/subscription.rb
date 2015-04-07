class Subscription < ActiveRecord::Base

  # include Stripe::Callbacks

  # customer_subscription_created! do |customer, event|
  #   debugger
  # end

  attr_accessor :stripe_card_token

  def save_with_payment
    Stripe::Customer.create(description: email, plan: 'silver', card: stripe_card_token)
    save
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
      false
  end

end