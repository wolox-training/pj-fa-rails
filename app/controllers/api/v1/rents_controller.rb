module Api
  module V1
    class RentsController < ApplicationController
      def index
        render_paginated Rent.all
      end

      def create
        rent = Rent.create!(rent_params)
        render json: rent
      end

      private

      def rent_params
        # whitelist params
        params.permit(:start_date, :end_date, :user_id, :book_id)
      end
    end
  end
end
