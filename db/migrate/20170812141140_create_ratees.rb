class CreateRatees < ActiveRecord::Migration
  def change
    create_table :ratees do |t|
      t.integer :rate
      t.references :kapp, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
