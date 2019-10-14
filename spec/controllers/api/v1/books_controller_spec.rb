require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'with Authenticated User'

  describe 'GET #index' do
    context 'when fetching all the books' do
      let(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'reponses with books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'when fetching a book' do
      let(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the book json' do
        expect(response.body.to_json) =~ BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the book is invalid' do
      let(:book_id) { 1000 }

      before do
        get :show, params: { id: book_id }
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"error\":\"Couldn't find Book with 'id'=1000\"}")
      end
    end
  end
end
