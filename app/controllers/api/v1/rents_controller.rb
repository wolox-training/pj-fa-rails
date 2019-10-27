module Api
  module V1
    class RentsController < ApplicationController
      def index
        rents = policy_scope(Rent)
        authorize rents
        render_paginated rents
      end

      def create
        rent = @current_user.rents.new(rent_params)
        authorize rent
        rent.save!
        #RentMailer.new_rent_send(rent.id).deliver_later
        render json: rent, status: :created
      end

      private

      def rent_params
        params.permit(:start_date, :end_date, :book_id)
      end
    end
  end
end
