class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.date :date_played
      t.integer :score
      t.decimal :rating
      t.integer :slope
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
