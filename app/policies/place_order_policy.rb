class PlaceOrderPolicy < ApplicationPolicy
  attr_reader :user, :place_order

  def initialize(user, place_order)
    @user = user
    @place_order = place_order
  end

  def create?
    consumer_permission?
  end
end