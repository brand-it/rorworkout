require "development_mail_interceptor"

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "rorworkout.herokuapp.com",
  :user_name            => "r3duxnet",
  :password             => "uggxwqtsbsbludyv",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

if Rails.env.development?
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
else
  ActionMailer::Base.default_url_options[:host] = "rorworkout.herokuapp.com"
end