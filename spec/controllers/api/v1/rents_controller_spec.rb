require 'rails_helper'

describe Api::V1::RentsController do
  include_context 'with Authenticated User'

  describe 'GET #index' do
    subject(:http_request) { get :index, params: { user_id: user.id } }

    context 'when fetching all the rents' do
      let(:book) { create(:book) }
      let(:rents) { create_list(:rent, 3, user_id: user.id, book_id: book.id, start_date: Time.zone.today, end_date: Date.tomorrow) }

      it 'reponses with rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          rents, each_serializer: RentSerializer
        ).to_json
        expect(http_request.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(http_request).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    subject(:http_request) { post :create, params: { user_id: user.id, book_id: book_id, start_date: '2019-10-07', end_date: '2019-10-08' } }

    context 'when request is valid' do
      let(:book_id) { create(:book).id }
      let(:rent) { create(:rent, user_id: user.id, book_id: book_id, start_date: '2019-10-07', end_date: '2019-10-08') }
      let(:valid_attributes) { { user_id: user.id, book_id: book_id, start_date: '2019-10-07', end_date: '2019-10-08' } }

      it 'responses with the rent json' do
        expect(http_request.body.to_json) =~ RentSerializer.new(
          rent, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(http_request).to have_http_status(:ok)
      end

      it 'when create the rent valid book' do
        expect(rent.book_id).to eq(valid_attributes[:book_id])
      end

      it 'when create the rent valid user' do
        expect(rent.user_id).to eq(valid_attributes[:user_id])
      end

      it 'when create the rent valid start date' do
        expect(rent.start_date) =~ valid_attributes[:start_date]
      end

      it 'when create the rent valid end date' do
        expect(rent.end_date) =~ valid_attributes[:end_date]
      end
    end

    context 'when request is invalid' do
      let(:book_id) { nil }

      it 'returns error messages' do
        expect(http_request.body['error']).to be_present
      end

      it 'responds with 422 status' do
        expect(http_request).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
