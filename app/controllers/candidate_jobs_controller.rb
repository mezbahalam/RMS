class CandidateJobsController < ApplicationController
  before_action :find_candidate
  load_and_authorize_resource :job, except: :index
  load_and_authorize_resource through: :job, except: :index

  def index
    @jobs = Job.sorted_by_deadline
  end

  def show
    @candidate_jobs = @job.candidate_jobs
  end

  def new; end

  def create
    if @candidate_job.save
      flash[:notice] = t('job.applied')
      redirect_to candidate_jobs_path
    else
      flash.now[:error] = @candidate_job.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def candidate_job_params
    allowed_params = params.require(:candidate_job).permit(:expected_salary)
    allowed_params.merge(candidate_id: @candidate.id)
  end

  def find_candidate
    @candidate = current_user.candidate
  end
end
