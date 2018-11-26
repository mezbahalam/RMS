class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      cannot %i(edit create), Candidate
    else
      can %i(create update show), Candidate
    end
  end
end
