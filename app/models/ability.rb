class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      cannot %i(edit create), Candidate
      cannot :create, CandidateJob
    elsif user.applicant?
      can %i(create update show), Candidate
      can :read, Job
      cannot %i(index edit create delete), Job
      cannot :index, AdminsController
      can %i(index create), CandidateJob
      cannot :show_requests, CandidateJob
    end
  end
end
