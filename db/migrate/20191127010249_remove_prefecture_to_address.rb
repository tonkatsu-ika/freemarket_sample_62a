class RemovePrefectureToAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :prefecture
  end
end
