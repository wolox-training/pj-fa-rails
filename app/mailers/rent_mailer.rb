class RentMailer < ApplicationMailer
  def new_rent_send(rent_id)
    @rent = Rent.find(rent_id)
    mail(to: @rent.user.email, subject: t('subject_rent_email'))
  end
end
