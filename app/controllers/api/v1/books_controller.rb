module Api
  module V1
    class BooksController < ApplicationController
      before_action :authenticate_user!

      def index
        render_paginated policy_scope(Book)
      end

      def show
        render json: Book.find(params[:id])
      end

      def search_book
        render json: OpenLibraryService.execute(params[:isbn])
      end
    end
  end
end
