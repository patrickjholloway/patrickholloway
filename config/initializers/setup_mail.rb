require 'development_mail_interceptor'

ActionMailer::Base.smtp_settings = {
  :address               => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "mail.gmail.com",
  :user_name            => "patrickjholloway@gmail.com",
  :password             => "lgchocolate83",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?