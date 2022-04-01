module Users
  class Update
    def initialize(user, user_attributes)
      @user = user
      @user_attributes = user_attributes
    end

    def persist
      return user if user.update(user_attributes)

      user.errors
    end

    private

    attr_reader :user, :user_attributes
  end
end
