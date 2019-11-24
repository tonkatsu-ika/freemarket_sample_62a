class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.bigint :user_id
      t.references :item, foreign_key: true

      t.timestamps
    end
    add_foreign_key :likes, :users, column: :user_id
  end
end
