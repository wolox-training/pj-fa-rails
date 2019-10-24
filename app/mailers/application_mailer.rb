class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@pjtraining.com'
  layout 'mailer'

  def locale(user)
    if user
      I18n.locale = user.locale || I18n.default_locale
    else
      super
    end
  end
end
