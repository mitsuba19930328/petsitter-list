class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.float :rate, null: false
      t.references :user, null: false, foreign_key: true
      t.references :petsitter, null: false, foreign_key: true
      t.timestamps
    end
  end
end
