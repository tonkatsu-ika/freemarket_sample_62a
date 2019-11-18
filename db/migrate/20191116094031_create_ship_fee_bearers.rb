class CreateShipFeeBearers < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_fee_bearers do |t|
      t.string :ship_fee_bearer, null: false, unique: true

      t.timestamps
    end
  end
end
