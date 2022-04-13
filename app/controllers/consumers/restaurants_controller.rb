module Consumers
  class RestaurantsController < ApplicationController
    before_action :authenticate_user!

    def index
      render json: 'ola', status: 200
    end

    def show
      render json: 'ola'
    end
  end
end