class PagesController < ApplicationController
  before_action :check_if_profile_filled?

  def index
    if current_user.admin?
      redirect_to admins_path
    else
      if current_user.candidate
        render :index
      else
        redirect_to new_candidate_path
      end
    end
  end
end
