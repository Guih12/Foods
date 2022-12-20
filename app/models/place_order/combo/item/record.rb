module PlaceOrder
  module Combo
    module Item
      class Record < ApplicationRecord
        self.table_name = "place_order_combo_items"
        belongs_to :place_order, class_name: "PlaceOrder::Record" 
        belongs_to :combo, class_name: "::Combo::Record"
      end      
    end
  end
end