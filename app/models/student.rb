class Student < ApplicationRecord
  belongs_to :user
  belongs_to :lecture_year
end
