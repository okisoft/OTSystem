class Lecture < ApplicationRecord
  has_many :lecture_years
  accepts_nested_attributes_for :lecture_years
  validates :name,  presence: true,
                    length: { maximum: 32 },
                    uniqueness: true

  def latest_year
    self.lecture_years.find_by(year: Date.today.financial_year)
  end
end
