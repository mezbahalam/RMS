class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      cannot %i(edit create), Candidate
    elsif user.applicant?
      can %i(create update show), Candidate
      cannot :manage, Job
      cannot :index, AdminsController
    end
  end
end
