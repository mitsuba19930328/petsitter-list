class AddIndexToPetsittersEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :petsitters, :email, unique: true
  end
end
