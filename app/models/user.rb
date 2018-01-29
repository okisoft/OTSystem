class User < ApplicationRecord
  has_many :students
  has_many :questions
  has_many :lecture_years, through: :students
  has_many :achievments
  has_many :progresses
  has_many :problems, through: :achievments

  validates :user_id,     presence: true,
                          length: { maximum: 32 },
                          uniqueness: true
  validates :name,        presence: true,
                          length: { maximum: 16 }
  validates :authority,   presence: true,
                          numericality: {
                            greater_than: 0,
                            less_than: 4
                          }
  validates :password,    presence: true,
                          length: { in: 6..64 }

  has_secure_password

  def icon(lecture_time)
    self.progresses.find_by(lecture_time_id: lecture_time.id).icon
  end

  def count_not_reply_question(problem)
    self.questions.where(problem_id: problem).where(reply: nil).count
  end

  def admin?
    self.authority == 1
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
