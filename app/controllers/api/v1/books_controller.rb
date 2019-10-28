module Api
  module V1
    class BooksController < ApplicationController
      def index
        render_paginated policy_scope(Book)
      end

      def show
        render json: Book.find(params[:id])
      end
    end
  end
end
