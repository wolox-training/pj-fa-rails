class RentMailer < ApplicationMailer
  def new_rent_send(rent_id)
    rent = Rent.find(rent_id)
    email = rent.user.email
    book = rent.book

    @date = Time.zone.today
    @title = book.title
    @year = book.year
    @publisher = book.publisher
    @start_date = rent.start_date
    @end_date = rent.end_date

    mail(to: email, subject: 'Tu reserva ha sido realizada exitosamente asíncronamente')
  end
end
