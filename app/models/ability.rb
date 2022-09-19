# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Doctor

    return if user.blank?

    if user.instance_of? User
      can :read, Appointment, user: user
      can :create, Appointment
    elsif user.instance_of? Doctor
      can :read, Appointment, doctor: user
      can :create, Recommendation
    end
  end
end
