class Problem < ApplicationRecord
  belongs_to :lecture_time
  has_many :questions
  has_many :achievments
  has_many :users, through: :achievments

  validates :name,      presence: true,
                        length: { maximum: 8 }
  validates :content,   presence: true,
                        length: { maximum: 512}

  def achievment?(user)
    !self.users.find_by(id: user.id).nil?
  end
end
