class AddApartmentToPetsitters < ActiveRecord::Migration[6.0]
  def change
    add_column :petsitters, :apartment, :string
  end
end
