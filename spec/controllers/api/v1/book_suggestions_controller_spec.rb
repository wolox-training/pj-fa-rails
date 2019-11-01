require 'rails_helper'

describe Api::V1::BookSuggestionsController do
  describe 'POST #create' do
    subject(:http_request) { post :create, params: valid_attributes }

    let(:valid_attributes) do
      {
        user_id: user_id,
        synopsis: Faker::String.random(length: 8),
        author: Faker::Book.author,
        title: Faker::Book.title,
        link: Faker::String.random(length: 8),
        publisher: Faker::Book.publisher,
        year: Faker::String.random(length: 4),
        price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
      }
    end

    context 'when the request is valid' do
      let(:user_id) { create(:user).id }

      it 'responds with 201 status' do
        http_request
        expect(http_request).to have_http_status(:created)
      end

      it 'returns the correct user_id' do
        http_request
        expect(JSON.parse(response.body)['user_id']).to eq(valid_attributes[:user_id])
      end

      it 'returns the correct author' do
        http_request
        expect(JSON.parse(response.body)['author']).to eq(valid_attributes[:author])
      end

      it 'returns the correct title' do
        http_request
        expect(JSON.parse(response.body)['title']).to eq(valid_attributes[:title])
      end

      it 'returns the correct link' do
        http_request
        expect(JSON.parse(response.body)['link']).to eq(valid_attributes[:link])
      end

      it 'returns the correct publisher' do
        http_request
        expect(JSON.parse(response.body)['publisher']).to eq(valid_attributes[:publisher])
      end
      it 'returns the correct year' do
        http_request
        expect(JSON.parse(response.body)['year']).to eq(valid_attributes[:year])
      end

      it 'creates a new book suggestions' do
        expect { http_request }.to change(BookSuggestion, :count)
      end
    end

    context 'when request is invalid' do
      let(:user_id) { nil }

      it 'returns error messages' do
        http_request
        expect(http_request.body['error']).to be_present
      end

      it 'responds with 422 status' do
        http_request
        expect(http_request).to have_http_status(:unprocessable_entity)
      end

      it 'Do not creates a new book suggestions' do
        http_request
        expect { http_request }.not_to change(BookSuggestion, :count)
      end
    end
  end
end
