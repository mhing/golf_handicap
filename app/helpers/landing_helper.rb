module LandingHelper
  def display_regulation_stat(stat)
    stat = stat.humanize
    stat.gsub!('gir', 'GIR')
    stat.gsub!('fir', 'FIR')
    stat.gsub!('Gir', 'GIR')
    stat.gsub!('Fir', 'FIR')

    stat
  end
end
