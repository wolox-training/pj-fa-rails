class ExpireRentEmailWorker
  include Sidekiq::Worker

  def perform
    rents = Rent.where(end_date: Time.zone.today)
    rents.map{|rent| RentMailer.expire_rent_send(rent.id).deliver_now}
  end
end
