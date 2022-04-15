class AddUserIdToPlaceOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :place_orders, :user, index: true
  end
end
