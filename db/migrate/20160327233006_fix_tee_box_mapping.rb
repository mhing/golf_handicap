class FixTeeBoxMapping < ActiveRecord::Migration
  def change
    add_column :rounds, :tee_box_id, :integer
    remove_column :tee_boxes, :round_id
  end
end
