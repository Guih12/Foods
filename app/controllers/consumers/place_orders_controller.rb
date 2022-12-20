module Consumers
  class PlaceOrdersController < ApplicationController
    before_action :authenticate_user!

    def create
      if !create_place_order.errors.present?
        render json: create_place_order, status: 201
      else
        render json: create_place_order, status: 422
      end
    end

    private

    def create_place_order
      PlaceOrder::Create.new(attributes, PlaceOrder::Repository).persist
    end

    def attributes
      place_order_attributes.merge!(user_id: current_user.id)
    end

    def place_order_attributes
      params.require(:place_order).permit(:restaurant_id, place_order_combo_items_attributes: [:combo_id],
                                                          place_order_product_items_attributes: [:product_id])
    end
  end
end
