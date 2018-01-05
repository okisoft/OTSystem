class User < ApplicationRecord
  validates :user_id,     presence: true,
                          length: { maximum: 255 },
                          uniqueness: true
  validates :name,        presence: true,
                          length: { maximum: 255 }
  validates :authority,   presence: true,
                          numericality: {
                            greater_than: 0,
                            less_than: 4
                          }
  validates :password,    presence: true,
                          length: { minimum: 6 }

  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
