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


  private
    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
