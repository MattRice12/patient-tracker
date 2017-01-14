class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.belongs_to :month, foreign_key: true
      t.boolean :locked, default: true


      t.date :date

      t.timestamps
    end
  end
end
