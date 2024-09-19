class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('GMAIL_MAIL_ADDRESS', nil)
  layout 'mailer'
end
