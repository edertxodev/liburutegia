class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.role == "admin"
      can :access, :rails_admin
      can :dashboard
    end
  end
end
