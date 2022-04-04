require 'rails_helper'

RSpec.describe 'Combos', type: :request do
  let(:user) { create(:user) }
  let(:combo) { create(:combo) }
  let(:product) { create(:product) }
  let(:auth_headers) { user.create_new_auth_token }

  context 'when user is logged' do
    describe 'GET /combos' do
      before(:each) { get '/combos', headers: auth_headers }
      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /combos/:id' do
      before(:each) { get "/combos/#{combo.id}", headers: auth_headers }

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST /combos' do
      let(:params_attributes) do
        {
          "combo": {
            "name": combo.name,
            "description": combo.description,
            "price": combo.price,
            "combo_items_attributes": [{ "product_id": product.id }]
          }
        }
      end

      before(:each) { post '/combos', params: params_attributes, headers: auth_headers }

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    describe 'PUT /combos:id' do
      let(:params_attributes) do
        {
          "combo": {
            "name": combo.name,
            "description": combo.description,
            "price": combo.price,
            "combo_items_attributes": [{ "product_id": product.id }]
          }
        }
      end

      before(:each) { put "/combos/#{combo.id}", params: params_attributes, headers: auth_headers }

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  context 'when user is not logged' do
    describe 'GET /combos' do
      before(:each) { get '/combos' }
      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'GET /combos/:id' do
      before(:each) { get "/combos/#{combo.id}" }

      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'POST /combos' do
      let(:params_attributes) do
        {
          "combo": {
            "name": combo.name,
            "description": combo.description,
            "price": combo.price,
            "combo_items_attributes": [{ "product_id": product.id }]
          }
        }
      end

      before(:each) { post '/combos', params: params_attributes }

      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'PUT /combos:id' do
      let(:params_attributes) do
        {
          "combo": {
            "name": combo.name,
            "description": combo.description,
            "price": combo.price,
            "combo_items_attributes": [{ "product_id": product.id }]
          }
        }
      end

      before(:each) { put "/combos/#{combo.id}", params: params_attributes }

      it 'return status code 201' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
