require 'rails_helper'

describe Api::V1::BookSuggestionsController do

  describe 'POST #create' do
    subject(:http_request) { post :create, params: valid_attributes }

    let(:valid_attributes) do
      { user_id: user_id, synopsis: 'test_synopsis', author: 'test_author', title: 'test_title',
      link: 'test_link', publisher: 'test_publisher', year: '1987', price: 5000 
       }
    end

    before do
      http_request
    end

    context 'when request is valid' do
      let(:user_id) { create(:user).id }

      it 'responds with 201 status' do
        expect(http_request).to have_http_status(:created)
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
    end
  end
end
