class CreateDaysBeforeShips < ActiveRecord::Migration[5.2]
  def change
    create_table :days_before_ships do |t|
      t.string :days_before_ship, null: false, unique: true

      t.timestamps
    end
  end
end
