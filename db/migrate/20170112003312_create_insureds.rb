class CreateInsureds < ActiveRecord::Migration[5.0]
  def change
    create_table :insureds do |t|
      t.belongs_to :day, foreign_key: true

      t.timestamps
    end
  end
end
