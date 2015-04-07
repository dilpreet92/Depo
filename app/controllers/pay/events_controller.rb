class Pay::EventsController < ApplicationController

  def create
    render plain: 'got the webhook'
  end

  def index
    render plain: 'got the webhook'
  end

end