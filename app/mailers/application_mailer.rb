class ApplicationMailer < ActionMailer::Base
  default from: Clearance.configuration.mailer_sender
  layout 'mailer'
end
