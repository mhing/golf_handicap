class Hole < ActiveRecord::Base
  belongs_to :tee_box
  has_many :hole_statistics
  acts_as_list scope: :tee_box
end
