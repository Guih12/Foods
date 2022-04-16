class AddRestaurantIdToPlaceOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :place_orders, :restaurant, index: true
  end
end
