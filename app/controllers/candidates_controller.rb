class CandidatesController < ApplicationController
  before_action :find_candidate, only: %i[show edit update delete destroy]
  skip_before_action :require_login
  skip_before_action :check_if_email_confirmed

  def index
    if current_user
      @candidates = Candidate.sorted
    else
      render template: 'sessions/new'
    end
  end

  def show; end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.avatar.attach(candidate_params[:avatar])
    if @candidate.save
      flash[:notice] = t('candidate.can_notice_create', candidate_name: @candidate.name)
      redirect_to candidates_path
    else
      flash.now[:error] = t('candidate.can_notice_create_fail')
      render :new
    end
  end

  def edit ; end

  def update
    if @candidate.update(candidate_params)
      flash[:notice] = t('candidate.can_notice_edit', candidate_name: @candidate.name)
      redirect_to candidates_path(@candidate)
    else
      flash.now[:error] = t('candidate.can_notice_edit_fail', candidate_name: @candidate.name)
      render :edit
    end
  end

  def delete ; end

  def destroy
    if @candidate.destroy
      flash[:notice] = t('candidate.can_notice_delete', candidate_name: @candidate.name)
      redirect_to candidates_path
    end
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name,
                                      :email,
                                      :contact,
                                      :gender,
                                      :address,
                                      :dob,
                                      :skill,
                                      :experience,
                                      :personal_interest,
                                      :long_term_plan,
                                      :hobbies,
                                      :keywords,
                                      :referrals,
                                      :avatar,
                                      :delete_avatar)
  end
  def find_candidate
    @candidate = Candidate.find(params[:id])
  end
end
