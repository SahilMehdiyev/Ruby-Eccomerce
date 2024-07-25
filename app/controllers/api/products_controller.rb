module Api

  class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:index,:show, :create, :update, :destroy]
 
    before_action :set_product, only: [:show, :update, :destroy] # sadece bu parametrlerden evvel calisabilersen. 
    after_action :after_action_method, only: [:create]

    def index
      @products = Product.order(created_at: :asc)
      render json: @products
    end

    def create 
      #@product = Product.create(params[:name,:quantity, :description, :product_image])
      @product = Product.create(product_params)
      @product.save
      render json: @product
    end

    def show
      # @product = Product.find(params[:id])

      image_url = url_for(@product.product_image)
      render json: {"image":image_url, "data": @product}
    end
    

    def update
      # @product = Product.find(params[:id])
      @product.update(product_params)
      render json: @product
    end 

    def destroy
      # @product = Product.find(params[:id])
      @product.destroy
      render json: 'Urun silindi..!'
    end


    # butun methodlardan qabaq bu method calisacaq. Artiq Product modelinin id'ye gore cekilmeyini her method ucun yazmaya ehtiyac yoxdur. 
    def set_product
      @product = Product.find(params[:id])
      print 'set product before-action method calisdi. '
      byebug
    end

    def after_action_method
      print 'after method calisdi. '
      byebug
    end

    
    def product_params
      params.permit(:name, :description, :quantity, :price, :product_image)
    end


  end
end
