module Restaurants
  class Create
    def initialize(restaurant_attributes)
      @restaurant_attributes = restaurant_attributes
    end

    def persist
      restaurant = ::Restaurant.new(restaurant_attributes)
      return restaurant if restaurant.save

      restaurant.errors
    end

    private

    attr_reader :restaurant_attributes
  end
end