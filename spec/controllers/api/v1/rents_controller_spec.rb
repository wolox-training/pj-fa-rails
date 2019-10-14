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
end
