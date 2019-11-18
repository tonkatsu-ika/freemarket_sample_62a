class CategoriesTree < ApplicationRecord
  belongs_to :category_tree, optional: true
  has_many :items
end
