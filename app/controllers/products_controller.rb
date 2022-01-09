class ProductsController < ApplicationController
    

  # GET /products
  def index
    @products = Product.all
    json_response(@products)
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
    json_response(@product)
  end



 

 




  private

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :url_image, :price, :discount, :category)
    end
end
