module Api
  module V1
    class BookSuggestionsController < ApplicationController
      def create
        render json: BookSuggestion.create!(book_suggestion_params), status: :created
      end

      private

      def book_suggestion_params
        params.permit(:synopsis, :price, :author, :title, :link, :publisher, :year, :user_id)
      end
    end
  end
end
