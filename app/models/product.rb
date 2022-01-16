# frozen_string_literal: true

class Product < ApplicationRecord
  # Link model to database table
  self.table_name = "product"
  # Set default number of products per page
  paginates_per 5
end
