class ComboItem < ApplicationRecord
  belongs_to :combo, class_name: "Combo::Record"
  belongs_to :product, class_name: "::Product"
end
