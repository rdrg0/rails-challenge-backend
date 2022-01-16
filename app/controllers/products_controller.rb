# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_products, only: :index

  # GET /products
  def index
    json_response({ info: { count: @products.total_count,
                            pages: @products.total_pages,
                            prev: page_url(@products.prev_page),
                            next: page_url(@products.next_page) },
                    results: @products })
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
    json_response(@product)
  end

  private
    # Returns the url of the arguments page number for the current query and per_page params.
    def page_url(page_number)
      return nil unless page_number

      request.base_url + request.path + "?q=#{params[:q]}&page=#{page_number}&per_page=#{params[:per_page]}"
    end

    # Returns all products or the products that match the query if there is one.
    def set_products
      if params[:q].present?
        @products = search_results
      else
        @products = Product.page(params[:page]).per(params[:per_page])
      end
    end

    # Parses the user query, takes every word and retrieves the products with a matching name or category.
    def search_results
      queries = params[:q].split(" ")
      partials = queries.map do |q|
        Product.where("product.name LIKE :q", q: "%#{q}%").or(
          Product.where(category: Category.where("category.name LIKE :q", q: "%#{q}%"))
        )
      end
      partials.reduce(:or).page(params[:page]).per(params[:per_page])
    end
end
