class PublicLecture < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :lecture, required: false
  belongs_to :lecture_time, required: false
end
