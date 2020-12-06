class CreatePetsitters < ActiveRecord::Migration[6.0]
  def change
    create_table :petsitters do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :address, null: false
      t.string :prefecture, null: false
      t.string :town, null: false
      t.string :phone, null: false
      t.string :business_hours
      t.string :regular_holiday
      t.string :pet_type, null: false
      t.string :qualification
      t.string :registration_number
      t.boolean :insurance, null: false, default: false

      t.timestamps
    end
  end
end
