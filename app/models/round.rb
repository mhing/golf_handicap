class Round < ActiveRecord::Base
  belongs_to :course
  belongs_to :tee_box
  has_many :hole_statistics
  has_many :holes, through: :tee_box

  accepts_nested_attributes_for :course, :hole_statistics, :tee_box

  HOLES = 18

  def scorecard_metrics
    course_metrics + scoring_metrics
  end

  def course_metrics
    %w(yardage par handicap)
  end

  def scoring_metrics
    %w(score putts sand_shots
       penalties fir gir)
  end

  def statistics
    {
      length: length,
      par: par,
      score: score,
      "fir_%": fir_percentage,
      "gir_%": gir_percentage,
      "scrambling_%": scrambling_percentage,
      "sand_save_%": sand_save_percentage,
      putts: putts,
      eagles: eagles,
      birdies: birdies,
      pars: pars,
      bogies: bogies,
      "2_bogies_+": bogies_plus
    }
  end

  def length
    holes.sum(:yardage)
  end

  def par
    holes.sum(:par)
  end

  def putts
    hole_statistics.sum(:putts)
  end

  def eagles
    hole_statistics.select{|hole_stat| (hole_stat.hole.par - 2) == hole_stat.score }.size
  end

  def birdies
    hole_statistics.select{|hole_stat| (hole_stat.hole.par - 1) == hole_stat.score }.size
  end

  def pars
    hole_statistics.select{|hole_stat| hole_stat.hole.par == hole_stat.score }.size
  end

  def bogies
    hole_statistics.select{|hole_stat| (hole_stat.hole.par + 1) == hole_stat.score }.size
  end

  def bogies_plus
    hole_statistics.select{|hole_stat| (hole_stat.hole.par + 2) >= hole_stat.score }.size
  end

  def fir_percentage
    100 * fairways_hit.to_f / possible_fairways.to_f
  end

  def gir_percentage
    100 * greens_hit.to_f / 18.0
  end

  def scrambling_percentage
    greens_missed == 0 ? 0 : 100 * scrambled.to_f / greens_missed.to_f
  end

  def sand_save_percentage
    sand_shots == 0 ? 0 : 100 * sand_saves.to_f / sand_shots.to_f
  end

  private

  def fairways_hit
    hole_statistics.select{|hole_stat| hole_stat.fir && hole_stat.hole.par > 3}.size
  end

  def possible_fairways
    holes.select{|hole| hole.par > 3}.size
  end

  def greens_hit
    hole_statistics.select{|hole_stat| hole_stat.gir}.size
  end

  def greens_missed
    hole_statistics.select{|hole_stat| !hole_stat.gir}.size
  end

  def scrambled
    hole_statistics.select{|hole_stat| !hole_stat.gir && hole_stat.score <= hole_stat.hole.par}.size
  end

  def sand_shots
    hole_statistics.select{|hole_stat| hole_stat.sand_shots > 0}.size
  end

  def sand_saves
    hole_statistics.select{|hole_stat| hole_stat.sand_shots > 0 && hole_stat.score <= hole_stat.hole.par}.size
  end

end
