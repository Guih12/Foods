class RemoveCpfUserToPlaceOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :place_orders, :cpf_user
  end
end
