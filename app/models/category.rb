class Category < ApplicationRecord

  # 閉包テーブルを使用(closure_tree)
  has_closure_tree

  #belongs_to :category_tree
  has_many :items
  has_many :category_sizes
  has_many :sizes, through: :category_sizes
end
