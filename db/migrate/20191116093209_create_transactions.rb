class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :buyer
      t.references :seller
      t.bigint :item, foreign_key: true
      t.references :grade_by_buyer
      t.string :comment_by_buyer
      t.references :grade_by_seller
      t.string :comment_by_seller
      t.integer :transaction_status, null: false
      t.references :payment_method 

      t.timestamps
    end
    add_foreign_key :transactions, :users, column: :buyer_id
    add_foreign_key :transactions, :users, column: :seller_id
    add_foreign_key :transactions, :items, column: :item_id
    add_foreign_key :transactions, :grades, column: :grade_by_buyer_id
    add_foreign_key :transactions, :grades, column: :grade_by_seller_id
    add_foreign_key :transactions, :payment_methods, column: :payment_method_id
  end
end
