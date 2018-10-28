module CandidatesHelper
  def human_attribute_genders
    Hash[Candidate.genders.map { |k,v| [k, Candidate.human_attribute_name("gender.#{k}")] }]
  end
end
