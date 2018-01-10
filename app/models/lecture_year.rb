class LectureYear < ApplicationRecord
  belongs_to :lecture
  has_many :lecture_times
end
