class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :size, null: false, index: true, unique: true

      t.timestamps
    end
  end
end
