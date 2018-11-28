class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_locale
  before_action :check_if_email_confirmed

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def check_if_email_confirmed
    return unless current_user
    redirect_to sign_in_path if current_user.email_confirmed_at.blank?
  end
end
