class LectureYear < ApplicationRecord
  belongs_to :lecture
  has_many :lecture_times
  has_many :students
  has_many :users, through: :students

  validates :year,            presence: true
  validates :style,           presence: true,
                              inclusion: { in: %w(個人 グループ) }
end
