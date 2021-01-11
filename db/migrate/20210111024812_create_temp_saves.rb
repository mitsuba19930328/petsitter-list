class CreateTempSaves < ActiveRecord::Migration[6.0]
  def change
    create_table :temp_saves do |t|
      t.references :user, null: false, foreign_key: true
      t.references :petsitter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
