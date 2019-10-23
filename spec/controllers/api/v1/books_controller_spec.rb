require 'rails_helper'

describe Api::V1::BooksController do
  include_context 'with Authenticated User'

  describe 'GET #index' do
    subject(:http_request) { get :index }

    context 'when fetching all the books' do
      let(:books) { create_list(:book, 3) }

      before do
        http_request
      end

      it 'reponses with books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(http_request).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    subject(:http_request) { get :show, params: { id: id } }

    context 'when fetching a book' do
      let(:book) { create(:book) }
      let(:id) { book.id }

      it 'responses with the book json' do
        expect(http_request.body.to_json) =~ BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(http_request).to have_http_status(:ok)
      end
    end

    context 'when the book is invalid' do
      let(:id) { 1000 }

      it 'returns status code 404' do
        expect(http_request).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(http_request.body).to match("{\"error\":\"Couldn't find Book with 'id'=1000\"}")
      end
    end
  end
end
