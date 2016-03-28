class RemoveTeeboxFromRound < ActiveRecord::Migration
  def change
    remove_column :rounds, :rating
    remove_column :rounds, :slope
    remove_column :rounds, :tee_box
  end
end
