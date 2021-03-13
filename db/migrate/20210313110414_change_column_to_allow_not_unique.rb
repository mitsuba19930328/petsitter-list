class ChangeColumnToAllowNotUnique < ActiveRecord::Migration[6.0]
  def up
    change_column :petsitters, :email,:string, unique: false
  end

  def down
    change_column :petsitters, :email,:string, unique: true
  end
end
