class ArticlesController < ApplicationController

  def index
    puts 'hey'.duplicable?
    render plain: 'hey'
  end

  def new
  end

  def create
    render plain: 'got it'
  end

end