class Progress < ApplicationRecord
  belongs_to :lecture_time
  belongs_to :user,         optional: true

  validates :icon,      numericality: {
                          greater_than_or_equal_to: 0,
                          less_than: 3
                        }
end
