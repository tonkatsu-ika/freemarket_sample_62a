class CreatePaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_methods do |t|
      t.string :method_name, null: false, unique: true

      t.timestamps
    end
  end
end
