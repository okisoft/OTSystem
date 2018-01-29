class Problem < ApplicationRecord
  belongs_to :lecture_time
  has_many :questions, dependent: :delete_all
  has_many :achievments, dependent: :delete_all
  has_many :users, through: :achievments

  validates :name,      presence: true,
                        length: { maximum: 8 }
  validates :content,   length: { maximum: 512}

  def achievment?(user)
    self.achievments.find_by(user_id: user.id).achieved
  end
end
