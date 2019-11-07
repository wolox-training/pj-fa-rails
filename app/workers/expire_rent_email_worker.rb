class ExpireRentEmailWorker
  include Sidekiq::Worker

  def perform
    RentMailer.expire_rent_send.deliver_later
  end
end
