class MigrateStatsToHoleStatistics < ActiveRecord::Migration
  def up
    Hole.all.each do |h|
      hs = HoleStatistic.new(round_id: h.round_id, hole_id: h.id)
      %w(fir gir penalties putts sand_shots score).each do |metric|
        hs.send("#{metric}=", h.send(metric))
      end
      hs.save!
    end
  end

  def down
  end
end
