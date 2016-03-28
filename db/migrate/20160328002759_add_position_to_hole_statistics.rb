class AddPositionToHoleStatistics < ActiveRecord::Migration
  def change
    add_column :hole_statistics, :position, :integer
  end
end
