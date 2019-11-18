class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.integer :price, null: false, index: true
      t.bigint :item_condition, foreign_key: true
      t.bigint :ship_fee_bearer, foreign_key: true
      t.bigint :days_before_ship, foreign_key: true
      t.bigint :delivery_method, foreign_key: true
      t.bigint :user, foreign_key: true
      t.bigint :brand, foreign_key: true
      t.bigint :category, foreign_key: true

      t.timestamps
    end
  end
end
