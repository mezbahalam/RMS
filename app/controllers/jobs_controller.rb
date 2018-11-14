class JobsController < ApplicationController
  before_action :find_job_id, only: %i[show edit update destroy]
  before_action :check_if_email_confirmed

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

  def check_if_email_confirmed
    return unless current_user
    redirect_to sign_in_path if current_user.email_confirmed_at.blank?
  end
end
