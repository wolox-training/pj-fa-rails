module Api
  module V1
    class RentsController < ApplicationController
      def index
        render_paginated @current_user.rents
      end

      def create
        rent = @current_user.rents.create!(rent_params)
        RentMailer.new_rent_send(rent.id).deliver_later
        render json: rent, status: :created
      end

      private

      def rent_params
        params.permit(:start_date, :end_date, :book_id)
      end
    end
  end
end
