class RemoveUserUserToPlaceOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :place_orders, :name_user
  end
end
