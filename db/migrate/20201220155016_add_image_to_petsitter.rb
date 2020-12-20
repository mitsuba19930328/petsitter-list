class AddImageToPetsitter < ActiveRecord::Migration[6.0]
  def change
    add_column :petsitters, :image, :string
  end
end
