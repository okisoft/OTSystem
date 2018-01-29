class LectureTime < ApplicationRecord
  belongs_to  :lecture_year
  has_many :problems
  has_many :progresses

  attr_accessor :problem_num

  validates   :time,            numericality: {
                                  greater_than: 0,
                                  less_than: 256
                                }
  validates   :title,           presence: true,
                                length: { maximum: 32 }
  validates   :problem_num,     format: {
                                  with: /\A\d+\z/,
                                  allow_blank: true
                                }
end
