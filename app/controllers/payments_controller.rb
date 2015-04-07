class PaymentsController < ApplicationController

  def index
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.save_with_payment
  end

  private

    def subscription_params
      params.require(:subscription).permit(:email, :stripe_card_token)
    end

end