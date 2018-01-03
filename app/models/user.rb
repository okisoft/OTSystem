class User < ApplicationRecord
  validates :user_id,     presence: true,
                          length: { maximum: 255 }
  validates :name,        presence: true,
                          length: { maximum: 255 }
  validates :authority,   presence: true,
                          length: { in: 1..3 }
  validates :password,    presence: true,
                          length: { minimum: 6 }

  has_secure_password
end
