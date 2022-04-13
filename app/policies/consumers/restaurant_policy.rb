module Consumers
  class RestaurantPolicy < ApplicationPolicy
    attr_reader :user, :restaurant

    def initialize(user, restaurant)
      @user = user
      @restaurant = restaurant
    end

    def index?
      consumer_permission?
    end

    def show?
      consumer_permission?
    end
  end
end