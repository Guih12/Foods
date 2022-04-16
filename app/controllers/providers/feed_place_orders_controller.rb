module Providers
  class FeedPlaceOrdersController < ApplicationController
    before_action :authenticate_user!


    def index
      render json: 'ok', status: 200
    end

    def show
      render json: 'ok', status: 200
    end


    private

    def collection
      @collection ||= place_orders.by_doing
    end

    def place_orders
      @place_order ||= ::PlaceOrder.where(restaurant_id: current_user.restaurant.id)
    end

    def feed_place_order
      @place_order ||= ::PlaceOrder.find(params[:id])
    end
  end
end