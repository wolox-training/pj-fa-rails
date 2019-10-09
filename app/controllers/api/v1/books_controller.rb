module Api
  module V1
    class BooksController < ApplicationController
      def index
        render_paginated Book.includes(:rents).all
      end

      def show
        render json: Book.includes(:rents).find(params[:id])
      rescue StandardError => exception
        rescue_with_handler(exception) || raise
      end
    end
  end
end
