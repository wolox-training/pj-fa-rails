module Api
  module V1
    class RentsController < ApplicationController
      before_action :set_user

      def index
        render_paginated @user.rents
      end

      def create
        rent = @user.rents.create!(rent_params)
        render json: rent
      end

      private

      def rent_params
        params.permit(:start_date, :end_date, :book_id)
      end

      def set_user
        @user = User.find(params[:user_id]) if params[:user_id].present?
      end
    end
  end
end
