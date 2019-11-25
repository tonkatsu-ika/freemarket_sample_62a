class CreateCategorySizes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_sizes do |t|
      t.bigint :category_id
      t.bigint :size_id, foreign_key: true

      t.timestamps
    end
    add_foreign_key :category_sizes, :categories, column: :category_id
    add_foreign_key :category_sizes, :sizes, column: :size_id
  end
end
