require 'rails_helper'
describe Job, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:job_description) }
  it { is_expected.to validate_presence_of(:employment_status) }
  it { is_expected.to validate_presence_of(:exp_requirement) }
  it { is_expected.to validate_presence_of(:remuneration) }
  it { is_expected.to validate_presence_of(:job_status) }
  it { is_expected.to validate_numericality_of(:exp_requirement) }
  it { is_expected.to validate_numericality_of(:remuneration) }
  it { is_expected.to define_enum_for(:title).with([:junior_software_engineer, :software_engineer,
                                                    :senior_software_engineer, :project_manager, :managing_director]) }
  it { is_expected.to define_enum_for(:employment_status).with([:full_time, :part_time, :contractual]) }
  it { is_expected.to define_enum_for(:location).with([:dhaka, :switzerland, :south_africa]) }
  it { is_expected.to define_enum_for(:job_status).with([:open, :closed]) }

  it 'has a valid factory' do
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
      it { is_expected.to eq([job_two, job_one]) }
    end
  end
end
