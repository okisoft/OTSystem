class Group < ApplicationRecord
  belongs_to :lecture_year

  validates :name,        presence: true,
                          length: { maximum: 16 }
end
