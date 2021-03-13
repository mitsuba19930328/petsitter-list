class RemoveEmailFromPetsitters < ActiveRecord::Migration[6.0]
  def up
    remove_column :petsitters, :email
  end

  def down
    add_column :petsitters, :email, :string
  end
end
