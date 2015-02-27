if Rails.env.production? || Rails.env.development?
  DeltaBase::Application.config.action_mailer.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
      address: Settings['mandrill']['host'],
      port: Settings['mandrill']['port'],
      user_name: Settings['mandrill']['user_name'],
      password: Settings['mandrill']['api_key']
  }
end