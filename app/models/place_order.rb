class PlaceOrder < ApplicationRecord
  validates_presence_of :name_user, :cpf_user, presence: true
end
