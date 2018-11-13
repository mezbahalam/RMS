Clearance.configure do |config|
  config.allow_sign_up = true
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
  config.sign_in_guards = [ConfirmedUserGuard]
  config.routes = true
end
