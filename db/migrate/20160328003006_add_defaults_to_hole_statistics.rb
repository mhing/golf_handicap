class AddDefaultsToHoleStatistics < ActiveRecord::Migration
  def up
    change_column_default(:hole_statistics, :fir, false)
    change_column_default(:hole_statistics, :gir, false)
    change_column_default(:hole_statistics, :penalties, 0)
    change_column_default(:hole_statistics, :sand_shots, 0)
  end

  def down
    change_column_default(:hole_statistics, :fir, nil)
    change_column_default(:hole_statistics, :gir, nil)
    change_column_default(:hole_statistics, :penalties, nil)
    change_column_default(:hole_statistics, :sand_shots, nil)
  end
end
