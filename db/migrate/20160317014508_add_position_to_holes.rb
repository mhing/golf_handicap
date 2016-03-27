class AddPositionToHoles < ActiveRecord::Migration
  def change
    add_column :holes, :position, :integer
  end
end
