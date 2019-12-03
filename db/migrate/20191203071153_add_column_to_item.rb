class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items , :transaction_status, :int, default: 1
  end
end
