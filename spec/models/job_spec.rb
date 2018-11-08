require 'rails_helper'

# RSpec.describe Job, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

  RSpec.describe Job, type: :model do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:job_description) }
    it { is_expected.to validate_presence_of(:exp_requirement) }
    it { is_expected.to validate_presence_of(:remuneration) }
  end
