class LectureTime < ApplicationRecord
  belongs_to  :lecture_year
  has_many :problems

  validates   :time,            presence: true,
                                length: { in: 0..255 }
  validates   :title,           presence: true,
                                length: { maximum: 256 }
end
