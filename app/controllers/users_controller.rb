class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: @collection, status: 200
  end

  def show
    render json: user, status: 200
  end

  private

  def user
    User.find(params[:id])
  end

  def collection
    @collection ||= User.all
  end
end
