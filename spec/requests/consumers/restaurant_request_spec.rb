require 'rails_helper'

RSpec.describe 'Consumer/restaurants' do
  let(:user) { create(:user, type_user: 1) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:restaurant) { create(:restaurant) }

  context 'when user logged' do
    describe 'GET /consumers/restaurants' do
      before(:each) { get '/consumers/restaurants', headers: auth_headers }
      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /consumers/restaurants/:id' do
      before(:each) { get "/consumers/restaurants/#{restaurant.id}", headers: auth_headers }
      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return one restaurant' do
        expect(JSON.parse(response.body).count).to eq 1
      end
    end
  end

  context 'when user is not logged' do
    describe 'GET /consumers/restaurants' do
      before(:each) { get '/consumers/restaurants' }
      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'GET /consumers/restaurants/:id' do
      before(:each) { get '/consumers/restaurants' }
      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
