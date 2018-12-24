class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      cannot %i(edit create), Candidate
      cannot :manage, CandidateJob
    elsif user.applicant?
      can %i(create update show), Candidate
      can :read, Job
      cannot %i(index edit create delete), Job
      cannot :index, AdminsController
      can :manage, CandidateJob
    end
  end
end
