class Size < ApplicationRecord
  has_many :category_size
  has_many :categories, through: :category_size
end
