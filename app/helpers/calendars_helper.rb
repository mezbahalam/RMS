module CalendarsHelper
  def title_color(job_title)
    CandidateJob::COLORS.each do |key, value|
      if key == job_title.parameterize.underscore.to_sym
        return value
      else
        return 'default-title'
      end
    end
  end
end