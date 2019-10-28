class RentMailer < ApplicationMailer
  def new_rent_send(rent_id)
    @rent = Rent.find(rent_id)
    mail(to: @rent.user.email, subject: 'Tu reserva ha sido realizada exitosamente asíncronamente')
  end
end
