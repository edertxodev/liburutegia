class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.admin == true
      can :access, :rails_admin
      can :dashboard
    end
  end
end
