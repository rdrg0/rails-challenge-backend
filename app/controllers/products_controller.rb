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
    
    MAX_LIMIT = 50

    def limit
      [params.fetch(:limit, MAX_LIMIT).to_i, MAX_LIMIT].min
    end

    def set_products
      if params[:q]
        partial_1 = Product.where('product.name LIKE :q', q: "%#{params[:q]}%")
        partial_2 = Product.where(category: Category.where('category.name LIKE :q', q: "%#{params[:q]}%"))
        @products = partial_1.or(partial_2).limit(limit).offset(params[:offset])
      else
        @products = Product.limit(limit).offset(params[:offset])
      end
    end
end
