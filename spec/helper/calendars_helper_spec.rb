require 'rails_helper'

RSpec.describe CalendarsHelper, type: :helper do
  let(:job) { FactoryBot.create(:job, title: 'Junior Software Engineer') }
  describe '#title_color' do
    context 'when job_title is present in COLORS' do
      it 'returns css class name_tag' do
        job_title = job.title
        expect(title_color(job_title)).to eq 'junior-engineer'
      end
    end

    context 'when job_title is not present' do
      it 'returns default css class name_tag' do
        job_title = 'Account Manager'
        expect(title_color(job_title)).to eq 'default-title'
      end
    end
  end
end