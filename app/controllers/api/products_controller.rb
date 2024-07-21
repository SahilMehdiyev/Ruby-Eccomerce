module Api

  class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:index,:show, :create, :update, :destroy]

    def index
      @products = Product.order(created_at: :asc)
      render json: @products
    end

    def create 
      @product = Product.create(product_params)
      @product.save
      render json: @product
    end

    def show
      @product = Product.find(params[:id])
      image = rails_blob_url = (@product.product_image)
      render json: {"image":image, "data": @product}
    end
    



    def update
      @product = Product.find(params[:id])
      @product.update(product_params)
      render json: @product
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      render json: 'Urun silindi..!'
    end

    def product_params
      params.permit(:name, :description, :quantity, :price, :product_image)
    end


  end
end
