class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :check_if_email_confirmed
  before_action :set_locale

  def check_if_email_confirmed
    return unless current_user
    redirect_to sign_in_path if current_user.email_confirmed_at.blank?
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end
end
