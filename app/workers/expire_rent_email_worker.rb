class ExpireRentEmailWorker
  include Sidekiq::Worker

  def perform
    rents = Rent.where(end_date: Time.zone.today)
    rents.each { |rent| RentMailer.expire_rent_send(rent).deliver_now }
  end
end
