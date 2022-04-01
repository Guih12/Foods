module Users
  class Create
    def initialize(users_attributes)
      @users_attributes = users_attributes
    end

    def persist
      create_user
    end

    private

    attr_reader :users_attributes

    def create_user
      user = ::User.new(users_attributes)
      return user if user.save

      user.errors
    end
  end
end
