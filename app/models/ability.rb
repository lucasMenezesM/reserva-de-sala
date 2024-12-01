# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    return can :read, :all if !user.present?

    if user.admin?
      can :manage, :all
    elsif user.user?
      can :create, Reservation
      can :destroy, Reservation, user_id: user.id
      can :read, :all
    end
  end
end
