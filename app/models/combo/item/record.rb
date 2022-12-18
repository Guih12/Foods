module Combo
  module Item
    class Record < ApplicationRecord
      self.table_name = "combo_items"
      belongs_to :combo, class_name: 'Combo::Record'
      belongs_to :product, class_name: '::Product'
    end    
  end
end