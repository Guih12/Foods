require 'rails_helper'

RSpec.describe 'Consumer/PlaceOrders' do
  let(:user) { create(:user, type_user: 1) }
  let(:auth_headers) { user.create_new_auth_token }

  context 'when user is logged' do
    describe 'POST /consumers/place_orders' do
      before(:each) { post '/consumers/place_orders', params: params_attributes, headers: auth_headers }

      context 'when valid params' do
        let(:params_attributes) do
          {
            place_order: {
              name_user: 'george',
              cpf_user: '00555',
              date: Time.now
            }
          }
        end
        it 'return status code 201' do
          expect(response).to have_http_status(201)
        end
      end

      context 'when invalid params' do
        let(:params_attributes) do
          {
            place_order: {
              name_user: '',
              cpf_user: '',
              date: Time.now
            }
          }
        end

        it 'return status code 422' do
          expect(response).to have_http_status(422)
        end
      end
    end
  end
end
