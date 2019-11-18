class ChangeTelephoneToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :telephone, :string ,null: true
  end
end
