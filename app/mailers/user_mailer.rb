class UserMailer < ApplicationMailer
  def sign_up_confirmation(user)
    @user = user
    mail(
         from: Clearance.configuration.mailer_sender,
         to: @user.email,
         subject: t('users.mailer.subject.confirm_email')
    )
  end
end
