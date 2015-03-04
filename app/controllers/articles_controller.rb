class BooksController < ApplicationController

  #before_action :load_article, only: :show

  #load_and_authorize_resource :book, parent: false
  load_resource :article, find_by: :a
  load_resource :books, through: :article
  #

  
  def index
    @books = 
    #debugger
    #@articles = Article.all
    #@articles = Article.accessible_by(current_ability)
    #ability = Ability.new(User.find(1))
    #@articles = Article.accessible_by(ability)
    #ability = Ability.new(User.find(1))
    #@article = Article.accessible_by(ability)
    #@articles.load
  end

  def edit
  end

  def create

    @article.save
  end

  def new
    #@article = Article.new(active: true)
    authorize!(:new, Article, message: 'access denied')
  end

  def enable
    @article.active = false
    #if can? :enable, @article
      @article.save
      #render plain: 'done'
    #else
      #render plain: 'Not allowed'
    #end
  end

  private

    def create_params
      params.require(:article).permit(:name)
    end

    def update_params
      params.require(:article).permit(:active)
    end

    def article_params
    end

    def resource_params
    end

    def load_article
      @article = Article.find_by(id: 1)
    end

end