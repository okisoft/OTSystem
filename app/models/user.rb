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
end
