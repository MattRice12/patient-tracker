class AddInsuredCounterToDays < ActiveRecord::Migration[5.0]
  def change
    add_column :days, :insureds_count, :integer
  end
end
