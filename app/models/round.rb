class Round < ActiveRecord::Base
  belongs_to :course
  belongs_to :tee_box
  has_many :hole_statistics

  accepts_nested_attributes_for :course, :holes, :tee_box

  HOLES = 18

  def scorecard_metrics
    course_metrics + scoring_metrics
  end

  def course_metrics
    %w(yardage par handicap)
  end

  def scoring_metrics
    %w(score putts fir gir
       sand_shots penalties)
  end

  def length
    holes.sum(:yardage)
  end
end
