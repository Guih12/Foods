class CombosController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: :ok, status: 200
  end

  def show
    render json: :ok, status: 200
  end

  def create
    if !create_combo.errors.present?
      render json: create_combo, status: 201
    else
      render json: create_combo, status: 422
    end
  end

  private

  def create_combo
    @create_combo = Combos::Create.new(combos_attributes).persist
  end

  def combos_attributes
    params.require(:combo).permit(:id, :name, :description, :price, combo_items_attributes: [:product_id])
  end
end
