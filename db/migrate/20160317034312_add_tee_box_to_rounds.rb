class AddTeeBoxToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :tee_box, :string
  end
end
