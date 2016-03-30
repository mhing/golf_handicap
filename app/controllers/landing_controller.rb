class LandingController < ApplicationController
  RECENT_ROUNDS = 5

  def index
    @rounds = Round.order(date_played: :desc)
    @recent_rounds = @rounds.limit(RECENT_ROUNDS)
    @statistics = overall_stats
    @per_round_statistics = per_round_stats
    @hole_breakdown_statistics = per_hole_stats
    @per_round_summary = @rounds.map(&:statistics)

    @overall_summary = Hash.new(0)
    @per_round_summary.each do |summary|
      summary.each do |stat, val|
        @overall_summary[stat] += val
      end
    end

    round_count = @rounds.size
    @overall_summary.each do |stat, value|
      @overall_summary[stat] = value.to_f / round_count
    end

    @overall_summary[:rounds] = round_count
  end

  private

  def overall_stats
    %w(rounds).concat shared_stats
  end

  def per_round_stats
    %w(length par).concat shared_stats
  end

  def shared_stats
    %w(score fir_% gir_% scrambling_% sand_save_%
       putts eagles	birdies	pars bogies 2_bogies_+)
  end

  def per_hole_stats
    %w(breakdown min_metric max_metric #_holes avg_score score_to_par fir_% gir_%
       scrambling_% sand_save% putting_per_hole putting_per_gir)
  end

  def hole_breakdowns
    ['Par 3', 'Par 4', 'Par 5', 'Handicap']
  end
end
