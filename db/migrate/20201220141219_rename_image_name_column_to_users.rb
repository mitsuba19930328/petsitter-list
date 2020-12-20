class RenameImageNameColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :image_name, :image
  end
end
