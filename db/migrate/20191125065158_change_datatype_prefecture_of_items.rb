class ChangeDatatypePrefectureOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :prefecture, 'string'
  end
end
