class Ability
  include CanCan::Ability

  def default_alias_actions
    {
      :read => [:index, :show],
      :create => [:new],
      :update => [:edit],
      #:enable => [:enable],
    }
  end


  def initialize(user, ip)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    #alias_action :enable, to: :enable

    alias_action :update, :destroy, to: :modify

    if user.admin?
      can :manage, :all
    else
      #cannot :manage, Article

      #can :update, Article , active: true

      # can :read, Article, ['active = ?', true] do |article|
      #   article.active?
      # end
      #can :modify, Article, active: true
      #can [:create, :update], [Book, Article]
      # can :update, Book
      # can :enable, Article
      # can :read, Article, ['active = ?', true] do |article|
      #   article.active
      # end
      ##custom attribute
      #can :read, :status
      #cannot :enable, Article
      # can do |action, subject_class, object|
      # end
      #can :modify, Article
      #can :read, Article, books: { published: true }
      #can :read, Article, id: Article.joins('LEFT OUTER JOIN books ON articles.id = books.article_id').where('books.published = ? OR books.article_id IS NULL', true).pluck(:id)
      can :create, Article do |article|
        user.email == 'dp'
      end

      #can :manage, Article, active: true
      #can :read, Article
      #can :read, :status
      #can :read, Book
      #
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

end
