class AddColumnsToPetsitters < ActiveRecord::Migration[6.0]
  def change
    add_column :petsitters, :overview, :string
    add_column :petsitters, :area, :string
  end
end
