class CreateHoleStatistics < ActiveRecord::Migration
  def change
    create_table :hole_statistics do |t|
      t.boolean :fir
      t.boolean :gir
      t.integer :penalties
      t.integer :putts
      t.integer :sand_shots
      t.integer :score
      t.integer :hole_id
      t.integer :round_id

      t.timestamps null: false
    end
  end
end
