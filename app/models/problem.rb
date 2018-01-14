class Problem < ApplicationRecord
  belongs_to :lecture_time
  has_many :questions
end
