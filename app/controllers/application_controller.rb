class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_locale

  rescue_from 'CanCan::AccessDenied' do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
