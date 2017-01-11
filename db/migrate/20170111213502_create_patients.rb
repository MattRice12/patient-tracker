class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.belongs_to :day, foreign_key: true
      t.boolean :insured

      t.timestamps
    end
  end
end
