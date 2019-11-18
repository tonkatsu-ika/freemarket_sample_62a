class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.bigint :user, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
