module Api
  module V1
    class BooksController < ApplicationController
      def index
        books = policy_scope(Book)
        authorize books
        render_paginated books
      end

      def show
        render json: Book.find(params[:id])
      end
    end
  end
end
