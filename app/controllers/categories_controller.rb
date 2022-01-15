# frozen_string_literal: true

class CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.all
    json_response(@categories)
  end

  def show
    @products = Product.where(category: params[:id]) 
    json_response(@products)
  end
 
    
end
