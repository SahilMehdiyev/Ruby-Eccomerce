module Api

  class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]


    def create 
      @product = Product.create(product_params)
      @product.save
      render json: @product
    end

    def product_params
      params.permit(:name, :description, :quantity, :price)
    end


  end
end
