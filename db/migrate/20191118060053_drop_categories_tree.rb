class DropCategoriesTree < ActiveRecord::Migration[5.2]
  def change
    drop_table :categories_trees
  end
end
