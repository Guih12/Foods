require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let(:auth_headers) { user.create_new_auth_token }

  context 'when user logged' do
    describe 'GET /users' do
      before(:each) { get '/users', headers: auth_headers }

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /users/:id' do
      before(:each) { get "/users/#{user.id}", headers: auth_headers }

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
