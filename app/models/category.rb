class Category < ApplicationRecord
  belongs_to :category_tree
  belongs_to :category_size, optional: true
  has_many :items
end
