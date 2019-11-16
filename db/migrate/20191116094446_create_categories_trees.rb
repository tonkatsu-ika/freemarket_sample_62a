class CreateCategoriesTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_trees do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false

      t.timestamps
    end
  end
end
