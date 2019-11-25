class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.integer :price, null: false, index: true
      t.bigint :item_condition_id
      t.bigint :ship_fee_bearer_id
      t.bigint :prefecture
      t.bigint :days_before_ship_id
      t.bigint :delivery_method_id
      t.bigint :user_id
      t.bigint :brand_id
      t.bigint :category_id
      t.bigint :size_id

      t.timestamps
    end
    add_foreign_key :items, :item_conditions, column: :item_condition_id
    add_foreign_key :items, :ship_fee_bearers, column: :ship_fee_bearer_id
    add_foreign_key :items, :days_before_ships, column: :days_before_ship_id
    add_foreign_key :items, :delivery_methods, column: :delivery_method_id
    add_foreign_key :items, :users, column: :user_id
    add_foreign_key :items, :brands, column: :brand_id
    add_foreign_key :items, :categories, column: :category_id
    add_foreign_key :items, :sizes, column: :size_id
  end
end
