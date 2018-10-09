class CandidatesController < ApplicationController
  before_action :find_candidate, only: %i[show edit update delete destroy]
  def index
    @candidates = Candidate.sorted
  end

  def show ; end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      flash[:notice] = t('candidate.can_notice_create')
      redirect_to(candidates_path)
    else
      render :new
    end
  end

  def edit ; end

  def update
    if @candidate.update_attributes(candidate_params)
      flash[:notice] = t('candidate.can_notice_edit')
      redirect_to(candidates_path(@candidate))
    else
      render :edit
    end
  end

  def delete ; end

  def destroy
    @candidate.destroy
    flash[:notice] = t('candidate.can_notice_delete')
    redirect_to(candidates_path)
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
                                      :keywords,
                                      :referrals,
                                      :upload_file)
  end
  def find_candidate
    @candidate = Candidate.find(params[:id])
  end
end
