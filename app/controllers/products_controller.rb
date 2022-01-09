class ProductsController < ApplicationController
    before_action :set_products, only: :index

  # GET /products
  def index    
    json_response(@products)    
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
    json_response(@product)
  end

  private    
    def set_products
      if params[:q]      
        partial_1 = Product.where('product.name LIKE :q', q: "%#{params[:q]}%")
        partial_2 = Product.where(category: Category.where('category.name LIKE :q', q: "%#{params[:q]}%"))      
        @products = partial_1.or(partial_2)
      else
        @products = Product.limit(30).offset(0)
      end
    end
end
