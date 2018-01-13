class Lecture < ApplicationRecord
  has_many :lecture_years
  validates :name,  presence: true,
                    length: { maximum: 32 },
                    uniqueness: true
end
