class HoleStatistic < ActiveRecord::Base
  belongs_to :round
  belongs_to :hole

  def scoring_metrics
    %w(score putts sand_shots
       penalties fir gir)
  end
end
