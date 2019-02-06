class PagesController < ApplicationController
  before_action :check_if_profile_filled?
  def index
    if current_user.admin?
      redirect_to admins_path
    elsif current_user.applicant? && current_user.candidate
      redirect_to candidate_jobs_path
    else
      redirect_to new_candidate_path
    end
  end

  def help
  end
end
