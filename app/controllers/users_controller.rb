class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: 'a', status: 200
  end

  def show
    render json: 'a', status: 200
  end
end
