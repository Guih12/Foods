class PlaceOrder < ApplicationRecord
  has_many :place_order_combo_items
  has_many :place_order_product_items

  has_many :combos, through: :place_order_combo_items
  has_many :products, through: :place_order_product_items

  validates_presence_of :name_user, :cpf_user, presence: true

  accepts_nested_attributes_for :place_order_combo_items, :place_order_product_items
end
