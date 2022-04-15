require 'rails_helper'

RSpec.describe 'Consumer/PlaceOrders' do
  let(:user) { create(:user, type_user: 1) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:restaurant) { create(:restaurant) }
  let(:product) { create(:product) }
  let(:combo) { create(:combo) }

  context 'when user is logged' do
    describe 'POST /consumers/place_orders' do
      before(:each) { post '/consumers/place_orders', params: params_attributes, headers: auth_headers }

      context 'when valid params' do
        let(:params_attributes) do
          {
            place_order: {
              restaurant_id: restaurant.id,
              place_order_combo_items_attributes: [ {combo_id: combo.id} ],
              place_order_product_items_attributes: [ {product_id: product.id} ]
            }
          }
        end
        it 'return status code 201' do
          expect(response).to have_http_status(201)
        end
      end

      context 'when invalid params' do
        let(:params_attributes) do
          {
            place_order: {
              restaurant_id: nil
            }
          }
        end

        it 'return status code 422' do
          expect(response).to have_http_status(422)
        end
      end
    end
  end
end
