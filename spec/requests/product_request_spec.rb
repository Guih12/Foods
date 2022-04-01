require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:products) { create_list(:product, 3) }

  context 'when user is logged' do
    describe 'GET /products' do
      before(:each) { get '/products' }

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /products/:id' do
      before(:each) { get "/products/#{products.first.id}" }

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
              price: 200
            }
          }
        end
        before(:each) { post '/products', params: product_attributes }

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
        before(:each) { put "/products/#{products.first.id}", params: product_attributes }

        it 'return status code 201' do
          expect(response).to have_http_status(201)
        end
      end
    end
  end
end
