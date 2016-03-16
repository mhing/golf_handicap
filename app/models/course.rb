class Course < ActiveRecord::Base
  has_many :rounds, dependent: :destroy

  def location
    "#{city}, #{state}"
  end
end
