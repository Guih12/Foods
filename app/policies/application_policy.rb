# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end


  def permission?
    user.provider?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    private

    attr_reader :user, :scope
  end
end
