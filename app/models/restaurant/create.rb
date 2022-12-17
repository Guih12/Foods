module Restaurant
  class Create
    def initialize(restaurant_attributes, repository)
      @restaurant_attributes = restaurant_attributes
      @repository = repository
    end

    def persist
      repository.create(
        name: restaurant_attributes[:name],
        number_phone: restaurant_attributes[:number_phone],
        user_id: restaurant_attributes[:user_id]
      )
    end

    private

    attr_reader :restaurant_attributes, :repository
  end
end
