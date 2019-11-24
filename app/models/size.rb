class Size < ApplicationRecord
  has_many :items
  has_many :categories, through: :category_users
  has_many :category_sizes
end
