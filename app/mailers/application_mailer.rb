# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@deali.net'
  layout 'mailer'
end
