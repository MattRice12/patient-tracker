class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
