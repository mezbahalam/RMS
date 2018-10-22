class EmailConfirmationsController < ApplicationController
  skip_before_action :require_login, only: :confirm
  skip_before_action :check_if_email_confirmed
  before_action :find_user

  def confirm
    @user.confirm_email
    if @user.save
      @user.update(confirmation_token: nil)
      redirect_to sign_in_path, flash: { success: t('flashes.confirmed_email') }
    else
      redirect_to sign_in_path, flash: { danger: t('flashes.confirm_your_email') }
    end
  end

  def update
    user = User.find_by!(confirmation_token: params[:token])
    user.confirm_email
    sign_in (@user)
    redirect_to root_path, notice: t('flashes.confirmed_email')
  end

  def resend_confirmation
    @user.update(confirmation_token: Clearance::Token.new)
    UserMailer.sign_up_confirmation(@user).deliver_now
    respond_to do |format|
      flash[:danger] = t('flashes.confirm_your_email')
      format.html { redirect_to (sign_in_url) }
    end
  end

  private
  def find_user
    if params[:token]
    token = params[:token] || params[:user][:token]
    @user ||= User.find_by!(confirmation_token: token)
    end
  end
end
