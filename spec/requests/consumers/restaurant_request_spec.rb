require 'rails_helper'

RSpec.describe 'Consumer/restaurants' do
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }

  context 'when user logged' do
    describe 'GET /consumers/restaurants' do
      before(:each) { get '/consumers/restaurants', headers: auth_headers }
      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /consumers/restaurants/:id' do
      before(:each) { get '/consumers/restaurants/2', headers: auth_headers }
      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  context 'when user is not logged' do
    describe 'GET /consumers/restaurants' do
      before(:each) { get '/consumers/restaurants'}
      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'GET /consumers/restaurants/:id' do
      before(:each) { get '/consumers/restaurants'}
      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end