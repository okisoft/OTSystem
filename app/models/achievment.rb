class Achievment < ApplicationRecord
  belongs_to :user
  belongs_to :problem
  validate :achieved,         presence: true,
                              inclusion: { in: [true, false] }
end
