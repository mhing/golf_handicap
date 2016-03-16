class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :par
      t.integer :handicap
      t.integer :yardage
      t.boolean :fir
      t.boolean :gir
      t.integer :score
      t.integer :putts
      t.integer :penalties
      t.integer :sand_shots
      t.integer :round_id

      t.timestamps null: false
    end
  end
end
