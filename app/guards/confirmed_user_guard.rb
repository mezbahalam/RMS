class ConfirmedUserGuard < Clearance::SignInGuard
  def call
    if user_confirmed?
      failure I18n.t('flashes.confirm_your_email')
    else
      next_guard
    end
  end

  def user_confirmed?
    signed_in? && !current_user.email_confirmed_at
  end
end
