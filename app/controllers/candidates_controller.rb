class CandidatesController < ApplicationController
  before_action :check_if_email_confirmed
  skip_before_action :check_if_profile_filled?
  load_and_authorize_resource

  def index
    @candidates = Candidate.sorted
  end

  def show; end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = current_user.build_candidate(candidate_params)
    @candidate.avatar.attach(candidate_params[:avatar])
    if @candidate.save
      flash[:notice] = t('candidate.notice_create', candidate_name: @candidate.name)
      redirect_to pages_path
    else
      flash.now[:error] = @candidate.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @candidate.update(candidate_params)
      flash[:notice] = t('candidate.notice_edit', candidate_name: @candidate.name)
      redirect_to pages_path
    else
      flash.now[:error] = @candidate.errors.full_messages.to_sentence
      render :edit
    end
  end

  def delete; end

  def destroy
    if @candidate.destroy
      flash[:notice] = t('candidate.notice_delete', candidate_name: @candidate.name)
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
                                      :delete_avatar,
                                      :user_id)
  end

  def check_if_email_confirmed
    return unless current_user
    redirect_to sign_in_path if current_user.email_confirmed_at.blank?
  end
end
