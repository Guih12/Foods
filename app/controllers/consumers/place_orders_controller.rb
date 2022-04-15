module Consumers
  class PlaceOrdersController < ApplicationController
    before_action :authenticate_user!

    def create
      authorize PlaceOrder
      if !create_place_order.errors.present?
        render json: create_place_order, status: 201
      else
        render json: create_place_order, status: 422
      end
    end

    private

    def create_place_order
      PlaceOrders::Create.new(place_order_attributes).persist
    end

    def place_order_attributes
      params.require(:place_order).permit(:name_user, :cpf_user, :data,
                                          place_order_combo_items_attributes: [:combo_id],
                                          place_order_product_items_attributes: [:product_id])
    end
  end
end
