class PublicLecture < ApplicationRecord
  belongs_to :user,             optional: true
  belongs_to :lecture,          optional: true
  belongs_to :lecture_time,     optional: true
end
