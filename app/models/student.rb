class Student < ApplicationRecord
  belongs_to :user
  belongs_to :lecture_year

  validate :check_user_authority

  private

    def check_user_authority
      user = self.user
      if !user.nil? && user.authority != 3
        errors.add(:user, "authority is invalid value")
      end
    end
end
