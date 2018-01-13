class LectureYear < ApplicationRecord
  belongs_to :lecture
  has_many :lecture_times
  validates :year,            presence: true
  validates :style,           presence: true,
                              inclusion: { in: %w(個人 グループ) }
end
