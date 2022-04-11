class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: RestaurantSerializer.new(collection).serialized_json, status: 200
  end

  def show
    render json: RestaurantSerializer.new(restaurant).serialized_json, status: 200
  end

  def create
    restaurant = Restaurants::Create.new(restaurant_attributes).persist
    if !restaurant.errors.present?
      render json: RestaurantSerializer.new(restaurant).serialized_json, status: 201
    else
      render json: restaurant, status: 422
    end
  end

  private

  def collection
    @collection ||= apply_scopes(::Restaurant).where(user_id: 2)
  end

  def restaurant
    @restaurant ||= ::Restaurant.find(params[:id])
  end

  def restaurant_attributes
    params.require(:restaurant).permit(:name, :number_phone, :user_id)
  end
end
