class TeeBox < ActiveRecord::Base
  has_many :rounds
  has_many :holes, -> { order(position: :asc) }, dependent: :destroy
  belongs_to :course

  def self.statistics
    %w(name rating slope)
  end
end
