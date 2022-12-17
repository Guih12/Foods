module Consumers
  class RestaurantsController < ApplicationController
    before_action :authenticate_user!

    def index
      render json: RestaurantSerializer.new(collection).serialized_json, status: 200
    end

    def show
      render json: RestaurantSerializer.new(restaurant).serialized_json, status: 200
    end

    private

    def collection
      @collection ||= ::Restaurant::Record.all.order(name: :desc)
    end

    def restaurant
      @restaurant ||= ::Restaurant::Record.find(params[:id])
    end
  end
end
