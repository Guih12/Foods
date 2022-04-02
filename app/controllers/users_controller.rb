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
    Users.find(params[:id])
  end

  def collection
    @collection ||= Users.all
  end
end
