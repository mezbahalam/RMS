class JobsController < ApplicationController
  before_action :find_job, only: %i(show edit update destroy)

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
      flash[:notice] = t('job.notice_create')
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      flash[:notice] = t('job.notice_edit')
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    flash[:notice] = t('job.notice_delete')
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title,
                                :description,
                                :deadline)
  end

  def find_job
    @job = Job.find(params[:id])
  end
end
