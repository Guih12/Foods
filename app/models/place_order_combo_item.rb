class PlaceOrderComboItem < ApplicationRecord
  belongs_to :place_order
  belongs_to :combo, class_name: "Combo::Record"
end
