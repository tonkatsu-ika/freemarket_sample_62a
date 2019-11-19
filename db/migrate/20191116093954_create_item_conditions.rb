class CreateItemConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :item_conditions do |t|
      t.string :item_condition, null: false, unique: true

      t.timestamps
    end
  end
end
