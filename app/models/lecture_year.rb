class LectureYear < ApplicationRecord
  belongs_to :lecture
  has_many :lecture_times
  has_many :progresses
  has_many :students
  has_many :users, through: :students
  accepts_nested_attributes_for :lecture_times

  validates :year,            presence: true
  validates :style,           presence: true,
                              inclusion: { in: %w(個人 グループ) }
  validate :check_year

  private

    def check_year
      if self.year != Date.today.financial_year
        errors.add(:year, "year is invalid value")
      end
    end
end
