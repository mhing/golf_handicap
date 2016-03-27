class LandingController < ApplicationController
  RECENT_ROUNDS = 5

  def index
    @rounds = Round.order(date_played: :desc)
    @recent_rounds = @rounds.limit(RECENT_ROUNDS)
    @statistics = overall_stats
    @per_round_statistics = per_round_stats
    @hole_breakdown_statistics = per_hole_stats

    summary = RoundSummary.new
    @per_round_summary = summary.per_round_summary(@rounds)

    debugger
  end

  private

  def overall_stats
    %w(rounds).concat shared_stats
  end

  def per_round_stats
    %w(length par).concat shared_stats
  end

  def shared_stats
    %w(score fir_% gir_% missed_gir scrambling_% sand_save_%
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
