class Course < ActiveRecord::Base
  has_many :rounds, dependent: :destroy

  def location
    "#{city}, #{state}"
  end

  def self.details
    %w(name city state)
  end

  def self.statistics
    %w(date_played tee_box rating slope score)
  end
end
