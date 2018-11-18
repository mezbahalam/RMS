class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can [:read, :delete, :create], Candidate
    end
  end
end
