class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :brand_name, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
