class RemoveStatusToTransaction < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions , :transaction_status, :int
  end
end
