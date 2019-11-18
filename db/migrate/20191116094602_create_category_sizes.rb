class CreateCategorySizes < ActiveRecord::Migration[5.2]
  def change
    create_table :category_sizes do |t|
      t.bigint :category, foreign_key: true
      t.bigint :size, foreign_key: true

      t.timestamps
    end
  end
end
