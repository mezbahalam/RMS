class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      cannot %i(edit create), Candidate
    end
    if user.applicant?
      can %i(create update show), Candidate
    end
  end
end
