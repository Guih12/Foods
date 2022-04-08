class PlaceOrderComboItem < ApplicationRecord
  belongs_to :place_order
  belongs_to :combo
end
