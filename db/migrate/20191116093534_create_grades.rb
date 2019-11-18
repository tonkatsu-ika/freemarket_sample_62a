class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.string :grade, null: false, unique: true

      t.timestamps
    end
  end
end
