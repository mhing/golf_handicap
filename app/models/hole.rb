class Hole < ActiveRecord::Base
  belongs_to :round
  acts_as_list scope: :round
end
