class Product < ApplicationRecord
  validates_presence_of :name, :description, :type_product, :price, presence: true
end
