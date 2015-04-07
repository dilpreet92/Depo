class Stripe::EventsController < ApplicationController

  def create
    render plain: 'got the webhook'
  end

end