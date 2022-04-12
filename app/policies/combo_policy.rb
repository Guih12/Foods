class ComboPolicy < ApplicationPolicy
  attr_reader :user, :combo

  def initialize(user, combo)
    @user = user
    @combo = combo
  end

  def index?
    permission?
  end

  def show?
    permission?
  end

  def create?
    permission?
  end

  def update?
    permission?
  end
end