class CandidateJobsController < ApplicationController
  before_action :find_candidate, :find_job
  load_and_authorize_resource

  def index
    @jobs = Job.sorted
  end

  def new
    @candidate_job = CandidateJob.new(candidate_id: @candidate.id,
                                      job_id: @job.id)
  end

  def create
    if @candidate_job.save
      flash[:notice] = t('job.applied')
      redirect_to candidate_jobs_path(candidate_id: @candidate.id)
    else
      flash.now[:error] = @candidate_job.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def candidate_job_params
    params.require(:candidate_job).permit(:candidate_id, :job_id, :expected_salary)
  end

  def find_candidate
    @candidate = current_user.candidate
  end

  def find_job
    return unless params[:job_id]

    @job = Job.find(params[:job_id])
  end
end
