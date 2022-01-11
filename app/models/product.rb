# frozen_string_literal: true

class Product < ApplicationRecord
  self.table_name = "product"
  paginates_per 5
end
