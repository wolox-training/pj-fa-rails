class Api::V1::BooksController < ApplicationController
  def index
    @books = Book.all
    render_paginated json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end
end
