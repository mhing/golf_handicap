class TeeBox < ActiveRecord::Base
  has_many :rounds
  has_many :holes, -> { order(position: :asc) }, dependent: :destroy
  belongs_to :course

  accepts_nested_attributes_for :holes

  def self.statistics
    %w(name rating slope)
  end

  def self.details
    %w(name yardage rating slope)
  end

  def hole_metrics
    %w(yardage handicap par)
  end

  def yardage
    holes.sum(:yardage)
  end
end
