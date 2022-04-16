require 'rails_helper'

RSpec.describe Providers::FeedPlaceOrdersController do
  let(:user) { create(:user, type_user: 0) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:place_order) { create(:place_order) }
  let(:restaurant) { create(:restaurant) }

  context 'when user is looged' do

    before do
      user.restaurant = restaurant
      user.save
    end

    describe 'GET /providers/feed_place_orders' do
      before(:each) { get '/providers/feed_place_orders', headers: auth_headers}

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /providers/feed_place_orders/:id' do
      before(:each) { get "/providers/feed_place_orders/#{place_order.id}", headers: auth_headers }

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  context 'when user is not logged' do
    describe 'GET /providers/feed_place_orders' do
      before(:each) { get '/providers/feed_place_orders' }

      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'GET /providers/feed_place_orders/:id' do
      before(:each) { get "/providers/feed_place_orders/#{place_order.id}" }

      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end