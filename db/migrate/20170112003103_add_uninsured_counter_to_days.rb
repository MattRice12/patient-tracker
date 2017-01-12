class AddUninsuredCounterToDays < ActiveRecord::Migration[5.0]
  def change
    add_column :days, :uninsureds_count, :integer
  end
end
