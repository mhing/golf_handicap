class CreateTeeBoxes < ActiveRecord::Migration
  def change
    create_table :tee_boxes do |t|
      t.decimal :rating
      t.integer :slope
      t.string :name
      t.integer :course_id
      t.integer :round_id

      t.timestamps null: false
    end
  end
end
