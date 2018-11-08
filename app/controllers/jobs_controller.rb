class JobsController < ApplicationController
  before_action :find_job_id, only: [:show, :edit, :update, :destroy] #find_job_id will be called just before these methods

  def index
    @jobs = Job.all
  end

  def show; end

  def new
    @job = Job.new
  end

  def edit ; end

  def create
    @job = Job.new(job_params)

    if @job.save
      flash[:notice] = t('job.job_notice_create', job_name: @job.title)
      redirect_to jobs_path
    else
      render 'new'
    end
  end

  def update
    if @job.update(job_params)
      flash[:notice] = t('job.job_notice_edit', job_name: @job.title)
      redirect_to jobs_path
    else
      render 'edit'
    end
  end

  def delete ; end

  def destroy
    @job.destroy
    flash[:notice] = t('job.job_notice_delete', job_name: @job.title)
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title,
                                :vacancy,
                                :job_description,
                                :responsibilities,
                                :employment_status,
                                :edu_requirement,
                                :exp_requirement,
                                :location,
                                :remuneration,
                                :benefits,
                                :date_issue,
                                :deadline,
                                :job_status,
                                :employer_notice)
  end

  def find_job_id
    @job = Job.find(params[:id])
  end

end
