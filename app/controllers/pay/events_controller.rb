class Pay::EventsController < ApplicationController

  def create
    puts "#{ request.body }"
    render json: { message: 'got the webhook' }
  end

  def index
  end

end