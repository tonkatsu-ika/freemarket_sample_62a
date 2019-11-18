class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.integer :price, null: false, index: true
      t.references :item_condition, foreign_key: true
      t.references :ship_fee_bearer, foreign_key: true
      t.references :days_before_ship, foreign_key: true
      t.references :delivery_method, foreign_key: true
      t.references :user, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
