class AddIndexes < ActiveRecord::Migration
  def change
    add_index :holes, :tee_box_id
    add_index :hole_statistics, :hole_id
    add_index :hole_statistics, :round_id
    add_index :rounds, :tee_box_id
    add_index :tee_boxes, :course_id
  end
end
