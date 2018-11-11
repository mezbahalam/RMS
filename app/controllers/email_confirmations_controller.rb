class EmailConfirmationsController < ApplicationController
  skip_before_action :require_login, only: :confirm
  before_action :find_user

  def confirm
    @user.set_confirm_email
    if @user.save
      @user.update(confirmation_token: nil)
      flash[:notice]= t('flashes.confirmed_email')
      redirect_to sign_in_path
    else
      flash.now[:error]= t('flashes.confirm_your_email')
      redirect_to sign_in_path
    end
  end

  private

  def find_user
    token = params[:token] || params[:user][:token]
    @user ||= User.find_by!(confirmation_token: token)
  end
end
