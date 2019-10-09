module V1
  class BooksController < ApplicationController
    def index
      render_paginated Book.includes(:rents).all
    end

    def show
      render json: Book.includes(:rents).find(params[:id])
    end
  end
end
