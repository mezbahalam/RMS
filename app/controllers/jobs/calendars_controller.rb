class Jobs::CalendarsController < ApplicationController

  def show
    @calendars = Job.sorted_by_deadline
  end
end
