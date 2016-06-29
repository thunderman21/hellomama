class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new# guest user (not logged in)
    if user.admin?
      can :manage, :all
    #Abilities of the staff
    elsif user.staff?
      can :manage, Article
      can :read, Forum
      can :create, Forum
      can :update, Forum, :published => true
      can :destory, Forum, :published => true
      can :read, Comment
      can :create, Comment
      can :destory, Comment, :published => true
      can :update, Comment, :published => true
      can :read, Diary
      can :create, Diary
      can :update, Diary do |diary|
        diary.try(:user) == user
      end
      can :delete, Diary do |diary|
        diary.try(:user) == user
      end
      can :read, Group
      can :create, Group
      can :destroy, Group, :published => true
    #Abilities of the regular user  
    elsif user.regular?
      can :read, Article
      can :read, Forum
      can :create, Forum
      can :update, Forum do |forum|
        forum.try(:user) == user
      end
      can :destroy, Forum do |forum|
        forum.try(:user) == user
      end
      can :create, Diary
      can :read, Diary
      can :update, Diary do |diary|
        diary.try(:user) == user
      end
      can :delete, Diary do |diary|
        diary.try(:user) == user
      end
      can :create, Group
      can :upate, Group do |group|
        group.try(:user) == user
      end
      can :destroy, Group  do |group|
        group.try(:user) == user
      end
      can :read, Comment
      can :create,Comment
      can :update,Comment do |comment|
        comment.try(:user) == user
      end
      can :destroy, Comment do |comment|
        comment.try(:user) == comment
      end
    else
      can :read, Article
      can :read, Forum
      can :read, Diary
      can :read, Forum
      can :read, Group
    end

    #use this for upatating an deleting stuff that the user created
    #    , Item do |item|
    #   item.try(:user) == user
    #  end

    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
