class LectureTime < ApplicationRecord
  belongs_to  :lecture_year
  has_many :problems
  has_many :progresses
  accepts_nested_attributes_for :problems, allow_destroy: true

  validates   :time,            numericality: {
                                  greater_than: 0,
                                  less_than: 256
                                }
  validates   :title,           presence: true,
                                length: { maximum: 32 }
end
