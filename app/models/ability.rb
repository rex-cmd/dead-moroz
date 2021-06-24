# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
       when 'kid'
        can :show, User, id: user.id
        can :show, Gift, recipient: user
        can %i[index update create destroy], Gift, added_by: user
        can :manage, Image, gift: { added_by: user }
       when 'elf'
        can :read, User
        can :read, Gift, recipient: { role: 'kid' }
        can %i[create update destroy], Gift, added_by: user, recipient: { role: 'kid' }
        can :manage, Image, gift: { added_by: user }
        can :show, Review, reviewee: { role: 'kid' }
        can %i[create destroy], Review, reviewer: user, reviewee: { role: 'kid' }
       when 'santa'
        
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
