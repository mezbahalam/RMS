class CandidateJobsController < ApplicationController
  before_action :find_candidate
  before_action :find_job
  before_action :find_candidate_job, only: [:show]

  def index
    @candidate_jobs = CandidateJob.all
    @jobs = Job.all
  end

  def show; end

  def new
    @candidate_job = CandidateJob.new(candidate_id: current_user.candidate.id, job_id: @job.id)
  end

  def create
    @candidate_job = CandidateJob.new(candidate_job_params)
    if @candidate_job.save
      flash[:notice] = t('job.applied')
      redirect_to candidate_jobs_path(candidate_id: current_user.candidate.id)
    else
      flash[:error] = @candidate_job.errors.full_messages.to_sentence
      redirect_to candidate_jobs_path(candidate_id: current_user.candidate.id)
    end
  end

  private

  def candidate_job_params
    params.require(:candidate_job).permit(:candidate_id, :job_id, :expected_salary)
  end

  def find_candidate_job
    @candidate_job = CandidateJob.find(params[:id])
  end

  def find_candidate
    if params[:candidate_id]
      @candidate = Candidate.find(params[:candidate_id])
    end
  end

  def find_job
    if params[:job_id]
      @job = Job.find(params[:job_id])
    end
  end

end
