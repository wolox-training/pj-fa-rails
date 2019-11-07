class RentMailer < ApplicationMailer
  def new_rent_send(rent_id)
    @rent = Rent.find(rent_id)
    locale(@rent.user)
    mail(to: @rent.user.email, subject: t('subject_rent_email'))
  end

  def expire_rent_send
    rents = Rent.where(end_date: Time.zone.today)
    rents.each do |rent|
      locale(rent.user)
      mail(to: rent.user.email, subject: t('subject_expire_rent_email'))
    end
  end
end
