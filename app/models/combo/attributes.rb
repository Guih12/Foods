module Combo
  module Attributes
    extend self
    Create = -> (params) {
      {
        name: params[:name],
        description: params[:description],
        price: params[:price],
        restaurant_id: params[:restaurant_id]
      }
    }
  end
end