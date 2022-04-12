class ProductPolicy < ApplicationPolicy
  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
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