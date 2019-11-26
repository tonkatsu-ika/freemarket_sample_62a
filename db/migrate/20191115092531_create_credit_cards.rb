class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :user_id
      t.string :customer_id
      t.string :card_id
      t.references :user ,foreign_key: true
      t.integer :number, null: false
      t.date :expiration_month, null: false
      t.date :expiration_year, null: false
      t.integer :security_code, null: false
      t.boolean :main_card_flag, null: false
      t.timestamps
    end
  end
end
