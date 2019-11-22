class RemoveProfileToUser < ActiveRecord::Migration[5.2]
  
  def down
    remove_column :users, :profile, :text 
  end

end
