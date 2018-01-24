class Achievment < ApplicationRecord
  belongs_to :user
  belongs_to :problem
  validates :achieved,         inclusion: { in: [true, false] }
end
