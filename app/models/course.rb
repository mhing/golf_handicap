class Course < ActiveRecord::Base
  has_many :rounds, dependent: :destroy
  has_many :tee_boxes, dependent: :destroy

  def location
    "#{city}, #{state}"
  end

  def self.details
    %w(name city state)
  end

  def self.statistics
    %w(date_played name rating slope score)
  end
end
