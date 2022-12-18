module Combo
  class Record < ApplicationRecord
    self.table_name = 'combos'
    has_many :combo_items, class_name: 'Combo::Item::Record', foreign_key: 'combo_id'
    has_many :products, through: :combo_items, class_name: 'Product'
    belongs_to :restaurant, class_name: 'Restaurant::Record', foreign_key: 'restaurant_id'

    validates_presence_of :name, :description, presence: true
  end
end
