# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 587,
  :domain => "monsite.fr",
  :authentication => :plain,
  :enable_starttls_auto => true,
  :user_name => ENV["SENDGRID_LOGIN"],
  :password => ENV["SENDGRID_PWD"],
}
