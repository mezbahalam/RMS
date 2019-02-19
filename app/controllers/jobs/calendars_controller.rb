class Jobs::CalendarsController < ApplicationController
  def show
    return @calendars = current_user.candidate.candidate_jobs unless current_user.admin?

    @calendars = Job.all
  end
end
