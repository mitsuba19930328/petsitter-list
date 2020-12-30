class ChangeRateDefaultOnReviews < ActiveRecord::Migration[6.0]
  def up
    change_column :reviews, :rate, :float, default: 0
  end

  def down
    change_column :reviews, :rate, :float
  end
end
