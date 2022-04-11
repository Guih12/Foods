require 'rails_helper'

RSpec.describe 'Restaurants', type: :request do
  let(:restaurant) { create(:restaurant) }
  let(:user) { create(:user, email: "george@gmail.com") }
  let(:auth_headers) { user.create_new_auth_token }

  context 'when user is logged' do
    describe 'GET /restaurants' do
      before(:each) { get "/restaurants", headers: auth_headers }

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /restaurants/:id' do
      before(:each) { get "/restaurants/#{restaurant.id}", headers: auth_headers }
      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST /restaurants' do
      before(:each) { post "/restaurants", params: params, headers: auth_headers }
      context 'when valid params' do
        let(:params) do
          {
            restaurant:{
              name: restaurant.name,
              number_phone: restaurant.number_phone,
              user_id: user.id
            }
          }
        end
        it 'return status code 201' do
          expect(response).to have_http_status(201)
        end
      end

      context 'when invalid params' do
        let(:params) do
          {
            restaurant:{
              name: nil,
              number_phone: nil,
              user_id: user.id
            }
          }
        end
        it 'return status code 422' do
          expect(response).to have_http_status(422)
        end
      end
    end

    describe 'PUT /restaurants/:id' do
      before(:each) { get "/restaurants" }
    end
  end


  context 'when user not logged' do
    describe 'GET /restaurants' do
      before(:each) { get "/restaurants" }

      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'GET /restaurants/:id' do
      before(:each) { get "/restaurants" }
      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'POST /restaurants' do
      before(:each) { get "/restaurants" }
      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'PUT /restaurants/:id' do
      before(:each) { get "/restaurants" }
      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end