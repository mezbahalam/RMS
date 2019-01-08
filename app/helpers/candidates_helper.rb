module CandidatesHelper
  require 'date'

  def human_attribute_genders
    Hash[Candidate.genders.map { |k,v| [k, Candidate.human_attribute_name("gender.#{k}")] }]
  end

  def age(dob)
    if valid_date = dob.try(:to_date)
      today = Date.today
      age = today.year - valid_date.year
      age -= 1 if valid_date.strftime('%m%d').to_i > today.strftime('%m%d').to_i
      age
    end
  end

  def valid_age?(dob)
    applicant_age = age(dob)
    applicant_age > 15
  end
end
