class ProductsController < ApplicationController
  before_action :authenticate_user!
  has_scope :q

  def index
    render json: ProductSerializer.new(collection).serialized_json, status: 200
  end

  def show
    render json: product, status: 200
  end

  def create
    @new_product = Products::Create.new(attributes).persist
    if !@new_product.errors.present?
      render json: ProductSerializer.new(collection).serialized_json, status: 201
    else
      render json: @new_product, status: 422
    end
  end

  def update
    @update_product = Products::Update.new(product, product_attributes).persist
    if !@update_product.errors.present?
      render json: ProductSerializer.new(collection).serialized_json, status: 201
    else
      render json: @update_product, status: 422
    end
  end

  private

  def collection
    @collection ||= apply_scopes(products)
  end

  def products
    @products ||= ::Product.where(restaurant_id: current_user.restaurant.id)
  end

  def product
    @product ||= Product.find(params[:id])
  end

  def attributes
    product_attributes.merge!(restaurant_id: current_user.restaurant.id)
  end

  def product_attributes
    params.require(:product).permit(:name, :description, :type_product, :price)
  end
end
