module HoleStatisticsHelper
  def display_metric(hole_statistic, metric)
    if %w(fir gir).include? metric
      content_tag(:i, hole_statistic.send(metric) ? 'done' : '', class:'material-icons')
    elsif hole_statistic.scoring_metrics.include? metric
      hole_statistic.send(metric)
    else
      hole_statistic.hole.send(metric)
    end
  end
end
