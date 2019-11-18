class CategorySize < ApplicationRecord
  belongs_to :category
  belongs_to :size, dependent: :destroy
end
