require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:products) { create_list(:product, 3) }
  let(:user) { create(:user, type_user: 0) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:restaurant) { create(:restaurant) }

   before do
    user.restaurant = restaurant
    user.save
  end


  context 'when user is logged' do
    describe 'GET /products' do
      before(:each) { get '/products', headers: auth_headers }

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /products/:id' do
      before(:each) { get "/products/#{products.first.id}", headers: auth_headers }

      it 'return status code 2000' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST /project ' do
      context 'when the request is valid' do
        let(:product_attributes) do
          {
            product: {
              name: 'hamburguer',
              description: 'humburguer legal',
              type_product: :snack,
              price: 200,
              restaurant_id: restaurant.id
            }
          }
        end
        before(:each) { post '/products', params: product_attributes, headers: auth_headers }

        it 'return status code 201' do
          expect(response).to have_http_status(201)
        end
      end
    end

    describe 'PUT /project/:id' do
      context 'when the request is valid' do
        let(:product_attributes) do
          {
            product: {
              name: 'hamburguer',
              description: 'humburguer legal',
              type_product: :snack,
              price: 200
            }
          }
        end
        before(:each) { put "/products/#{products.first.id}", params: product_attributes, headers: auth_headers }

        it 'return status code 201' do
          expect(response).to have_http_status(201)
        end
      end
    end

    describe 'GET /product?q' do
      let(:products_list) { create(:product, name: "product") }
      before(:each) { get "/products?q=#{products_list.name}", headers: auth_headers }


      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end

    end
  end 

  context 'when user is not logged' do
    describe 'GET /products' do
      before(:each) { get '/products' }

      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'GET /products/:id' do
      before(:each) { get '/products/1' }

      it 'return status code 401' do
        expect(response).to have_http_status(401)
      end
    end

    describe 'POST /products' do
      context 'when the request is valid' do
        let(:product_attributes) do
          {
            product: {
              name: 'hamburguer',
              description: 'humburguer legal',
              type_product: :snack,
              price: 200
            }
          }
        end
        before(:each) { post '/products', params: product_attributes }

        it 'return status code 401' do
          expect(response).to have_http_status(401)
        end
      end
    end

    describe 'POST /products' do
      context 'when the request is valid' do
        let(:product_attributes) do
          {
            product: {
              name: 'hamburguer',
              description: 'humburguer legal',
              type_product: :snack,
              price: 200
            }
          }
        end
        before(:each) { put '/products/1', params: product_attributes }

        it 'return status code 401' do
          expect(response).to have_http_status(401)
        end
      end
    end
  end
end
