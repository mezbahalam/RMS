require 'rails_helper'
RSpec.describe Job, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }

  it 'has a valid factory' do
    expect(FactoryBot.build(:job)).to be_valid
  end

  describe 'scope' do
    let!(:job_one) do
      FactoryBot.create(:job,
                        deadline: '2018-11-26'.to_date)
    end

    let!(:job_two) do
      FactoryBot.create(:job,
                        deadline: '2018-11-30'.to_date)
    end

    subject { described_class.sorted_by_deadline }
    context 'sorted by deadline in ASC order' do
      it { is_expected.to eq([job_one, job_two]) }
    end
  end

  describe '#start_time' do
    it 'returns deadline from jobs' do
      another_job = create(:job, deadline: '2019-3-30'.to_date)
      expect(another_job.start_time).to eq another_job.deadline
    end
  end
end
