class Product < ApplicationRecord
  enum type_product: { snack: 'lanche', drink: 'bebidas', fries: 'fritas', others: 'outros' }
  belongs_to :combo, optional: true

  validates_presence_of :name, :description, :type_product, :price, presence: true
end
