class JobsController < ApplicationController

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
      flash[:notice] = t('job.can_notice_create', job_title: @job.title)
      redirect_to jobs_path

    else
      render 'new'
    end
  end

  def update
  end

  def delete ; end

  def destroy
  end

  private
  def job_params
    params.require(:job).permit(:title,
                                :job_description,
                                :responsibilities,
                                :requirements,
                                :remuneration,
                                :location,
                                :deadline,
                                :date_issue,
                                :status)
  end
end
