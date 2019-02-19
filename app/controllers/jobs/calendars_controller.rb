class Jobs::CalendarsController < ApplicationController

  def show
    if current_user.admin?
      @calendars = Job.all
    else
      @calendars = current_user.candidate.candidate_jobs
    end
  end
end
