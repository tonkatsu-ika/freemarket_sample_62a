class RemovePrefectureFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :prefecture
  end
end
