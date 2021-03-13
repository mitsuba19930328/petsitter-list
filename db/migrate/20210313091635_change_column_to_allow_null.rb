class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]
  def up
    change_column :petsitters, :email,:string, null: true
  end

  def down
    change_column :petsitters, :email,:string, null: false
  end
end
