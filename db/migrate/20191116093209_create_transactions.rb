class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :buyer_id, foreign_key: true
      t.references :seller_id, foreign_key: true
      t.references :item_id, foreign_key: true
      t.references :grade_by_buyer, foreign_key: true
      t.string :comment_by_buyer
      t.references :grade_by_seller, foreign_key: true
      t.string :comment_by_seller
      t.integer :transaction_status, null: false
      t.references :payment_method, foreign_key: true

      t.timestamps
    end
  end
end
