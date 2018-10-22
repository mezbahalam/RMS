class UserMailer < ApplicationMailer
  def sign_up_confirmation(user)
    @user = user
    mail(
         from: Clearance.configuration.mailer_sender,
         to: @user.email,
         subject: t('users.mailer.subject.confirm_email')
    )
  end

  def delete_confirmation(user, params)
    @user = user
    @params = params
    mail(to: @user.email,
         subject: t("user_mailer.delete_confirmation.delete_#{params[:delete_reason]}.title"))
  end
end
