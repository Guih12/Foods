class Restaurant < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :number_phone
end
