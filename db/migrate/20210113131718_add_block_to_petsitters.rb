class AddBlockToPetsitters < ActiveRecord::Migration[6.0]
  def change
    add_column :petsitters, :block, :string
  end
end
