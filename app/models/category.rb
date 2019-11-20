class Category < ApplicationRecord

  # 閉包テーブルを使用(closure_tree)
  has_closure_tree

  #belongs_to :category_tree
  has_many :category_size
  has_many :items
end
