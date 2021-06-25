# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
       when 'kid'
        can :read, User
        can :show, User, id: user.id
        can :show, Gift, recipient: user
        can %i[read ], Gift, recipient: { role: 'kid' }
        can %i[index update create destroy], Gift, added_by: user
        can :manage, Image, gift: { added_by: user }
        can :read, Gift, recipient: { role: 'kid' }
        can %i[create update destroy], Gift, added_by: user, recipient: { role: 'kid' }
        can :manage, Image, gift: { added_by: user }
        can :show, Review, reviewee: { role: 'kid' }
        can %i[create destroy], Review, reviewer: user, reviewee: { role: 'kid' }
        can :show, Estimate, target: { role: 'kid' }
        can %i[show create destroy], Estimate, author: user, target: { role: 'kid' }
       when 'elf'
        can :read, User
        can :read, Gift, recipient: { role: 'kid' }
        can %i[create update destroy], Gift, added_by: user, recipient: { role: 'kid' }
        can :manage, Image, gift: { added_by: user }
        can :show, Review, reviewee: { role: 'kid' }
        can %i[create destroy], Review, reviewer: user, reviewee: { role: 'kid' }
        can :show, Estimate, target: { role: 'kid' }
        can %i[show create destroy], Estimate, author: user, target: { role: 'kid' }
       when 'santa'
        can :read, User
        can :read, Gift, recipient: { role: 'kid' }
        can %i[read], Gift, recipient: { role: 'kid' }
        can %i[create update destroy], Gift, added_by: user, recipient: { role: 'kid' }
        can :manage, Image, gift: { added_by: user }
        can %i[show destroy], Review, reviewee: { role: 'kid' }
        can :create, Review, reviewer: user, reviewee: { role: 'kid' }
        can :show, Estimate, target: { role: 'kid' }
        can %i[show create destroy], Estimate, author: user, target: { role: 'kid' }
        end
  end
end
