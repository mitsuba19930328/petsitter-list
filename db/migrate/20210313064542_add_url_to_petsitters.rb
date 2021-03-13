class AddUrlToPetsitters < ActiveRecord::Migration[6.0]
  def change
    add_column :petsitters, :url, :string
  end
end
