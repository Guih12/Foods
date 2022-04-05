class CreatePlaceOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :place_orders do |t|
      t.string :name_user
      t.string :cpf_user
      t.date :data
      t.boolean :status
      t.float :price
      t.string :code

      t.timestamps
    end
  end
end
