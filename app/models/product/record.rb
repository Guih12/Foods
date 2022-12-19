module Product
  class Record < ApplicationRecord
    self.table_name = "products"
    enum type_product: { snack: 'lanche', drink: 'bebidas', fries: 'fritas', others: 'outros' }
    belongs_to :combo, optional: true, class_name: "Combo::Record"
    belongs_to :restaurant, class_name: "Restaurant::Record"
  
    validates_presence_of :name, :description, :type_product, :price, presence: true
  
    scope :q, -> (params) { where(Record.arel_table[:name].matches("%#{params}%"))}
  end
end