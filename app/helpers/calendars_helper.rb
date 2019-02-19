module CalendarsHelper
  def title_color(job_title)
    CandidateJob::COLORS.each do |key, value|
      return 'default-title' unless key == job_title.parameterize.underscore.to_sym

      return value
    end
  end
end
