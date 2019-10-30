require 'rails_helper'

describe Api::V1::BookSuggestionsController do
  describe 'POST #create' do
    subject(:http_request) { post :create, params: valid_attributes }

    let(:valid_attributes) do
      { user_id: user_id, synopsis: 'test_synopsis', author: 'test_author',
        title: 'test_title', link: 'test_link', publisher: 'test_publisher',
        year: '1987', price: 5000 }
    end

    before do
      http_request
    end

    context 'when request is valid' do
      let(:user_id) { create(:user).id }

      it 'responds with 201 status' do
        expect(http_request).to have_http_status(:created)
      end

      it 'when create the response.body valid user' do
        expect(JSON.parse(response.body)['user_id']).to eq(valid_attributes[:user_id])
      end

      it 'when create the response.body valid author' do
        expect(JSON.parse(response.body)['author']).to eq(valid_attributes[:author])
      end

      it 'when create the response.body valid title' do
        expect(JSON.parse(response.body)['title']).to eq(valid_attributes[:title])
      end

      it 'when create the response.body valid link' do
        expect(JSON.parse(response.body)['link']).to eq(valid_attributes[:link])
      end

      it 'when create the response.body valid publisher' do
        expect(JSON.parse(response.body)['publisher']).to eq(valid_attributes[:publisher])
      end
      it 'when create the response.body valid year' do
        expect(JSON.parse(response.body)['year']).to eq(valid_attributes[:year])
      end

      it 'creates a new book suggestions' do
        expect do
          post :create, params: valid_attributes
        end.to change { BookSuggestion.count }.by(1)
      end
    end

    context 'when request is invalid' do
      let(:user_id) { nil }

      it 'returns error messages' do
        expect(http_request.body['error']).to be_present
      end

      it 'responds with 422 status' do
        expect(http_request).to have_http_status(:unprocessable_entity)
      end

      it 'Do not creates a new book suggestions' do
        expect do
          post :create, params: valid_attributes
        end.to change { BookSuggestion.count }.by(0)
      end
    end
  end
end
