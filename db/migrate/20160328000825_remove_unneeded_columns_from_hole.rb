class RemoveUnneededColumnsFromHole < ActiveRecord::Migration
  def change
    remove_column :holes, :fir
    remove_column :holes, :gir
    remove_column :holes, :penalties
    remove_column :holes, :putts
    remove_column :holes, :round_id
    remove_column :holes, :sand_shots
    remove_column :holes, :score
  end
end
