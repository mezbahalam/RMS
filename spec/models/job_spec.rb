require 'rails_helper'

# RSpec.describe Job, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Job, type: :model do
  #subject {described_class.new} #or factory_bot
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:job_description) }
  it { is_expected.to validate_presence_of(:exp_requirement) }
  it { is_expected.to validate_presence_of(:remuneration) }
  it { is_expected.to validate_numericality_of(:exp_requirement) }
  it { is_expected.to validate_numericality_of(:remuneration) }
  it "is not valid without a title" do
    expect(subject).to_not be_valid
  end
  it "is not valid without a job description" do
    expect(subject).to_not be_valid
  end
  it "is not valid without remuneration" do
    expect(FactoryBot.build(:job, remuneration: nil)).to_not be_valid
  end
  it "has a valid factory" do
    expect(FactoryBot.build(:job)).to be_valid
  end

  describe 'scope' do
    let!(:job_one) do
      FactoryBot.create(:job,
                        vacancy: 4)
    end

    let!(:job_two) do
      FactoryBot.create(:job,
                        vacancy: 2)
    end

    subject { described_class.sorted }
    context 'sorted by vacancy in ASC order' do
      it { is_expected.to eq([job_two, job_one])}
    end
  end
end
