module Restaurant
  module Repository
    def self.create(name:, number_phone: , user_id:)
      restaurant = Record.new(name: name, number_phone: number_phone, user_id: user_id)

      return restaurant if restaurant.save

      restaurant.errors
    end
  end
end