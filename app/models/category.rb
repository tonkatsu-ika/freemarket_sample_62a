class Category < ApplicationRecord

  # 閉包テーブルを使用(closure_tree)
  has_closure_tree

  #belongs_to :category_tree
  belongs_to :category_size, optional: true
  has_many :items
end
