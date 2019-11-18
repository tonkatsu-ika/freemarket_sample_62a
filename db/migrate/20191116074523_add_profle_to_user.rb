class AddProfleToUser < ActiveRecord::Migration[5.2]
  def change  
    add_column :users, :profile, :text , null: true
  end
end
