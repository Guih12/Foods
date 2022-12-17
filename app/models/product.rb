class Product < ApplicationRecord
  enum type_product: { snack: 'lanche', drink: 'bebidas', fries: 'fritas', others: 'outros' }
  belongs_to :combo, optional: true
  belongs_to :restaurant, class_name: "Restaurant::Record"

  validates_presence_of :name, :description, :type_product, :price, presence: true

  scope :q, -> (params) { where(Product.arel_table[:name].matches("%#{params}%"))}
end
