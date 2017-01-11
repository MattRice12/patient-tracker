class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :month, foreign_key: true

      t.date :date
      t.integer :insured
      t.integer :uninsured

      t.timestamps
    end
  end
end
