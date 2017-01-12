class CreateUninsureds < ActiveRecord::Migration[5.0]
  def change
    create_table :uninsureds do |t|
      t.belongs_to :day, foreign_key: true

      t.timestamps
    end
  end
end
