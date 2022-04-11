class RestaurantsController < ApplicationController
  before_action :authenticate_user!


  def index
    render json: {ok: 'ok'}, status: 200
  end

  def show
    render json: {ok: 'ok'}, status: 200
  end


  def create
    restaurant = Restaurants::Create.new(restaurant_attributes).persist
    if !restaurant.errors.present?
      render json: restaurant, status: 201
    else
      render json: restaurant, status: 422
    end
  end


  private

  def restaurant_attributes
    params.require(:restaurant).permit(:name, :number_phone, :user_id)
  end
end