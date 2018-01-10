class PublicLecture < ApplicationRecord
  belongs_to :User, required: false
  belongs_to :Lecture, required: false
  belongs_to :LectureTime, required: false
end
