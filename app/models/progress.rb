class Progress < ApplicationRecord
  belongs_to :lecture_time
  belongs_to :user,         optional: true

  validates :icon,      numericality: {
                          greater_than: 0,
                          less_than: 4
                        }
end
