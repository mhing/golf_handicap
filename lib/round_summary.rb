class RoundSummary
  def per_round_summary(rounds)
    round_stats = []
    rounds.each do |round|
      round_stats << {
        
      }
    end

    round_stats
  end

  private

  def per_round_stats
    %w(length par).concat shared_stats
  end

  def shared_stats
    %w(score fir_% gir_% missed_gir scrambling_% sand_save_%
       putts eagles	birdies	pars bogies 2_bogies_+)
  end
end
