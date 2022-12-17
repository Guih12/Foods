class Combo < ApplicationRecord
  has_many :combo_items
  has_many :products, through: :combo_items
  belongs_to :restaurant, class_name: "Restaurant::Record"

  validates_presence_of :name, :description, presence: true
  accepts_nested_attributes_for :combo_items, allow_destroy: true
end
