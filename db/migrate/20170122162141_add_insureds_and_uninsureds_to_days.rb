class AddInsuredsAndUninsuredsToDays < ActiveRecord::Migration[5.0]
  def change
    add_column :days, :insureds, :integer
    add_column :days, :uninsureds, :integer
  end
end
