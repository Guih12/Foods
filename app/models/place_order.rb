class PlaceOrder < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, class_name: "Restaurant::Record"

  has_many :place_order_combo_items
  has_many :place_order_product_items

  has_many :combos, through: :place_order_combo_items
  has_many :products, through: :place_order_product_items

  accepts_nested_attributes_for :place_order_combo_items, :place_order_product_items

  scope :by_doing, -> { where(status: false) }

  before_save :set_status, :set_date
  after_save :set_code

  def set_status
    self.status = false if status.nil?
  end

  def set_date
    self.data = Time.now if data.nil?
  end

  #code
  def set_code
    self.code = Base32::Crockford.encode(self.id, :split => 5, :length => 5) if self.code.nil?
  end
end
