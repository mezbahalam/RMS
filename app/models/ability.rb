class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      cannot [:edit, :create], Candidate
    elsif user.candidate?
      can [:create, :update, :show], Candidate
    end
  end
end
