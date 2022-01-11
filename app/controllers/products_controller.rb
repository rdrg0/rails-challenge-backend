class ProductsController < ApplicationController
    before_action :set_products, only: :index

  # GET /products
  def index
    json_response({info:{count: @products.total_count,
                         pages: @products.total_pages,
                         prev: @products.prev_page,
                         next: @products.next_page},
                   results: @products})
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
    json_response(@product)
  end

  private    

    # def page_url(page_number)
    #   return nil unless page_number
    #   request.original_url.split("&page=#{params[:page]}").join('') + "&page=#{page_number.to_s}"
    # end

    def set_products
      if params[:q].present?
        queries = params[:q].split(' ')
        partials = queries.map do |q|
          Product.where('product.name LIKE :q', q: "%#{q}%").or(
            Product.where(category: Category.where('category.name LIKE :q', q: "%#{q}%")))            
        end
        
        @products = partials.reduce(:or).page(params[:page]).per(params[:per_page])
      else
        @products = Product.order(:name).page(params[:page]).per(params[:per_page])
      end
    end
end
