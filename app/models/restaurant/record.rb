module Restaurant
  class Record < ApplicationRecord
    self.table_name = "restaurants"
    belongs_to :user
  
    validates_presence_of :name, :number_phone
  end
end