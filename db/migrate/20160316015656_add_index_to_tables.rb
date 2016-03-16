class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :holes, :round_id
    add_index :rounds, :course_id
  end
end
