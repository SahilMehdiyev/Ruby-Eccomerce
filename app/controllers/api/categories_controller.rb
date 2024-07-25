module Api
  class CategoriesController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:index,:show, :create, :update, :destroy]
    
    def index
      @categories = Category.all
      if !@categories.blank?
        render json: @categories, status: :ok
      else
        render json: @categories, status: :bad_request
      end
    end

    def show
      category = set_category
      if !category.blank?
        render json: @category, status: :ok
      else
        render json: 'Kategoriya qeyde alinmadi. ', status: :bad_request
      end
    end

    def create
      @category = Category.create(params_category)
      byebug
      if @category.save
        render json:@category, status: :ok
      else
        render json:@category, status: :bad_request
      end
    end
    

    def update
      category = set_category
      if category.update(params_category)
        render json: category, status: :ok
      else
        render json: category, status: :bad_request
      end
    end  


    def destroy
      category = set_category
      if category.destroy
        render json: 'Kategoriya silindi.. ', status: :ok
      else
        render json: 'Kategoriya silinmedi..!', status: :bad_request
      end
    end



    #We define such a method because we do not use it everywhere.
    def set_category
      @category = Category.find(params[:id])       
    end

    #gelen datalara icaze ver
    def params_category
      params.permit(:name)
    #categorinin name parametresi oldugu ucun. 
    end







  end
end  
