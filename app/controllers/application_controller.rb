class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_locale
  before_action :check_if_profile_filled?

  rescue_from 'CanCan::AccessDenied' do |exception|
    flash[:error] = exception.message
    redirect_to root_path
  end

  def check_if_profile_filled?
    return unless current_user
    return if current_user.profile_filled?
    flash.now[:error] = t('layouts.application.incomplete_signup')
    redirect_to edit_user_path(current_user)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
