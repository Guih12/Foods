class AddRestaurantToCombo < ActiveRecord::Migration[6.1]
  def change
    add_reference :combos, :restaurant, index: true
  end
end
