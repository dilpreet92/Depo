class Pay::EventsController < ApplicationController

  def create
    puts "#{ request.body }"
  end

  def index
  end

end