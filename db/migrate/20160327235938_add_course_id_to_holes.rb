class AddCourseIdToHoles < ActiveRecord::Migration
  def change
    add_column :holes, :tee_box_id, :integer
  end
end
