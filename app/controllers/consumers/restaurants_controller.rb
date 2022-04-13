module Consumers
  class RestaurantsController < ApplicationController
    before_action :authenticate_user!

    def index
      authorize collection
      render json: RestaurantSerializer.new(collection).serialized_json, status: 200
    end

    def show
      authorize restaurant
      render json: RestaurantSerializer.new(restaurant).serialized_json, status: 200
    end

    private

    def collection
      @collection ||= ::Restaurant.all.order(name: :desc)
    end

    def restaurant
      @restaurant ||= ::Restaurant.find(params[:id])
    end
  end
end
