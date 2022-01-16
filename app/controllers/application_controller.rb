# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler

  def root
    json_response({
      products: request.base_url + "/products",
      categories: request.base_url + "/categories"
    })
  end
end
