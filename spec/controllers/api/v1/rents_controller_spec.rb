require 'rails_helper'

describe Api::V1::RentsController, type: :controller do
  include_context 'with Authenticated User'

  describe 'GET #index' do
    context 'when fetching all the rents' do
      let(:rents) { create_list(:rent, 3, start_date: Time.zone.today, end_date: Date.tomorrow) }

      before do
        get :index
      end

      it 'reponses with rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          rents, each_serializer: RentSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    context 'when the request is valid' do
      let(:book) { create(:book) }
      let(:rent) { FactoryBot.build(:rent) }
      let(:valid_attributes) { { book_id: book.id, user_id: user.id, start_date: '2019-10-07', end_date: '2019-10-08' } }

      before do
        post :create, params: valid_attributes
      end

      it 'responses with the rent json' do
        expect(response.body.to_json) =~ RentSerializer.new(
          rent, root: false
        ).to_json
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'when create the rent' do
        rent = Rent.last
        expect(rent.book_id).to eq(valid_attributes[:book_id])
        expect(rent.user_id).to  eq(valid_attributes[:user_id])
        expect(rent.start_date) =~ (valid_attributes[:start_date])
        expect(rent.end_date) =~ (valid_attributes[:end_date])
      end
    end

    # context "with invalid params" do
    #   let(:book) { create(:book) }
    #   #let(:invalid_attributes) { { book_id: book.id, user_id: user.id, start_date: '2019-10-07', end_date: '2019-10-08' } }
    #   #let(:invalid_attributes) { { book_id: book.id, user_id: user.id, start_date: '2019-10-07', end_date: '2019-10-07' } }

    #   before(:each) do
    #     post :create, params: { book_id: book.id, user_id: user.id, start_date: '2019-10-07'}
    #   end

    #   it 'returns status code 422' do
    #     expect(response).to have_http_status(422)
    #   end

    #   it 'returns a validation failure message' do
    #     expect(response.body)
    #       .to match(/Validation failed: End date can't be blank/)
    #   end
    # end
  end
end
