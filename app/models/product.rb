class Product < ApplicationRecord

  enum type_product: { snack: "lanche", drink: "bebidas", fries: "fritas", others: "outros" }
  validates_presence_of :name, :description, :type_product, :price, presence: true
end
