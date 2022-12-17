class CombosController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: ComboSerializer.new(collection).serialized_json, status: 200
  end

  def show
    render json: ComboSerializer.new(combo).serialized_json, status: 200
  end

  def create
    if !create_combo.errors.present?
      render json: ComboSerializer.new(create_combo).serialized_json, status: 201
    else
      render json: create_combo, status: 422
    end
  end

  def update
    if !update_combo.errors.present?
      render json: ComboSerializer.new(update_combo).serialized_json, status: 201
    else
      render json: update_combo, status: 422
    end
  end

  private

  def create_combo
    @create_combo = Combo::Create.new(attributes, Combo::Repository).persist
  end

  def update_combo
    @update_combo = Combo::Update
                          .new(combo_id: combo.id, combo_attributes: combos_attributes, repository: Combo::Repository)
                          .persist
  end

  def collection
    @collection ||= Combo::Record.all
  end

  def combo
    @combo ||= Combo::Repository(combo_id: params[:id])
  end

  def attributes
    combos_attributes.merge!(restaurant_id: current_user.restaurant.id)
  end

  def combos_attributes
    params.require(:combo).permit(:id, :name, :description, :price, combo_items_attributes: [:product_id])
  end
end
