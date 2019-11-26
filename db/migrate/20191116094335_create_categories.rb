class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_name, null: false, index: true

      # parent_id はnullableで良い
      t.integer :parent_id

      t.timestamps
    end
  end
end
