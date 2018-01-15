class Problem < ApplicationRecord
  belongs_to :lecture_time
  has_many :questions
  validates :name,      presence: true,
                        length: { maximum: 8 }
  validates :content,   presence: true,
                        length: { maximum: 512}
end
