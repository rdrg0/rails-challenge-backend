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
      if params[:q].present?
        queries = params[:q].split(' ')
        partials = queries.map do |q|
          Product.where('product.name LIKE :q', q: "%#{q}%").or(
            Product.where(category: Category.where('category.name LIKE :q', q: "%#{q}%")))
            .limit(limit).offset(params[:offset])
        end
        
        @products = partials.reduce(:or)
      else
        @products = Product.limit(limit).offset(params[:offset])
      end
    end
end
