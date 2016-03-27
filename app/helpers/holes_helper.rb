module HolesHelper
  def display_metric(hole, metric)
    case metric
    when 'fir', 'gir'
      hole.send(metric) ? 'X' : ''
    else
      hole.send(metric)
    end
  end
end
