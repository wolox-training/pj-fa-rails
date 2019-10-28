class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@pjtraining.com'
  layout 'mailer'

  def locale(user)
    I18n.locale = user.locale || I18n.default_locale
  end
end
