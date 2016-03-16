class Round < ActiveRecord::Base
  belongs_to :course
  has_many :holes, dependent: :destroy

  accepts_nested_attributes_for :course
end
